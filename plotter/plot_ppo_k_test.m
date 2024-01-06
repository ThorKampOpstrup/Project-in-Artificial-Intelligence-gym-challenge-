clear;
%close all;

addpath('plotter/');
load_avg_standard_ppo

number_of_evals = 5;

% define column descriptors PPO
PPO_step=1;
PPO_rollout_ep_len_mean = 2;
PPO_rollout_ep_rew_mean = 3;
PPO_time_fps = 4;
PPO_train_beta = 5;
PPO_train_fitness_score = 6;
PPO_train_mean_episodic_Re3_reward = 7;
PPO_train_mean_evaluation_length = 8;
PPO_train_mean_evaluation_reward = 9;
PPO_train_real_mean_ep_len = 10;
PPO_train_approx_kl = 11;
PPO_train_clip_fraction = 12;
PPO_train_clip_range = 13;
PPO_train_entropy_loss = 14;
PPO_train_explained_variancet = 15;
PPO_rain_learning_rate = 16;
PPO_train_loss = 17;
PPO_train_policy_gradient_loss = 18;
PPO_train_std = 19;
PPO_train_value_loss = 20;

path = "data_cpy/csv/PPO_k_test_3-1000/";

PPO_k_3_number_0 = readmatrix(strcat(path, "PPO_k_3_number_0.csv"));
PPO_k_3_number_1 = readmatrix(strcat(path, "PPO_k_3_number_1.csv"));
PPO_k_3_number_2 = readmatrix(strcat(path, "PPO_k_3_number_2.csv"));
PPO_k_3_number_3 = readmatrix(strcat(path, "PPO_k_3_number_3.csv"));
PPO_k_3_number_4 = readmatrix(strcat(path, "PPO_k_3_number_4.csv"));

PPO_k_50_number_0 = readmatrix(strcat(path, "PPO_k_50_number_0.csv"));
PPO_k_50_number_1 = readmatrix(strcat(path, "PPO_k_50_number_1.csv"));
PPO_k_50_number_2 = readmatrix(strcat(path, "PPO_k_50_number_2.csv"));
PPO_k_50_number_3 = readmatrix(strcat(path, "PPO_k_50_number_3.csv"));
PPO_k_50_number_4 = readmatrix(strcat(path, "PPO_k_50_number_4.csv"));

PPO_k_100_number_0 = readmatrix(strcat(path, "PPO_k_100_number_0.csv"));
PPO_k_100_number_1 = readmatrix(strcat(path, "PPO_k_100_number_1.csv"));
PPO_k_100_number_2 = readmatrix(strcat(path, "PPO_k_100_number_2.csv"));
PPO_k_100_number_3 = readmatrix(strcat(path, "PPO_k_100_number_3.csv"));
PPO_k_100_number_4 = readmatrix(strcat(path, "PPO_k_100_number_4.csv"));

PPO_k_200_number_0 = readmatrix(strcat(path, "PPO_k_200_number_0.csv"));
PPO_k_200_number_1 = readmatrix(strcat(path, "PPO_k_200_number_1.csv"));
PPO_k_200_number_2 = readmatrix(strcat(path, "PPO_k_200_number_2.csv"));
PPO_k_200_number_3 = readmatrix(strcat(path, "PPO_k_200_number_3.csv"));
PPO_k_200_number_4 = readmatrix(strcat(path, "PPO_k_200_number_4.csv"));

PPO_k_500_number_0 = readmatrix(strcat(path, "PPO_k_500_number_0.csv"));
PPO_k_500_number_1 = readmatrix(strcat(path, "PPO_k_500_number_1.csv"));
PPO_k_500_number_2 = readmatrix(strcat(path, "PPO_k_500_number_2.csv"));
PPO_k_500_number_3 = readmatrix(strcat(path, "PPO_k_500_number_3.csv"));
PPO_k_500_number_4 = readmatrix(strcat(path, "PPO_k_500_number_4.csv"));

PPO_k_1000_number_0 = readmatrix(strcat(path, "PPO_k_1000_number_0.csv"));
PPO_k_1000_number_1 = readmatrix(strcat(path, "PPO_k_1000_number_1.csv"));
PPO_k_1000_number_2 = readmatrix(strcat(path, "PPO_k_1000_number_2.csv"));
PPO_k_1000_number_3 = readmatrix(strcat(path, "PPO_k_1000_number_3.csv"));
PPO_k_1000_number_4 = readmatrix(strcat(path, "PPO_k_1000_number_4.csv"));

