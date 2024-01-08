import subprocess
import numpy as np

number_of_equal_runs = 5

python_interpreter = #!INSERT PATH TO PYTHON INTERPRETER HERE
data_path = 'data'

# # Run the test for different k values
subdir = 'k_test_100-1000'
base_log_name = 'k_'
#from 1 to 10 k
for j in range(number_of_equal_runs):
    for i in np.arange(100, 1001, 100):
        k = i
        log_name = base_log_name + str(k) + '_number_' + str(j)
        # Create the command
        print('Running test number ' + str(j)+ ' for k = ' + str(k))
        command = [python_interpreter, 'iem-ppo.py', '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--re3_k', str(k),'--it', '200', '--n_steps', '2024']
        subprocess.run(command)
        
        # subprocess.run(['git', 'pull'])
        # subprocess.run(['git', 'add', '-A'])
        # subprocess.run(['git', 'commit', '-m', 'Automated push: Test for k_test = ' + str(k) + ' number ' + str(j)])
        # subprocess.run(['git', 'push'])



