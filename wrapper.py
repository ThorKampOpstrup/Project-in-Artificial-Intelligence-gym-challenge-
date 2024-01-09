from math import exp, inf
import gymnasium as gym
from gymnasium.core import Env
import torch

import numpy as np


class Wrapper(gym.Wrapper):
    def __init__(self, env: Env, encoder):
        super(Wrapper, self).__init__(env)
        # Add other initial stuff here
        # self.input_dim = (n_states, obs_space)  #should be an array where [0] and [1] are the sizes

        self.state_pair = []    # A rolling buffer of two subsequent states
        self.state_list = []    # to train the intrinsic module after each rollout
        self.state_lists = []

        self.fitlist = []
        self.fit_mean_list = []
        self.dist_est_list = []
        self.dist_est_list_mean_list = []
        self.mean_ep_len = []
        self.n_steps = 0

        self.beta_start = 1
        self.decay_rate = 0.01
        self.current_it = 0
        self.encoder = encoder
    
    def reset(self, **kwargs):
        # Modify the reset function if needed
        observation = self.env.reset(**kwargs)
        self.n_steps = 0
        self.state_pair = []    # A rolling buffer of two subsequent states
        self.state_list = []    # to train the intrinsic module after each rollout
        self.state_lists = []


        # self.dist_est_list = []
        # self.dist_est_list_mean_list = []

        return observation
    
    def step(self, action):
        obs, reward, done, truncated, info = self.env.step(action)
        self.done = done
        self.truncated = truncated
        self.state_list.append(obs)
        self.state_pair.append(obs)
        self.fitlist.append(reward)
        self.n_steps += 1
        custom_reward = 0
        if len(self.state_pair) == 2:   # comment this section out to use generic PPO
            self.state_pair.pop(0)

        if done or truncated:
            if len(self.state_list) > 50:
                self.state_lists.append(self.state_list)
            self.state_list = []

            self.mean_ep_len.append(self.n_steps)

            self.dist_est_list_mean_list.append(np.sum(self.dist_est_list))
            self.fit_mean_list.append(np.sum(self.fitlist))
            self.dist_est_list = []
            self.fitlist = []

        return obs, custom_reward + reward, done, truncated, info    

    def get_fit(self):
        self.IEM_active = True
        fit = self.fit_mean_list
        self.fit_mean_list = []
        self.fitlist = []

        return fit
    
    def get_len(self):
        mean_len = self.mean_ep_len
        self.mean_ep_len = []
        self.n_steps = 0
        return mean_len
    
    def get_ir(self):
        ir = self.dist_est_list_mean_list
        self.dist_est_list_mean_list = []
        self.dist_est_list = []
        return ir
    
    def get_states(self):
        self.current_it += 1
        sl = self.state_lists
        self.state_lists = []
        return sl


