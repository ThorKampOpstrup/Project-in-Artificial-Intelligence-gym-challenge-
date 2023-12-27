from multiprocessing import freeze_support
import gymnasium as gym
from stable_baselines3 import PPO
from sb3_contrib import TRPO
# Noise class for TD3
from stable_baselines3.common.noise import NormalActionNoise, OrnsteinUhlenbeckActionNoise, VectorizedActionNoise
import os
from iem_wrapper import IEMWrapper
from stable_baselines3.common.env_util import make_vec_env
from stable_baselines3.common.vec_env import SubprocVecEnv
import torch
import numpy as np
from stable_baselines3.common.monitor import Monitor
import time
from multiprocessing import Pool
from iem import IEMModule 
from re3 import RandomEncoder
import argparse


def get_args():
    parser = argparse.ArgumentParser(description='AI Project')
    parser.add_argument('--log_dir', type=str, default='iem', help='Folder name to store the log')
    parser.add_argument('--re3_k', type=int, default=3, help='The k value for Re3, if 0 Re3 will not be used')
    parser.add_argument('--OU_noise_sigma', type=float, default=0.1, help='std-deviation for OrnsteinUhlenbeckActionNoise, if 0 regular gaussian noise will be used')
    parser.add_argument('--it', type=int, default=300, help='Number of desired iterations')
    parser.add_argument('--n_cores', type=int, default=8, help='Number of cores/environments')
    parser.add_argument('--n_steps', type=int, default=2024, help='Number of steps per environment per rollout')
    args = parser.parse_args()
    return args


from stable_baselines3.common.callbacks import BaseCallback, EvalCallback
from stable_baselines3.common.evaluation import evaluate_policy

