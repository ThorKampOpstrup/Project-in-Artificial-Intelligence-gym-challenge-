import subprocess
import numpy as np

number_of_equal_runs = 5

python_interpreter = '/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python'
data_path = 'data'
iterations = str(150)

k_vals = [3, 50, 100, 200, 500, 1000]

subdir = 'k_test_100-1000'

base_log_name = 'PPO_k_'
# Run the test for different sigma values
for j in range(0,number_of_equal_runs):
    for k in k_vals:
        log_name = base_log_name + str(k) + '_number_' + str(j)
        print('subdir: ' + subdir + ' log_name: ' + log_name)
        command = [python_interpreter, 'main.py', '--use_ppo', 'True', '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--it', iterations, '--n_steps', '1024', '--re3_k', str(k)]

        subprocess.run(command)
        
        # push to git
        subprocess.run(['git', 'pull'])
        subprocess.run(['git', 'add', '-A'])
        subprocess.run(['git', 'commit', '-m', 'Automated push: Test for k_test = ' + str(k) + ' number ' + str(j)])
        subprocess.run(['git', 'push'])
    

base_log_name = 'TRPO_k_'
# Run the test for different sigma values
for j in range(0,number_of_equal_runs):
    for k in k_vals:
        log_name = base_log_name + str(k) + '_number_' + str(j)
        print('subdir: ' + subdir + ' log_name: ' + log_name)
        command = [python_interpreter, 'main.py', '--use_trpo', 'True', '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--it', iterations, '--n_steps', '1024', '--re3_k', str(k)]

        subprocess.run(command)
        
        # push to git
        subprocess.run(['git', 'pull'])
        subprocess.run(['git', 'add', '-A'])
        subprocess.run(['git', 'commit', '-m', 'Automated push: Test for k_test = ' + str(k) + ' number ' + str(j)])
        subprocess.run(['git', 'push'])
        