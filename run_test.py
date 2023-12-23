import subprocess

number_of_equal_runs = 5

python_interpreter = '/home/thops19/Documents/9semester/PPO-for-Beginners/venv/bin/python'
data_path = 'data'



# # Run the test for different k values
subdir = 'k_test'
base_log_name = 'k_'
#from 1 to 10 k
for i in range(1,11):
    k = i
    for j in range(number_of_equal_runs):
        log_name = base_log_name + str(k) + '_number_' + str(j)
        # Create the command
        command = [python_interpreter, 'iem-ppo.py', '--path', data_path,'--subdir', subdir, '--log_name', log_name, '--re3_k', str(k),'--it', '200', '--n_steps', '1012']
        subprocess.run(command)



