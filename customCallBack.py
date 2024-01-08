from stable_baselines3.common.callbacks import BaseCallback, EvalCallback
from stable_baselines3.common.evaluation import evaluate_policy
import numpy as np
import torch


class CustomCallback(BaseCallback):
    """
    A custom callback that derives from ``BaseCallback``.

    :param verbose: Verbosity level: 0 for no output, 1 for info messages, 2 for debug messages
    """
    def __init__(self, verbose=0, re3=None, k=0):
        super().__init__(verbose)
        self.re3_module = re3
        self.state_list = []
        self.beta_start = 2
        self.beta = 0
        self.decay_rate = 0.01
        self.current_it = 0
        self.k = k
        

    def _on_training_start(self) -> None:
        """
        This method is called before the first rollout starts.
        """
        pass

    def _on_rollout_start(self) -> None:
        """
        A rollout is the collection of environment interaction
        using the current policy.
        This event is triggered before collecting new samples.
        """
        pass

    def _on_step(self) -> bool:
        """
        This method will be called by the model after each call to `env.step()`.

        For child callback (of an `EventCallback`), this will be called
        when the event is triggered.

        :return: If the callback returns False, training is aborted early.
        """
        return True


    def calculate_intrinsics(self):
        rollout_buffer = self.model.rollout_buffer
        n_steps = rollout_buffer.observations.shape[0]
        n_envs = rollout_buffer.observations.shape[1]
        intrinsic_rewards = np.zeros(shape=(n_steps, n_envs, 1))

        observations = torch.from_numpy(rollout_buffer.observations)
        with torch.no_grad():
            for env in range(n_envs):
                observation_feature = self.re3_module(observations[:, env])
                distance = torch.linalg.vector_norm(observation_feature.unsqueeze(1) - observation_feature, ord=2, dim=2)
                
                # Average the reward:
                for sub_k in range(self.k):
                    intrinsic_rewards[:, env, 0] += (torch.kthvalue(distance, sub_k + 1, dim=1).values + 1.).cpu().numpy()
                intrinsic_rewards[:, env, 0] /= self.k

        self.beta = 1.0
        return self.beta * intrinsic_rewards

    def _on_rollout_end(self) -> None:
        """
        This event is triggered before updating the policy.
        """
        # Using Re3:
        if self.k:
            intrinsics = self.calculate_intrinsics()
            # add intrinsic reward to rollout buffer
            self.model.rollout_buffer.rewards += intrinsics[:, :, 0]
            # self.model.ep_info_buffer.reward += intrinsics[:, :, 0]
        self.current_it += 1
        # use ep_len_mean and the sum of Re3 rewards to get a mean Re3 rew!!!
        # Since the intrinsic reward might result in bad exploration and PPO having no memory of older rollouts, it could be beneficial to save the best model
        # and return to this when the fitness drops over time, to attain the intrinsic memory of which explorations were bad. 

        nested_list = self.training_env.env_method("get_fit")
        fitnesses = [item for sublist in nested_list for item in sublist]
        lengths = self.training_env.env_method("get_len")
        mean_lengths = []
        for l in lengths:
            if l:
                mean_lengths.extend(l)

        self.logger.record("train/real_mean_ep_len", np.mean(mean_lengths))
        self.logger.record("train/fitness_score", np.mean(fitnesses))
        if self.k:
            mean_intrinsic_reward = np.sum(intrinsics[:, :, 0]) / np.mean(mean_lengths)
            self.logger.record("train/mean_episodic_Re3_reward", np.mean(mean_intrinsic_reward))
            self.logger.record("train/beta", self.beta)

        self.training_env.reset()
        
        episode_rewards, episode_lengths = evaluate_policy(
            self.model,
            self.training_env,
            n_eval_episodes=100,
            render=False,
            deterministic=True,
            return_episode_rewards=True,
            warn=True,
        )
        self.logger.record("train/mean_evaluation_reward", np.mean(episode_rewards))
        self.logger.record("train/mean_evaluation_length", np.mean(episode_lengths))
        self.training_env.reset()

        pass


    def _on_training_end(self) -> None:
        """
        This event is triggered before exiting the `learn()` method.
        """

        pass