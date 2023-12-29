import subprocess
import numpy as np

subprocess.run(['git', 'pull'])
subprocess.run(['git', 'add', '-A'])
subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma'])
subprocess.run(['git', 'push'])

theta = str(1)
iterations = str(150)

number_of_equal_runs = 5

python_interpreter = '/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python'
path = '/home/thops19/Documents/9semester/Project-in-Artificial-Intelligence-gym-challenge-/'
data_path = 'data'

subdir = 'sigma_test_theta' + theta
base_log_name = 'sigma_'


###DELETE THIS AND CHANGE RANGE TO 0 TO RUMBER FO RUNS
# round to 2 decimals
for i in np.arange(0.125, 0.41, 0.025):
    sigma = round(i, 3)
    str_sigma = str(sigma) #add so 3 decimals are used
    while 1:
        if len(str_sigma) == 5:
            break
        str_sigma += '0'
    log_name = base_log_name + str_sigma + '_number_' + str(1)
    # Create the command
    # print('sigma = ' + str_sigma + ' number ' + str(1))
    print(log_name)
    command = [python_interpreter, path+'iem-ppo.py', '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--it', iterations, '--n_steps', '1024', '--sigma', str(sigma), '--theta', str(theta)]
    # command = [python_interpreter, path+'iem-ppo.py']

    # command = [python_interpreter, path+'test.py']

    # subprocess.run(command)
    
    #push to git
    # subprocess.run(['git', 'pull'])
    # subprocess.run(['git', 'add', '-A'])
    # subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma = ' + str(sigma) + ' number ' + str(j)])
    # subprocess.run(['git', 'push'])



# # Run the test for different sigma values
for j in range(2,number_of_equal_runs):
    # round to 2 decimals
    for i in np.arange(0.05, 0.41, 0.025):
        sigma = round(i, 3)
        str_sigma = str(sigma) #add so 3 decimals are used
        while 1:
            if len(str_sigma) == 5:
                break
            str_sigma += '0'
        log_name = base_log_name + str_sigma + '_number_' + str(j)
        # Create the command
        # print('sigma = ' + str_sigma + ' number ' + str(j))
        print(log_name)
        command = [python_interpreter, path+'iem-ppo.py', '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--it', iterations, '--n_steps', '1024', '--sigma', str(sigma), '--theta', str(theta)]
        # command = [python_interpreter, path+'iem-ppo.py']

        # command = [python_interpreter, path+'test.py']

        # subprocess.run(command)
        
        #push to git
        # subprocess.run(['git', 'pull'])
        # subprocess.run(['git', 'add', '-A'])
        # subprocess.run(['git', 'commit', '-m', 'Automated push: Test for sigma = ' + str(sigma) + ' number ' + str(j)])
        # subprocess.run(['git', 'push'])



# ['/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python', '/home/thops19/Documents/9semester/Project-in-Artificial-Intelligence-gym-challenge-/iem-ppo.py', '--path', 'data', '--subdir', 'sigma_test', '--log_name', 'sigma_0.050_number_0', '--it', 150, '--n_steps 1024 --sigma  0.05 --theta 0.5
