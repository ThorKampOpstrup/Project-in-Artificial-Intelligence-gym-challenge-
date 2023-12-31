import subprocess
import numpy as np

subprocess.run(['git', 'pull'])
subprocess.run(['git', 'add', '-A'])
subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma'])
subprocess.run(['git', 'push'])

print('Running theta test')
sigma = str(0.05)
iterations = str(150)

number_of_equal_runs = 5

python_interpreter = '/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python'
path = '/home/thops19/Documents/9semester/Project-in-Artificial-Intelligence-gym-challenge-/'
data_path = 'data'

subdir = 'TRPO_theta_test_sigma_' + sigma
base_log_name = 'TRPO_theta_'

theta_test =[0.1, 0.2, 0.5, 1.0, 2.0, 3.0, 5.0]

# # Run the test for different sigma values
for j in range(0,number_of_equal_runs):
    print('Running test number ' + str(j))
    # round to 2 decimals
    for i in theta_test:
        theta = round(i, 3)
        str_theta = str(theta) #add so 3 decimals are used
        while 1:
            if len(str_theta) == 2:
                break
            str_theta += '0'
        log_name = base_log_name + str_theta + '_number_' + str(j)
        # Create the command
        # print('sigma = ' + str_sigma + ' number ' + str(j))
        print(log_name)
        # command = [python_interpreter, path+'main.py', '--use_trpo', 'True' '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--it', iterations, '--n_steps', '1024', '--sigma', str(sigma), '--theta', str(theta)]

        # subprocess.run(command)
        
        # #push to git
        # subprocess.run(['git', 'pull'])
        # subprocess.run(['git', 'add', '-A'])
        # subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma = ' + str(sigma) + ' number ' + str(j)])
        # subprocess.run(['git', 'push'])


#####RUN PPO
subdir = 'PPO_theta_test_sigma_' + sigma
base_log_name = 'PPO_theta_'

# # Run the test for different sigma values
for j in range(0,number_of_equal_runs):
    # round to 2 decimals
    for i in theta_test:
        theta = round(i, 3)
        str_theta = str(theta) #add so 3 decimals are used
        while 1:
            if len(str_theta) == 2:
                break
            str_theta += '0'
        log_name = base_log_name + str_theta + '_number_' + str(j)
        # Create the command
        # print('sigma = ' + str_sigma + ' number ' + str(j))
        print(log_name)
        # command = [python_interpreter, path+'main.py', '--use_ppo', 'True' '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--it', iterations, '--n_steps', '1024', '--sigma', str(sigma), '--theta', str(theta)]

        # subprocess.run(command)
        
        # #push to git
        # subprocess.run(['git', 'pull'])
        # subprocess.run(['git', 'add', '-A'])
        # subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma = ' + str(sigma) + ' number ' + str(j)])
        # subprocess.run(['git', 'push'])