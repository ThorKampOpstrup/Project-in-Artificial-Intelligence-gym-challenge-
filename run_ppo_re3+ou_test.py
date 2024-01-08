import subprocess
import numpy as np

# subprocess.run(['git', 'pull'])
# subprocess.run(['git', 'add', '-A'])
# subprocess.run(['git', 'commit', '-m', 'Automated push: Test for combined'])
# subprocess.run(['git', 'push'])

theta = str(1)
sigma = str(0.02)
k = str(200)

iterations = str(150)

number_of_equal_runs = 20

python_interpreter = '/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python'
path = '/home/thops19/Documents/9semester/Project-in-Artificial-Intelligence-gym-challenge-/'
data_path = 'data'

subdir = 'PPO_Re3_OU_test'
base_log_name = 'PPO_k_' + k + '_sigma_' + sigma + '_theta_' + theta

for j in range(0,number_of_equal_runs):
    log_name = base_log_name + '_number_' + str(j)
    print('subdir: ' + subdir + ' log_name: ' + log_name)
    command = [python_interpreter, path+'main.py', '--use_ppo', 'True', '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--it', iterations, '--n_steps', '1024', '--sigma', str(sigma), '--theta', str(theta), '--re3_k', str(k)]

    subprocess.run(command)
    
    # push to git
    # subprocess.run(['git', 'pull'])
    # subprocess.run(['git', 'add', '-A'])
    # subprocess.run(['git', 'commit', '-m', 'Automated push: Test for combined'])
    # subprocess.run(['git', 'push'])
