ppo_number_of_evals = 20;

path = "data_cpy/csv/PPO_standard_test/";

run1 = readmatrix(strcat(path, "PPO_standard_number_0.csv"));
run2 = readmatrix(strcat(path, "PPO_standard_number_1.csv"));
run3 = readmatrix(strcat(path, "PPO_standard_number_2.csv"));
run4 = readmatrix(strcat(path, "PPO_standard_number_3.csv"));
run5 = readmatrix(strcat(path, "PPO_standard_number_4.csv"));
run6 = readmatrix(strcat(path, "PPO_standard_number_5.csv"));
run7 = readmatrix(strcat(path, "PPO_standard_number_6.csv"));
run8 = readmatrix(strcat(path, "PPO_standard_number_7.csv"));
run9 = readmatrix(strcat(path, "PPO_standard_number_8.csv"));
run10 = readmatrix(strcat(path, "PPO_standard_number_9.csv"));
run11 = readmatrix(strcat(path, "PPO_standard_number_10.csv"));
run12 = readmatrix(strcat(path, "PPO_standard_number_11.csv"));
run13 = readmatrix(strcat(path, "PPO_standard_number_12.csv"));
run14 = readmatrix(strcat(path, "PPO_standard_number_13.csv"));
run15 = readmatrix(strcat(path, "PPO_standard_number_14.csv"));
run16 = readmatrix(strcat(path, "PPO_standard_number_15.csv"));
run17 = readmatrix(strcat(path, "PPO_standard_number_16.csv"));
run18 = readmatrix(strcat(path, "PPO_standard_number_17.csv"));
run19 = readmatrix(strcat(path, "PPO_standard_number_18.csv"));
run20 = readmatrix(strcat(path, "PPO_standard_number_19.csv"));

first_row = run1(:, 1)

rows = size(run1, 1);
iterations_vector = zeros(rows, 1);
PPO_standad_avg =(run1 + run2 + run3 + run4 + run5 + run6 + run7 + run8 + run9 + run10 + run11 + run12 + run13 + run14 + run15 + run16 + run17 + run18 + run19 + run20) / ppo_number_of_evals; 
