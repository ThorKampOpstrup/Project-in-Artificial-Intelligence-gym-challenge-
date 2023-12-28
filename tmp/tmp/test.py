import matplotlib.pyplot as plt

beta_start = 2
decay_rate = 0.01

beta_data = []

for current_it in range(1, 200):
    beta = beta_start * (1 - decay_rate) ** current_it
    beta_data.append(beta)
    
plt.plot(beta_data)
plt.show()
