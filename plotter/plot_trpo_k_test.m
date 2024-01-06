%clear;
%close all;

addpath('plotter/');
load_avg_standard_trpo

number_of_evals = 5;

% define column descriptors TRPO
TRPO_step = 1;
TRPO_rollout_ep_len_mean = 2;
TRPO_rollout_ep_rew_mean = 3;
TRPO_time_fps = 4;
TRPO_train_beta_loss = 5;
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
TRPO_train_value_los = 17;

path = "data_cpy/csv/TRPO_k_test_3-1000/";

TRPO_k_3_number_0 = readmatrix(strcat(path, "TRPO_k_3_number_0.csv"));
TRPO_k_3_number_1 = readmatrix(strcat(path, "TRPO_k_3_number_1.csv"));
TRPO_k_3_number_2 = readmatrix(strcat(path, "TRPO_k_3_number_2.csv"));
TRPO_k_3_number_3 = readmatrix(strcat(path, "TRPO_k_3_number_3.csv"));
TRPO_k_3_number_4 = readmatrix(strcat(path, "TRPO_k_3_number_4.csv"));

TRPO_k_50_number_0 = readmatrix(strcat(path, "TRPO_k_50_number_0.csv"));
TRPO_k_50_number_1 = readmatrix(strcat(path, "TRPO_k_50_number_1.csv"));
TRPO_k_50_number_2 = readmatrix(strcat(path, "TRPO_k_50_number_2.csv"));
TRPO_k_50_number_3 = readmatrix(strcat(path, "TRPO_k_50_number_3.csv"));
TRPO_k_50_number_4 = readmatrix(strcat(path, "TRPO_k_50_number_4.csv"));

TRPO_k_100_number_0 = readmatrix(strcat(path, "TRPO_k_100_number_0.csv"));
TRPO_k_100_number_1 = readmatrix(strcat(path, "TRPO_k_100_number_1.csv"));
TRPO_k_100_number_2 = readmatrix(strcat(path, "TRPO_k_100_number_2.csv"));
TRPO_k_100_number_3 = readmatrix(strcat(path, "TRPO_k_100_number_3.csv"));
TRPO_k_100_number_4 = readmatrix(strcat(path, "TRPO_k_100_number_4.csv"));

TRPO_k_200_number_0 = readmatrix(strcat(path, "TRPO_k_200_number_0.csv"));
TRPO_k_200_number_1 = readmatrix(strcat(path, "TRPO_k_200_number_1.csv"));
TRPO_k_200_number_2 = readmatrix(strcat(path, "TRPO_k_200_number_2.csv"));
TRPO_k_200_number_3 = readmatrix(strcat(path, "TRPO_k_200_number_3.csv"));
TRPO_k_200_number_4 = readmatrix(strcat(path, "TRPO_k_200_number_4.csv"));

TRPO_k_500_number_0 = readmatrix(strcat(path, "TRPO_k_500_number_0.csv"));
TRPO_k_500_number_1 = readmatrix(strcat(path, "TRPO_k_500_number_1.csv"));
TRPO_k_500_number_2 = readmatrix(strcat(path, "TRPO_k_500_number_2.csv"));
TRPO_k_500_number_3 = readmatrix(strcat(path, "TRPO_k_500_number_3.csv"));
TRPO_k_500_number_4 = readmatrix(strcat(path, "TRPO_k_500_number_4.csv"));

TRPO_k_1000_number_0 = readmatrix(strcat(path, "TRPO_k_1000_number_0.csv"));
TRPO_k_1000_number_1 = readmatrix(strcat(path, "TRPO_k_1000_number_1.csv"));
TRPO_k_1000_number_2 = readmatrix(strcat(path, "TRPO_k_1000_number_2.csv"));
TRPO_k_1000_number_3 = readmatrix(strcat(path, "TRPO_k_1000_number_3.csv"));
TRPO_k_1000_number_4 = readmatrix(strcat(path, "TRPO_k_1000_number_4.csv"));

