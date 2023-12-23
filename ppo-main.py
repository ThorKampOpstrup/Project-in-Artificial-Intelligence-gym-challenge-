'''
https://stable-baselines3.readthedocs.io/en/master/modules/ppo.html#stable_baselines3.ppo.MultiInputPolicy

deterministic=True for PPO agenten'''
from gc import freeze
from multiprocessing import freeze_support
import gymnasium as gym
from stable_baselines3 import PPO
import multiprocessing
import os
import time
# from Autoencoder import Autoencoder, train_autoencoder
from env_wrapper import CustomEnvironmentWrapper
from stable_baselines3.common.env_util import make_vec_env
from stable_baselines3.common.vec_env import SubprocVecEnv
import CustomCallback


# model_dir = "PPO/models/model"
# log_dir = "PPO/logs"
# autoencoder_dir = "PPO/autoencoders"
save_root = "BipedalWalker-v3"
model_dir = f"PPO/{save_root}/models/"
log_dir = f"PPO/{save_root}/logs"
if not os.path.exists(model_dir):
    os.makedirs(model_dir)

if not os.path.exists(log_dir):
    os.makedirs(log_dir)

#env = gym.make('BipedalWalker-v3')
#env = CustomEnvironmentWrapper(env)

if __name__ == '__main__':
    env_name = 'BipedalWalker-v3'
    encoder_rollouts = 100  # amount of simulations to be used to train the autoencoder
    n_states = 32 # amount of states the autoencoder should use as a sequence
    freeze_support()

    # for i in range(5):   # Number of novel policies to be trained
    # Create a list of functions, each creating an environment
    # CustomEnvironmentWrapper should have a self.autoencoder -> env.autoencoder / env.train_autoencoder -Would not work as we create 8 of these environments
    # # as well as checking if some autoencoder folder contains previously trained autoencoders
    #load amount of cores from system
    # cores = multiprocessing.cpu_count()
    envs = 32
    env_fns = [lambda: CustomEnvironmentWrapper(gym.make(env_name)) for _ in range(envs)]  # Adjust the number of environments as needed

    # Create the parallelized vectorized environment
    # Possible issue with multiple envs when training a single autoencoder?
    # it might just train in parallel
    env = SubprocVecEnv(env_fns)

    #! bathc size 256
    #! nepochs 20
    model = PPO('MlpPolicy', env, verbose=1, tensorboard_log=log_dir, batch_size=276, n_epochs=20)

    # model.learn(total_timesteps=200000000, progress_bar=True)
    CustomCallback()
    model.learn(total_timesteps=200000, progress_bar=True)
    
    all_entries = os.listdir(log_dir)
    # Filter out files, keep only directories
    directories = [d for d in all_entries if os.path.isdir(os.path.join(log_dir, d))]
    # Sort directories by creation time (or modification time)
    newest_directory = max(directories, key=lambda x: os.path.getctime(os.path.join(log_dir, x)))
    model.save(model_dir + str(newest_directory) + "_model")
    #state_list = []
    #for rollouts in range(encoder_rollouts):
    #    env_single = gym.make(env_name)
    #    obs, _ = env.reset()
    #    while True:
    #        action = model.predict(obs)
    #        obs, reward, terminated, truncated, info = env.step(action[0])
    #        state_list.append(obs)
    #        if(terminated or truncated):
    #            break
    
    # autoencoder = Autoencoder((n_states, env.observation_space.shape[0]))
    # train_autoencoder(autoencoder, state_list, n_states)

    # del env_fns
    # del env
    # del model
    # model = PPO.load(model_dir)

    # Possible solution could be to train ppo and autoencoder one at a time

    env = gym.make('BipedalWalker-v3', render_mode='human')
    obs, _ = env.reset()


    rewards = 0
    timestep_cnt = 0
    while True:
        action = model.predict(obs)
        obs, reward, terminated, truncated, info = env.step(action[0])
        rewards += reward
        timestep_cnt += 1

        if(terminated or truncated):
            print(f"reward: {round(rewards, 1)}    ::    timestep: {timestep_cnt}")
            timestep_cnt = 0
            rewards = 0
            obs, _ = env.reset()

    '''PPO policies: MlpPolicy, CnnPolicy, MultiInputPolicy'''