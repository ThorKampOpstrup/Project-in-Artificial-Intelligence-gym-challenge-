import subprocess
import numpy as np

subprocess.run(['git', 'pull'])
subprocess.run(['git', 'add', '-A'])
subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma'])
subprocess.run(['git', 'push'])

theta = str(0)
sigma = str(0.00)
iterations = str(150)

number_of_equal_runs = 20

python_interpreter = '/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python'
path = '/home/thops19/Documents/9semester/Project-in-Artificial-Intelligence-gym-challenge-/'
data_path = 'data'

subdir = 'PPO_standard_test'
base_log_name = 'PPO_standard'
# # Run the test for different sigma values
for j in range(0,number_of_equal_runs):
    log_name = base_log_name + '_number_' + str(j)
    print(log_name)
    command = [python_interpreter, path+'main.py', '--use_ppo', 'True' '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--it', iterations, '--n_steps', '1024', '--sigma', str(sigma), '--theta', str(theta)]

    subprocess.run(command)
    
    # push to git
    subprocess.run(['git', 'pull'])
    subprocess.run(['git', 'add', '-A'])
    subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma = ' + str(sigma) + ' number ' + str(j)])
    subprocess.run(['git', 'push'])

subdir = 'TRPO_standard_test'
base_log_name = 'TRPO_standard'

for j in range(0,number_of_equal_runs):
    log_name = base_log_name + '_number_' + str(j)
    print(log_name)
    command = [python_interpreter, path+'main.py', '--use_ppo', 'True' '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--it', iterations, '--n_steps', '1024', '--sigma', str(sigma), '--theta', str(theta)]

    subprocess.run(command)
    
    # push to git
    subprocess.run(['git', 'pull'])
    subprocess.run(['git', 'add', '-A'])
    subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma = ' + str(sigma) + ' number ' + str(j)])
    subprocess.run(['git', 'push'])



# ['/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python', '/home/thops19/Documents/9semester/Project-in-Artificial-Intelligence-gym-challenge-/iem-ppo.py', '--path', 'data', '--subdir', 'sigma_test', '--log_name', 'sigma_0.050_number_0', '--it', 150, '--n_steps 1024 --sigma  0.05 --theta 0.5