TRPO_k_3_mean = (TRPO_k_3_number_0 + TRPO_k_3_number_1 + TRPO_k_3_number_2 + TRPO_k_3_number_3 + TRPO_k_3_number_4) / number_of_evals;
TRPO_k_50_mean = (TRPO_k_50_number_0 + TRPO_k_50_number_1 + TRPO_k_50_number_2 + TRPO_k_50_number_3 + TRPO_k_50_number_4) / number_of_evals;
TRPO_k_100_mean = (TRPO_k_100_number_0 + TRPO_k_100_number_1 + TRPO_k_100_number_2 + TRPO_k_100_number_3 + TRPO_k_100_number_4) / number_of_evals;
TRPO_k_200_mean = (TRPO_k_200_number_0 + TRPO_k_200_number_1 + TRPO_k_200_number_2 + TRPO_k_200_number_3 + TRPO_k_200_number_4) / number_of_evals;
TRPO_k_500_mean = (TRPO_k_500_number_0 + TRPO_k_500_number_1 + TRPO_k_500_number_2 + TRPO_k_500_number_3 + TRPO_k_500_number_4) / number_of_evals;
TRPO_k_1000_mean = (TRPO_k_1000_number_0 + TRPO_k_1000_number_1 + TRPO_k_1000_number_2 + TRPO_k_1000_number_3 + TRPO_k_1000_number_4) / number_of_evals;

rows = size(TRPO_k_3_mean, 1);
iterations_vec = [1:1:rows];

