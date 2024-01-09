# Project-in-Artificial-Intelligence (gym-challenge)
This project is an attempt to complete the Bipedal Walker gym challenge by modifying PPO and TRPO with Re3 and Ornstein-Uhlenbeck action noise. The repository is a part of the course Project in Artificial Intelligence at the University of Southern Denmark(SDU). This git is suplementary to the report and contains the code used to generate the plots in the report. Enjoy!

<!-- ![plotter/plots/example.gif](plotter/plots/example.gif) -->
<img src="/plotter/plots/example.gif" alt="image" style="width:300px;height:auto;"> 

![plotter/plots/plot_1.png](plotter/plots/combined.png)


## Getting Started
Make sure to have python >=3.10.12 installed and:
```bash
pip install -r requirements.txt
```

It is recommended to use a virtual environment or wrapper such as conda.

Insert files from SB3_modified_files into your corresponding SB3 installation.

### Achievements
|                  	| PPO    	| TRPO  	| PPO+OU                   	| TRPO+OU                                  	| PPO+Re3 	| TRPO+Re3                 	| PPO+OU+Re3                 	| TRPO+OU+Re3                 	|
|------------------	|--------	|-------	|--------------------------	|------------------------------------------	|---------	|--------------------------	|----------------------------	|-----------------------------	|
| Runs             	| 20     	| 20    	| 5                        	| 5                                        	| 5       	| 5                        	| 20                         	| 20                          	|
| Hyper-parameters 	|        	|       	| σ = 0.05, θ = 1  	| best(σ=0.5) mean(σ=0.02) θ=1 	| k=200   	| best(k=500) mean(k=1000) 	| k=200, σ=0.02, θ=1 	| K=1000, σ=0.02, θ=5 	|
| Lowest/best      	| 58     	| 58    	| 102                      	| 57                                       	| 76      	| 60                       	| 77                         	| 60                          	|
| Mean             	| 113.39 	| 84.60 	| 124.8                    	| 77.2                                     	| 111.4   	| 74.6                     	| 116.5                      	| 87.25                       	|

Study plot in on [plotter/plots/README.md](plotter/plots/README.md) for more details.

## File and Folder Content Description
### Python Scripts
- **[main.py](main.py)**: 
  - The primary script to run configurations with different hyperparameters.
- **run***.py: 
  - Test scripts in Python for experimenting with various parameter configurations.
- **[log_extractor.py](log_extractor.py)**: 
  - A Python script designed to extract .csv files from the logs directory.

### SB3 modified files
- **[ppo.py](SB3_modified_files/ppo.py)**: 
  - Modified PPO file with the addition of support Ornstein-Uhlenbeck action noise
- **[trpo.py](SB3_modified_files/trpo.py)**:
  - Modified TRPO file with the addition of support Ornstein-Uhlenbeck action noise
- **[on_policy_algorithm.py](SB3_modified_files/on_policy_algorithm.py)**:
  - Modified on_policy_algorithm file with the addition of support for Ornstein-Uhlenbeck action noise.

### Data Directories
- **[data/](data/)**: 
  - This directory holds the data outputs from all runs.
- **[data_cpy/](data_cpy/)**: 
  - Contains both the data from all runs and the extracted .csv files from the logs.

### Plotter Scripts and Outputs
- **[plotter/](plotter/)**: 
  - Houses MATLAB scripts for generating plots.
- **[plotter/plots/](plotter/plots/)**: 
  - This is where all the generated plots are located.

### Additional Documentation
- **[plotter/plots/README.md](plotter/plots/README.md)**: 
  - Provides a visual representation and documentation of all the generated plots.
- **[plotter/plots/Re3_ex/README.md](plotter/plots/Re3_ex/README.md)**:
  - Provides a visual representation and documentation of the Re3 reward and mean evaluation.


## Authors
- Benjamin Birk Longet
- Thor Kamp Opstrup
