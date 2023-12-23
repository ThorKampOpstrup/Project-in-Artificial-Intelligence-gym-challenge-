import numpy as np
import os
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim

class RandomEncoder(nn.Module):
        def __init__(self, input_dim, feature_dim):
            super(RandomEncoder, self).__init__()
            self.input_dim = input_dim  #Dimension of the observation space
            self.net = nn.Sequential(
                nn.Linear(input_dim, 64), nn.ReLU(),
                nn.Linear(64, 64), nn.ReLU(),
                nn.Linear(64, feature_dim), nn.LayerNorm(feature_dim)                 
            )

            for parameter in self.parameters():
                parameter.requires_grad = False

        def forward(self, x):
             x = self.net(x)
             return x
