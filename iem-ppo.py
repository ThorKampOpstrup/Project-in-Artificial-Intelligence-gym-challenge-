from multiprocessing import freeze_support
import gymnasium as gym
from stable_baselines3 import PPO
from sb3_contrib import TRPO
# Noise class for TD3
from stable_baselines3.common.noise import NormalActionNoise, OrnsteinUhlenbeckActionNoise
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
from customCallBack import CustomCallback


def def_args():
    
    parser = argparse.ArgumentParser(description='AI Project')
    
    parser.add_argument('--re3_k', type=int, default=0, help='The k value for Re3, if 0 Re3 will not be used')
    parser.add_argument('--OU_noise_sigma', type=float, default=0.1, help='std-deviation for OrnsteinUhlenbeckActionNoise, if 0 regular gaussian noise will be used')
    parser.add_argument('--it', type=int, default=300, help='Number of desired iterations')
    parser.add_argument('--n_cores', type=int, default=32, help='Number of cores/environments')
    parser.add_argument('--n_steps', type=int, default=int(2024/(32/8)), help='Number of steps per core per rollout')
    parser.add_argument('--env_name', type=str, default='BipedalWalker-v3', help='Name of environment to train on')
    parser.add_argument('--learning_rate', type=float, default=0.0003, help='Learning rate for the model')
    parser.add_argument('--n_epochs', type=int, default=3, help='Number of epochs for the model')
    
    
    parser.add_argument('--subdir', type=str, default='', help='Subdirectory to save model and logs in')
    
    #check if folder and name are given, if not, terminate with error
    requiredNamed = parser.add_argument_group('required named arguments')
    #required
    
    parser.add_argument('--theta', default=1, type=float, help='Theta for PPO', required=True)
    parser.add_argument('--sigma', default=0.1, type=float, help='Sigma for PPO', required=True)
    requiredNamed.add_argument('--path', type=str, default=None, help='Path to model to load', required=True)
    requiredNamed.add_argument('--log_name', type=str, default=None, help='Name of model to load', required=True)
    
    args = parser.parse_args()
    return args

if __name__ == '__main__':
    args = def_args()
    
    # Create folders
    # dir = "BipedalWalker-v3-iem-ppo"
    folder = args.path + '/' +args.subdir
    model_dir = f"{folder}/models/"
    log_dir = f"{folder}/logs/"
    if not os.path.exists(model_dir):
        os.makedirs(model_dir)

    if not os.path.exists(log_dir):
        os.makedirs(log_dir)

    env_name = args.env_name
    env = gym.make(env_name)
    obs_space = env.observation_space.shape[0]
    n_actions = env.action_space.shape[-1]
    OU_noise_sigma = args.OU_noise_sigma
    
    if OU_noise_sigma:
        print("Using OU Noise")
        action_noise = OrnsteinUhlenbeckActionNoise(mean=np.zeros(n_actions), sigma=OU_noise_sigma * np.ones(n_actions))
    else:
        print("Using Gaussian Noise")
        action_noise = NormalActionNoise(mean=np.zeros(n_actions), sigma=0.1 * np.ones(n_actions))
    if args.re3_k:
        print("Using Re3")
    env.close()
    
    iem_hidden_size = 64
    iem_module = IEMModule(obs_space, iem_hidden_size)
    re3_module = RandomEncoder(obs_space, 128)

    # model_name = f'{args.log_dir}_k{args.re3_k}'    # missing sigma since floats are bad for file names...
    model_name = f'{args.log_name}'
    print(f"Saving model as {model_name}")
    
    iterations = args.it
    n_env = args.n_cores
    n_steps_per_core = args.n_steps
    n_steps_per_update = n_env * n_steps_per_core
    total_timesteps = iterations * n_steps_per_update
    print(f"Training for {iterations} iterations with {n_steps_per_update} steps per update for a total of {total_timesteps} timesteps")
    # total_timesteps = 3000000
    # n_steps_per_update = 16192 # 8 * 2024 = 16192
    # n_steps_per_core = int(n_steps_per_update // n_env) # PPO needs this one
    freeze_support()
    env_name = args.env_name
    env_fns = [lambda: Monitor(IEMWrapper(gym.make(env_name), iem_module, re3_module)) for _ in range(n_env)]
    env = SubprocVecEnv(env_fns)
    
    model = TRPO('MlpPolicy', env, verbose=1, tensorboard_log=log_dir, n_steps=n_steps_per_core, batch_size=n_env, theta=args.theta, sigma=args.sigma, learning_rate=args.learning_rate)
    # model = PPO('MlpPolicy', env, verbose=1, tensorboard_log=log_dir, n_steps=n_steps_per_core, batch_size=n_env, n_epochs=args.n_epochs, learning_rate=args.learning_rate, theta=args.theta, sigma=args.sigma)
    model.action_noise = action_noise

    IEMcallback = CustomCallback(iem=iem_module, re3=re3_module, k=args.re3_k)
    
    model.learn(total_timesteps=total_timesteps, callback=IEMcallback, progress_bar=True)
    model.save(model_dir + model_name)
    
    env.close()
    
    #find the newest folder in the folder and rename it
    folders = os.listdir(log_dir)
    folders.sort(key=lambda x: os.path.getmtime(log_dir + '/' + x))
    folder_name = folders[-1]
    print(folder_name)
    os.rename(log_dir + '/' + folder_name, log_dir + '/' + model_name)

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
  
  #/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python /home/thops19/Documents/9semester/Project-in-Artificial-Intelligence-gym-challenge-/iem-ppo.py --path tmp/tmp --log_name sigma_0.01_theta_1 --sigma 0.1 --theta 1 --n_steps 2024