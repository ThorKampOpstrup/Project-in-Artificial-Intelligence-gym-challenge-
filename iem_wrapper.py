from math import exp, inf
import gymnasium as gym
from gymnasium.core import Env
import torch

import numpy as np
# from dataPlotter import DataPlotter



class IEMWrapper(gym.Wrapper):
    def __init__(self, env: Env, iem, encoder):
        super(IEMWrapper, self).__init__(env)
        # Add other initial stuff here
        # self.IEMplotter = DataPlotter("Novelty reward (no weight)", "Mini-batch", "Novelty score")
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

        self.IEMModule = iem   
        self.IEM_active = False

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
            # if self.IEM_active:
            #     custom_reward = self.intrinsic_reward(self.state_pair)

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

    def intrinsic_reward(self, obs_pair):
        # Estimer afstanden mellem to states (de vil altid være 1 men hvis den tror der er mere betyder det at den udforsker)
        # print(obs_pair)
        input_states = np.concatenate([obs_pair[0], obs_pair[1]])
        # print(input_states)
        input_tensor = torch.tensor(input_states, dtype=torch.float32)#.unsqueeze(0)
        predicted_steps = self.IEMModule(input_tensor).detach().item()
        beta = self.beta_start * (1 - self.decay_rate) ** self.current_it
        ir = beta * predicted_steps
        # ir = (ir - 1) / (10 - 1 + 1e-8)
        beta = self.beta_start * (1 - self.decay_rate) ** self.current_it
        self.dist_est_list.append(ir)

        return ir
    

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