class CustomCallback(BaseCallback):
    """
    A custom callback that derives from ``BaseCallback``.

    :param verbose: Verbosity level: 0 for no output, 1 for info messages, 2 for debug messages
    """
    def __init__(self, verbose=0, iem=None, re3=None, k=0):
        super().__init__(verbose)
        self.re3_module = re3
        self.intrinsic_module = iem
        self.state_list = []
        self.beta_start = 2
        self.beta = 0
        self.decay_rate = 0.01
        self.current_it = 0
        self.k = k
        # self.steps = 0
        

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
        # self.steps += 1 * self.training_env.num_envs
      
        
        # obs = self.locals['new_obs'][1] # Number one to get observations from environment[1] only
        # # print(obs)
        # self.state_list.append(obs)

        return True
    
    def calculate_intrinsics(self):
        rollout_buffer = self.model.rollout_buffer
        # print(rollout_buffer.observations.shape[0])
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
                
                # Dont average the reward:
                #intrinsic_rewards[:, env, 0] = (torch.kthvalue(distance, self.k, dim=1).values + 1.0).cpu().numpy()

        
        self.beta = self.beta_start * (1 - self.decay_rate) ** self.current_it
        return self.beta * intrinsic_rewards


    def _on_rollout_end(self) -> None:
        """
        This event is triggered before updating the policy.
        """
        # Using Re3:
        if self.k:
            intrinsics = self.calculate_intrinsics()
            self.model.rollout_buffer.rewards += intrinsics[:, :, 0]
        self.current_it += 1
        # use ep_len_mean and the sum of Re3 rewards to get a mean Re3 rew!!!
        # Since the intrinsic reward might result in bad exploration and PPO having no memory of older rollouts, it could be beneficial to save the best model
        # and return to this when the fitness drops over time, to attain the intrinsic memory of which explorations were bad. 
        

        # skal også have tjekket størrelsen af estimation error og muligvis fitte den til en funktion
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


        # nested_list = self.training_env.env_method("get_ir")
        # intrinsic_reward = [item for sublist in nested_list for item in sublist]
        # self.logger.record("train/intrinsic_reward", np.mean(intrinsic_reward))

        # self.state_list = self.training_env.env_method("get_states")
        # states_combined = []
        # for env_states in self.state_list:
        #     states_combined.extend(env_states)

        # loss_list = self.intrinsic_module.train(states_combined, num_epochs=256, steps_range=(1, 10), batch_size=64, lr=0.003)
        # self.logger.record("train/intrinsic_loss", np.mean(loss_list))
        # self.state_list = []
        # self.steps = 0
        self.training_env.reset()
        
        episode_rewards, episode_lengths = evaluate_policy(
            self.model,
            self.training_env,
            n_eval_episodes=self.training_env.num_envs,
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

if __name__ == '__main__':
    args = get_args()
    # Create folders
    save_root = "BipedalWalker-v3-iem-ppo"
    model_dir = f"AI_Project/data/{save_root}/models/"
    log_dir = f"AI_Project/data/{save_root}/logs/{args.log_dir}"
    if not os.path.exists(model_dir):
        os.makedirs(model_dir)

    if not os.path.exists(log_dir):
        os.makedirs(log_dir)

    n_env = args.n_cores

    env_name = 'BipedalWalker-v3'
    env = gym.make(env_name)
    obs_space = env.observation_space.shape[0]
    n_actions = env.action_space.shape[-1]
    OU_noise_sigma = args.OU_noise_sigma
    if OU_noise_sigma:
        print("Using OU Noise")
        action_noise = VectorizedActionNoise(OrnsteinUhlenbeckActionNoise(mean=np.zeros(n_actions), sigma=OU_noise_sigma * np.ones(n_actions), theta=0.1), n_env)
    else:
        print("Using Gaussian Noise")
        action_noise = NormalActionNoise(mean=np.zeros(n_actions), sigma=0.1 * np.ones(n_actions))
    if args.re3_k:
        print("Using Re3")
    env.close()
    iem_hidden_size = 64
    iem_module = IEMModule(obs_space, iem_hidden_size)
    re3_module = RandomEncoder(obs_space, 128)

    model_name = f'{args.log_dir}_k{args.re3_k}'    # missing sigma since floats are bad for file names...

    iterations = args.it
    n_steps_per_core = args.n_steps
    n_steps_per_update = n_env * n_steps_per_core
    total_timesteps = iterations * n_steps_per_update
    print(f"Training for {iterations} iterations with {n_steps_per_update} steps per update for a total of {total_timesteps} timesteps")
    # total_timesteps = 3000000
    # n_steps_per_update = 16192 # 8 * 2024 = 16192
    # n_steps_per_core = int(n_steps_per_update // n_env) # PPO needs this one
    freeze_support()
    env_fns = [lambda: Monitor(IEMWrapper(gym.make(env_name), iem_module, re3_module)) for _ in range(n_env)]
    env = SubprocVecEnv(env_fns)
    # model = TRPO('MlpPolicy', env, verbose=1, tensorboard_log=log_dir, n_steps=n_steps_per_core, batch_size=32)
    model = PPO('MlpPolicy', env, verbose=1, tensorboard_log=log_dir, n_steps=n_steps_per_core, batch_size=32, n_epochs=3)
    model.action_noise = action_noise

    IEMcallback = CustomCallback(iem=iem_module, re3=re3_module, k=args.re3_k)
    model.learn(total_timesteps=total_timesteps, callback=IEMcallback, progress_bar=True)
    model.save(model_dir + model_name)
    
    env.close()

    '''BipedalWalker-v3:
  normalize: true
  n_envs: 32
  n_timesteps: !!float 5e6
  policy: 'MlpPolicy'
  n_steps: 2048
  batch_size: 64
  gae_lambda: 0.95
  gamma: 0.999
  n_epochs: 10
  ent_coef: 0.0
  learning_rate: !!float 3e-4
  clip_range: 0.18
  
  BipedalWalkerHardcore-v3:
  normalize: true
  n_envs: 16
  n_timesteps: !!float 10e7
  policy: 'MlpPolicy'
  n_steps: 2048
  batch_size: 64
  gae_lambda: 0.95
  gamma: 0.99
  n_epochs: 10
  ent_coef: 0.001
  learning_rate: lin_2.5e-4
  clip_range: lin_0.2'''