import gymnasium as gym
from gymnasium.core import Env
from stable_baselines3 import PPO
import argparse

def def_args():
    parser = argparse.ArgumentParser(description='AI Project')
    
    parser.add_argument('--model_path', type=str, required=True, help='Path to the model')

    return parser.parse_args()

if __name__=='__main__':
    args = def_args()
    
    
    env = gym.make('BipedalWalker-v3', render_mode='human')
    obs, _ = env.reset()
    
    model_path = args.model_path
    model = PPO.load(model_path, env=env)
    
    rewards=0
    while True:
        action, _ = model.predict(obs, deterministic=True)
        obs, reward, terminated, truncated, info = env.step(action)
        rewards += reward
        env.render()
        if terminated or truncated:
            print('Reward: ', rewards)
            rewards = 0
            obs, _ = env.reset()
    