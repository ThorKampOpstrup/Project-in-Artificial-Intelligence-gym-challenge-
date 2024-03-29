close all;
addpath("plotter/");

load_avg_standard_trpo;

number_of_evals = 20;

TRPO_step = 1;
TRPO_rollout_ep_len_mean = 2;
TRPO_rollout_ep_rew_mean = 3;
TRPO_time_fps = 4;
TRPO_train_beta = 5;
TRPO_train_fitness_score = 6;
TRPO_train_mean_episodic_Re3_reward = 7;
TRPO_train_mean_evaluation_length = 8;
TRPO_train_mean_evaluation_reward = 9;
TRPO_train_real_mean_ep_len = 10;
TRPO_train_explained_variance = 11;
TRPO_train_is_line_search_success = 12;
TRPO_train_kl_divergence_loss = 13;
TRPO_train_learning_rate = 14;
TRPO_train_policy_objective = 15;
TRPO_train_std = 16;
TRPO_train_value_loss = 17;

path = "data_cpy/csv/TRPO_Re3_OU_test/";

run1 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_0.csv"));
run2 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_1.csv"));
run3 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_2.csv"));
run4 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_3.csv"));
run5 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_4.csv"));
run6 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_5.csv"));
run7 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_6.csv"));
run8 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_7.csv"));
run9 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_8.csv"));
run10 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_9.csv"));
run11 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_10.csv"));
run12 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_11.csv"));
run13 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_12.csv"));
run14 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_13.csv"));
run15 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_14.csv"));
run16 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_15.csv"));
run17 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_16.csv"));
run18 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_17.csv"));
run19 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_18.csv"));
run20 = readmatrix(strcat(path, "TRPO_k_1000_sigma_0.02_theta_5_number_19.csv"));

rows = size(run1, 1);
iterations_vec = [1:1:rows];

TRPO_Re3_OU_test_mean =(run1 + run2 + run3 + run4 + run5 + run6 + run7 + run8 + run9 + run10 + run11 + run12 + run13 + run14 + run15 + run16 + run17 + run18 + run19 + run20) / number_of_evals;

figure(1);
hold on;
plot(iterations_vec, TRPO_Re3_OU_test_mean(:, TRPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, trpo_standad_avg(:, trpo_train_mean_evaluation_reward), 'LineWidth', 1);
legend("TRPO Re3 OU test", "TRPO standard");
legend("Location", "southeast");
xlabel("Iterations");
ylabel("Mean evaluation reward");
xticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150]);
title("TRPO Re3 OU test vs TRPO standard");
hold off;

run1_first_300 = return_it_where_val_is_reached(run1, 300, TRPO_train_mean_evaluation_reward);
run2_first_300 = return_it_where_val_is_reached(run2, 300, TRPO_train_mean_evaluation_reward);
run3_first_300 = return_it_where_val_is_reached(run3, 300, TRPO_train_mean_evaluation_reward);
run4_first_300 = return_it_where_val_is_reached(run4, 300, TRPO_train_mean_evaluation_reward);
run5_first_300 = return_it_where_val_is_reached(run5, 300, TRPO_train_mean_evaluation_reward);
run6_first_300 = return_it_where_val_is_reached(run6, 300, TRPO_train_mean_evaluation_reward);
run7_first_300 = return_it_where_val_is_reached(run7, 300, TRPO_train_mean_evaluation_reward);
run8_first_300 = return_it_where_val_is_reached(run8, 300, TRPO_train_mean_evaluation_reward);
run9_first_300 = return_it_where_val_is_reached(run9, 300, TRPO_train_mean_evaluation_reward);
run10_first_300 = return_it_where_val_is_reached(run10, 300, TRPO_train_mean_evaluation_reward);
run11_first_300 = return_it_where_val_is_reached(run11, 300, TRPO_train_mean_evaluation_reward);
run12_first_300 = return_it_where_val_is_reached(run12, 300, TRPO_train_mean_evaluation_reward);
run13_first_300 = return_it_where_val_is_reached(run13, 300, TRPO_train_mean_evaluation_reward);
run14_first_300 = return_it_where_val_is_reached(run14, 300, TRPO_train_mean_evaluation_reward);
run15_first_300 = return_it_where_val_is_reached(run15, 300, TRPO_train_mean_evaluation_reward);
run16_first_300 = return_it_where_val_is_reached(run16, 300, TRPO_train_mean_evaluation_reward);
run17_first_300 = return_it_where_val_is_reached(run17, 300, TRPO_train_mean_evaluation_reward);
run18_first_300 = return_it_where_val_is_reached(run18, 300, TRPO_train_mean_evaluation_reward);
run19_first_300 = return_it_where_val_is_reached(run19, 300, TRPO_train_mean_evaluation_reward);
run20_first_300 = return_it_where_val_is_reached(run20, 300, TRPO_train_mean_evaluation_reward);

TRPO_Re3_OU_first_300 = [run1_first_300, run2_first_300, run3_first_300, run4_first_300, run5_first_300, run6_first_300, run7_first_300, run8_first_300, run9_first_300, run10_first_300, run11_first_300, run12_first_300, run13_first_300, run14_first_300, run15_first_300, run16_first_300, run17_first_300, run18_first_300, run19_first_300, run20_first_300];
%TRPO_Re3_OU_first_300 = TRPO_Re3_OU_first_300(TRPO_Re3_OU_first_300 ~= rows+1);

TRPO_Re3_OU_first_300_mean = mean(TRPO_Re3_OU_first_300);
TRPO_Re3_OU_first_300_lowest = min(TRPO_Re3_OU_first_300);

figure(2);
hold on;
xticks_vec = ["TRPO standard", "TRPO Re3 OU test"];
bar(xticks_vec, [trpo_first_300_mean, trpo_first_300_lowest; TRPO_Re3_OU_first_300_mean, TRPO_Re3_OU_first_300_lowest]);

legend("Mean", "Lowest");
title("TRPO standard vs TRPO Re3 OU test");
ylabel("Iterations");
hold off;