figure(1);
hold on;
plot(iterations_vec, trpo_standad_avg(:, 7), 'LineWidth', 2);
plot(iterations_vec, TRPO_k_3_mean(:, TRPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, TRPO_k_50_mean(:, TRPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, TRPO_k_100_mean(:, TRPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, TRPO_k_200_mean(:, TRPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, TRPO_k_500_mean(:, TRPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, TRPO_k_1000_mean(:, TRPO_train_mean_evaluation_reward), 'LineWidth', 1);
legend('baseline', 'k = 3', 'k = 50', 'k = 100', 'k = 200', 'k = 500', 'k = 1000');
legend('Location', 'northwest');
title('TRPO: Re3 k test');
xticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150]);
xlabel('Iterations');
ylabel('Mean evaluation reward');
hold off;

TRPO_k_3_number_0_first_300 = return_it_where_val_is_reached(TRPO_k_3_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_3_number_1_first_300 = return_it_where_val_is_reached(TRPO_k_3_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_3_number_2_first_300 = return_it_where_val_is_reached(TRPO_k_3_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_3_number_3_first_300 = return_it_where_val_is_reached(TRPO_k_3_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_3_number_4_first_300 = return_it_where_val_is_reached(TRPO_k_3_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_k_50_number_0_first_300 = return_it_where_val_is_reached(TRPO_k_50_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_50_number_1_first_300 = return_it_where_val_is_reached(TRPO_k_50_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_50_number_2_first_300 = return_it_where_val_is_reached(TRPO_k_50_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_50_number_3_first_300 = return_it_where_val_is_reached(TRPO_k_50_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_50_number_4_first_300 = return_it_where_val_is_reached(TRPO_k_50_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_k_100_number_0_first_300 = return_it_where_val_is_reached(TRPO_k_100_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_100_number_1_first_300 = return_it_where_val_is_reached(TRPO_k_100_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_100_number_2_first_300 = return_it_where_val_is_reached(TRPO_k_100_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_100_number_3_first_300 = return_it_where_val_is_reached(TRPO_k_100_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_100_number_4_first_300 = return_it_where_val_is_reached(TRPO_k_100_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_k_200_number_0_first_300 = return_it_where_val_is_reached(TRPO_k_200_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_200_number_1_first_300 = return_it_where_val_is_reached(TRPO_k_200_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_200_number_2_first_300 = return_it_where_val_is_reached(TRPO_k_200_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_200_number_3_first_300 = return_it_where_val_is_reached(TRPO_k_200_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_200_number_4_first_300 = return_it_where_val_is_reached(TRPO_k_200_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_k_500_number_0_first_300 = return_it_where_val_is_reached(TRPO_k_500_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_500_number_1_first_300 = return_it_where_val_is_reached(TRPO_k_500_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_500_number_2_first_300 = return_it_where_val_is_reached(TRPO_k_500_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_500_number_3_first_300 = return_it_where_val_is_reached(TRPO_k_500_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_500_number_4_first_300 = return_it_where_val_is_reached(TRPO_k_500_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_k_1000_number_0_first_300 = return_it_where_val_is_reached(TRPO_k_1000_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_1000_number_1_first_300 = return_it_where_val_is_reached(TRPO_k_1000_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_1000_number_2_first_300 = return_it_where_val_is_reached(TRPO_k_1000_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_1000_number_3_first_300 = return_it_where_val_is_reached(TRPO_k_1000_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_k_1000_number_4_first_300 = return_it_where_val_is_reached(TRPO_k_1000_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_k_3_first_300 = [TRPO_k_3_number_0_first_300, TRPO_k_3_number_1_first_300, TRPO_k_3_number_2_first_300, TRPO_k_3_number_3_first_300, TRPO_k_3_number_4_first_300];
TRPO_k_50_first_300 = [TRPO_k_50_number_0_first_300, TRPO_k_50_number_1_first_300, TRPO_k_50_number_2_first_300, TRPO_k_50_number_3_first_300, TRPO_k_50_number_4_first_300];
TRPO_k_100_first_300 = [TRPO_k_100_number_0_first_300, TRPO_k_100_number_1_first_300, TRPO_k_100_number_2_first_300, TRPO_k_100_number_3_first_300, TRPO_k_100_number_4_first_300];
TRPO_k_200_first_300 = [TRPO_k_200_number_0_first_300, TRPO_k_200_number_1_first_300, TRPO_k_200_number_2_first_300, TRPO_k_200_number_3_first_300, TRPO_k_200_number_4_first_300];
TRPO_k_500_first_300 = [TRPO_k_500_number_0_first_300, TRPO_k_500_number_1_first_300, TRPO_k_500_number_2_first_300, TRPO_k_500_number_3_first_300, TRPO_k_500_number_4_first_300];
TRPO_k_1000_first_300 = [TRPO_k_1000_number_0_first_300, TRPO_k_1000_number_1_first_300, TRPO_k_1000_number_2_first_300, TRPO_k_1000_number_3_first_300, TRPO_k_1000_number_4_first_300];

TRPO_k_3_first_300_mean = mean(TRPO_k_3_first_300);
TRPO_k_50_first_300_mean = mean(TRPO_k_50_first_300);
TRPO_k_100_first_300_mean = mean(TRPO_k_100_first_300);
TRPO_k_200_first_300_mean = mean(TRPO_k_200_first_300);
TRPO_k_500_first_300_mean = mean(TRPO_k_500_first_300);
TRPO_k_1000_first_300_mean = mean(TRPO_k_1000_first_300);

TRPO_k_3_first_300_lowest = min(TRPO_k_3_first_300);
TRPO_k_50_first_300_lowest = min(TRPO_k_50_first_300);
TRPO_k_100_first_300_lowest = min(TRPO_k_100_first_300);
TRPO_k_200_first_300_lowest = min(TRPO_k_200_first_300);
TRPO_k_500_first_300_lowest = min(TRPO_k_500_first_300);
TRPO_k_1000_first_300_lowest = min(TRPO_k_1000_first_300);


hold on;
figure(2);
hold on;
xticks_vec = ["baseline", "3", "50", "100", "200", "500", "1000"];
bar(xticks_vec, [trpo_first_300_mean, TRPO_k_3_first_300_mean, TRPO_k_50_first_300_mean, TRPO_k_100_first_300_mean, TRPO_k_200_first_300_mean, TRPO_k_500_first_300_mean, TRPO_k_1000_first_300_mean; trpo_first_300_lowest, TRPO_k_3_first_300_lowest, TRPO_k_50_first_300_lowest, TRPO_k_100_first_300_lowest, TRPO_k_200_first_300_lowest, TRPO_k_500_first_300_lowest, TRPO_k_1000_first_300_lowest]);
title('TRPO: Iteration to get reward of 300 vs k');
xlabel('k');
ylabel('Iterations');
yline(trpo_first_300_mean, '--');
yline(trpo_standard_first_300_20_lowest, '--');
legend('Mean', 'Lowest', 'baseline mean', 'baseline 20% lowest');
legend('Location', 'southeast');
hold off;