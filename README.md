# Project-in-Artificial-Intelligence (gym-challenge)
This project is an attempt to complete the gym challenge by modifying PPO and TRPO with Re3 and Ornstein-Uhlenbeck action noise. The project is a part of the course elective course at the University of Southern Denmark(SDU). This git is suplementary to the report and contains the code used to generate the plots in the report. Enjoy!

![plotter/plots/example.gif](plotter/plots/example.gif)
![plotter/plots/plot_1.png](plotter/plots/combined.png)



## Getting Started
Make sure to have python >=3.10.12 installed and:
```bash
pip install -r requirements.txt
```

It is recommended to use a virtual environment or wrapper such as conda.

Insert files from SB3_modified_files into your corresponding SB3 installation.

## File and Folder Content Description
Examine plotter/plots/README.md for a plots of all findings. 

### Python Scripts
- **main.py**: 
  - The primary script to run configurations with different hyperparameters.
- **run****.py: 
  - Test scripts in Python for experimenting with various parameter configurations.
- **log_extractor.py**: 
  - A Python script designed to extract .csv files from the logs directory.

### SB3 modified files
- **ppo.py**: 
  - Modified PPO file.

### Data Directories
- **data/**: 
  - This directory holds the data outputs from all runs.
- **data_cpy/**: 
  - Contains both the data from all runs and the extracted .csv files from the logs.

### Plotter Scripts and Outputs
- **plotter/**: 
  - Houses MATLAB scripts for generating plots.
- **plotter/plots/**: 
  - This is where all the generated plots are stored.

### Additional Documentation
- **plotter/plots/README.md**: 
  - Provides a visual representation and documentation of all the generated plots.

## Authors
- Benjamin Longet Birk
- Thor Kamp Opstrup