PPO_k3_mean = (PPO_k_3_number_0 + PPO_k_3_number_1 + PPO_k_3_number_2 + PPO_k_3_number_3 + PPO_k_3_number_4) / number_of_evals;
PPO_k50_mean = (PPO_k_50_number_0 + PPO_k_50_number_1 + PPO_k_50_number_2 + PPO_k_50_number_3 + PPO_k_50_number_4) / number_of_evals;
PPO_k100_mean = (PPO_k_100_number_0 + PPO_k_100_number_1 + PPO_k_100_number_2 + PPO_k_100_number_3 + PPO_k_100_number_4) / number_of_evals;
PPO_k200_mean = (PPO_k_200_number_0 + PPO_k_200_number_1 + PPO_k_200_number_2 + PPO_k_200_number_3 + PPO_k_200_number_4) / number_of_evals;
PPO_k500_mean = (PPO_k_500_number_0 + PPO_k_500_number_1 + PPO_k_500_number_2 + PPO_k_500_number_3 + PPO_k_500_number_4) / number_of_evals;
PPO_k1000_mean = (PPO_k_1000_number_0 + PPO_k_1000_number_1 + PPO_k_1000_number_2 + PPO_k_1000_number_3 + PPO_k_1000_number_4) / number_of_evals;

rows = size(PPO_k3_mean, 1);
iterations_vec = [1:1:rows];

