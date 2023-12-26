import subprocess
import numpy as np

subprocess.run(['git', 'add', '-A'])
subprocess.run(['git', 'commit', '-m', 'Test for OU_noise_sigma'])
subprocess.run(['git', 'push'])

number_of_equal_runs = 5

python_interpreter = '/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python'
data_path = 'data'

k=3

# # Run the test for different k values
subdir = 'OU_noise_sigma'
base_log_name = 'OU_noise_sigma_'
#from 0.05 to 0.5 in steps of 0.05
for i in np.arange(0.05, 0.51, 0.05):
    OU_noise_sigma = round(i, 2)
    # round to 2 decimals
    print('Running test for OU_noise_sigma = ' + str(OU_noise_sigma))
    for j in range(number_of_equal_runs):
        log_name = base_log_name + str(OU_noise_sigma) + '_number_' + str(j)
        # Create the command
        print('Running test number ' + str(j))
        # command = [python_interpreter, 'iem-ppo.py', '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--re3_k', str(k),'--it', '200', '--n_steps', '2048', '--OU_noise_sigma', str(OU_noise_sigma)]
        # subprocess.run(command)
        
        # #push to git
        # subprocess.run(['git', 'add', '-A'])
        # subprocess.run(['git', 'commit', '-m', 'Automated push: Test for OU_noise_sigma = ' + str(OU_noise_sigma) + ' number ' + str(j)])
        # subprocess.run(['git', 'push'])
        



