import subprocess
import numpy as np

subprocess.run(['git', 'pull'])
subprocess.run(['git', 'add', '-A'])
subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma'])
subprocess.run(['git', 'push'])

number_of_equal_runs = 5

python_interpreter = '/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python'
data_path = 'data'

subdir = 'sigma_test'
base_log_name = 'sigma_'
# # Run the test for different sigma values
for i in np.arange(0.05, 0.51, 0.05):
    sigma = round(i, 2)
    # round to 2 decimals
    print('Running test for sigma = ' + str(sigma))
    for j in range(number_of_equal_runs):
        log_name = base_log_name + str(sigma) + '_number_' + str(j)
        # Create the command
        print('Running test number ' + log_name)
        # command = [python_interpreter, 'iem-ppo.py', '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--it', '200', '--n_steps', '2048', '--sigma', str(sigma)]
        # subprocess.run(command)
        
        # #push to git
        # subprocess.run(['git', 'add', '-A'])
        # subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma = ' + str(sigma) + ' number ' + str(j)])
        # subprocess.run(['git', 'push'])