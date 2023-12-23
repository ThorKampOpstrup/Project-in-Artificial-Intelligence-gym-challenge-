import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
import numpy as np
import random
import copy

class IEMModule(nn.Module):
    def __init__(self, input_dim, hidden_dim):
            super(IEMModule, self).__init__()
            input_dim = 2 * input_dim 
            self.fc1 = nn.Linear(input_dim, hidden_dim)
            self.fc2 = nn.Linear(hidden_dim, 1)

    def forward(self, x):
        x = F.tanh(self.fc1(x))
        x = self.fc2(x)
        return x
            
    def create_batch(self, states_lists, steps_range=(1, 10), batch_size=64):
        # Create a single batch
        input_states = []
        target_steps = []
        # STATE LIST IS NOW A LIST OF LISTS, NEED RANDOM CHOICE FOR WHICH LIST TO CHOSE FROM
        for _ in range(batch_size):
            states_list = copy.deepcopy(random.choice(states_lists))
            # Ensure that the selected state has enough subsequent states:
            state_index = random.choice(range(len(states_list) - steps_range[1]))
            state = states_list[state_index]
            
            steps = np.random.randint(steps_range[0], steps_range[1] + 1)
            target_state_index = state_index + steps
            target_state = states_list[target_state_index]
            concatenated_state = np.concatenate([state, target_state])

            input_states.append(concatenated_state)
            target_steps.append(steps)
            
            
        input_states = np.array(input_states)
        return torch.tensor(input_states, dtype=torch.float32), torch.tensor(target_steps, dtype=torch.float32)
    
    def train(self, state_list, num_epochs=1000, steps_range=(1, 50), batch_size=64, lr=0.001):
        loss_function = nn.MSELoss()
        optimizer = optim.Adam(self.parameters(), lr=lr)
        loss_list = []

        for epoch in range(num_epochs):
            input_states, target_steps = self.create_batch(state_list, steps_range=steps_range, batch_size=batch_size)
            optimizer.zero_grad()
            estimate = self(input_states)
            loss = loss_function(estimate.squeeze(), target_steps)
            loss.backward()
            optimizer.step()
            loss_list.append(loss.item())
        # print(f"guess: {estimate.detach().squeeze()}, correct: {target_steps}")

        return loss_list