figure(3);
hold on;
plot(iterations_vec, PPO_standad_avg(:, 7), 'LineWidth', 2);
plot(iterations_vec, PPO_k3_mean(:, PPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, PPO_k50_mean(:, PPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, PPO_k100_mean(:, PPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, PPO_k200_mean(:, PPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, PPO_k500_mean(:, PPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, PPO_k1000_mean(:, PPO_train_mean_evaluation_reward), 'LineWidth', 1);
legend('baseline', 'k = 3', 'k = 50', 'k = 100', 'k = 200', 'k = 500', 'k = 1000');
legend('Location', 'northwest');
title('PPO: Re3 k test');
xticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150]);
xlabel('Iterations');
ylabel('Mean evaluation reward');
hold off;

PPO_k_3_number_0_first_300 = return_it_where_val_is_reached(PPO_k_3_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_k_3_number_1_first_300 = return_it_where_val_is_reached(PPO_k_3_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_k_3_number_2_first_300 = return_it_where_val_is_reached(PPO_k_3_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_k_3_number_3_first_300 = return_it_where_val_is_reached(PPO_k_3_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_k_3_number_4_first_300 = return_it_where_val_is_reached(PPO_k_3_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_k_50_number_0_first_300 = return_it_where_val_is_reached(PPO_k_50_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_k_50_number_1_first_300 = return_it_where_val_is_reached(PPO_k_50_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_k_50_number_2_first_300 = return_it_where_val_is_reached(PPO_k_50_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_k_50_number_3_first_300 = return_it_where_val_is_reached(PPO_k_50_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_k_50_number_4_first_300 = return_it_where_val_is_reached(PPO_k_50_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_k_100_number_0_first_300 = return_it_where_val_is_reached(PPO_k_100_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_k_100_number_1_first_300 = return_it_where_val_is_reached(PPO_k_100_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_k_100_number_2_first_300 = return_it_where_val_is_reached(PPO_k_100_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_k_100_number_3_first_300 = return_it_where_val_is_reached(PPO_k_100_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_k_100_number_4_first_300 = return_it_where_val_is_reached(PPO_k_100_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_k_200_number_0_first_300 = return_it_where_val_is_reached(PPO_k_200_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_k_200_number_1_first_300 = return_it_where_val_is_reached(PPO_k_200_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_k_200_number_2_first_300 = return_it_where_val_is_reached(PPO_k_200_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_k_200_number_3_first_300 = return_it_where_val_is_reached(PPO_k_200_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_k_200_number_4_first_300 = return_it_where_val_is_reached(PPO_k_200_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_k_500_number_0_first_300 = return_it_where_val_is_reached(PPO_k_500_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_k_500_number_1_first_300 = return_it_where_val_is_reached(PPO_k_500_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_k_500_number_2_first_300 = return_it_where_val_is_reached(PPO_k_500_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_k_500_number_3_first_300 = return_it_where_val_is_reached(PPO_k_500_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_k_500_number_4_first_300 = return_it_where_val_is_reached(PPO_k_500_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_k_1000_number_0_first_300 = return_it_where_val_is_reached(PPO_k_1000_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_k_1000_number_1_first_300 = return_it_where_val_is_reached(PPO_k_1000_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_k_1000_number_2_first_300 = return_it_where_val_is_reached(PPO_k_1000_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_k_1000_number_3_first_300 = return_it_where_val_is_reached(PPO_k_1000_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_k_1000_number_4_first_300 = return_it_where_val_is_reached(PPO_k_1000_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_k3_first_300 = [PPO_k_3_number_0_first_300, PPO_k_3_number_1_first_300, PPO_k_3_number_2_first_300, PPO_k_3_number_3_first_300, PPO_k_3_number_4_first_300];
PPO_k50_first_300 = [PPO_k_50_number_0_first_300, PPO_k_50_number_1_first_300, PPO_k_50_number_2_first_300, PPO_k_50_number_3_first_300, PPO_k_50_number_4_first_300];
PPO_k100_first_300 = [PPO_k_100_number_0_first_300, PPO_k_100_number_1_first_300, PPO_k_100_number_2_first_300, PPO_k_100_number_3_first_300, PPO_k_100_number_4_first_300];
PPO_k200_first_300 = [PPO_k_200_number_0_first_300, PPO_k_200_number_1_first_300, PPO_k_200_number_2_first_300, PPO_k_200_number_3_first_300, PPO_k_200_number_4_first_300];
PPO_k500_first_300 = [PPO_k_500_number_0_first_300, PPO_k_500_number_1_first_300, PPO_k_500_number_2_first_300, PPO_k_500_number_3_first_300, PPO_k_500_number_4_first_300];
PPO_k1000_first_300 = [PPO_k_1000_number_0_first_300, PPO_k_1000_number_1_first_300, PPO_k_1000_number_2_first_300, PPO_k_1000_number_3_first_300, PPO_k_1000_number_4_first_300];

PPO_k3_first_300_mean = mean(PPO_k3_first_300);
PPO_k50_first_300_mean = mean(PPO_k50_first_300);
PPO_k100_first_300_mean = mean(PPO_k100_first_300);
PPO_k200_first_300_mean = mean(PPO_k200_first_300);
PPO_k500_first_300_mean = mean(PPO_k500_first_300);
PPO_k1000_first_300_mean = mean(PPO_k1000_first_300);

PPO_k3_first_300_lowest = min(PPO_k3_first_300);
PPO_k50_first_300_lowest = min(PPO_k50_first_300);
PPO_k100_first_300_lowest = min(PPO_k100_first_300);
PPO_k200_first_300_lowest = min(PPO_k200_first_300);
PPO_k500_first_300_lowest = min(PPO_k500_first_300);
PPO_k1000_first_300_lowest = min(PPO_k1000_first_300);


hold on;
figure(4);
hold on;
xticks_vec = ["baseline", "3", "50", "100", "200", "500", "1000"];
bar(xticks_vec, [ppo_first_300_mean, PPO_k3_first_300_mean, PPO_k50_first_300_mean, PPO_k100_first_300_mean, PPO_k200_first_300_mean, PPO_k500_first_300_mean, PPO_k1000_first_300_mean; ppo_first_300_lowest, PPO_k3_first_300_lowest, PPO_k50_first_300_lowest, PPO_k100_first_300_lowest, PPO_k200_first_300_lowest, PPO_k500_first_300_lowest, PPO_k1000_first_300_lowest]);
title('PPO: Iteration to get reward of 300 vs k');
xlabel('k');
ylabel('Iterations');
yline(ppo_first_300_mean, '--');
yline(ppo_standard_first_300_20_lowest, '--');
legend('Mean', 'Lowest', 'baseline mean', 'baseline 20% lowest');
legend('Location', 'southeast');
hold off;