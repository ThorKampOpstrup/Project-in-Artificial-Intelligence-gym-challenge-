clear;
close all;

addpath('plotter/');

load_avg_standard_trpo

% define column descriptors
step = 1;
rollout_ep_len_mean = 2;
rollout_ep_rew_mean = 3;
time_fps = 4;
train_fitness_score = 5;
train_mean_evaluation_length = 6;
train_mean_evaluation_reward = 7;
train_real_mean_ep_len = 8;
train_explained_variance = 9;
train_is_line_search_success = 10;
train_kl_divergence_loss = 11;
train_learning_rate = 12;
train_policy_objective = 13;
train_std = 14;
train_value_loss = 15;

path = "data_cpy/csv/TRPO_sigma_test_theta_1/";

TRPO_sigma_001_number_0 = readmatrix(strcat(path, "TRPO_sigma_0.010_number_0.csv"));
TRPO_sigma_001_number_1 = readmatrix(strcat(path, "TRPO_sigma_0.010_number_1.csv"));
TRPO_sigma_001_number_2 = readmatrix(strcat(path, "TRPO_sigma_0.010_number_2.csv"));
TRPO_sigma_001_number_3 = readmatrix(strcat(path, "TRPO_sigma_0.010_number_3.csv"));
TRPO_sigma_001_number_4 = readmatrix(strcat(path, "TRPO_sigma_0.010_number_4.csv"));

TRPO_sigma_002_number_0 = readmatrix(strcat(path, "TRPO_sigma_0.020_number_0.csv"));
TRPO_sigma_002_number_1 = readmatrix(strcat(path, "TRPO_sigma_0.020_number_1.csv"));
TRPO_sigma_002_number_2 = readmatrix(strcat(path, "TRPO_sigma_0.020_number_2.csv"));
TRPO_sigma_002_number_3 = readmatrix(strcat(path, "TRPO_sigma_0.020_number_3.csv"));
TRPO_sigma_002_number_4 = readmatrix(strcat(path, "TRPO_sigma_0.020_number_4.csv"));

TRPO_sigma_005_number_0 = readmatrix(strcat(path, "TRPO_sigma_0.050_number_0.csv"));
TRPO_sigma_005_number_1 = readmatrix(strcat(path, "TRPO_sigma_0.050_number_1.csv"));
TRPO_sigma_005_number_2 = readmatrix(strcat(path, "TRPO_sigma_0.050_number_2.csv"));
TRPO_sigma_005_number_3 = readmatrix(strcat(path, "TRPO_sigma_0.050_number_3.csv"));
TRPO_sigma_005_number_4 = readmatrix(strcat(path, "TRPO_sigma_0.050_number_4.csv"));

TRPO_sigma_010_number_0 = readmatrix(strcat(path, "TRPO_sigma_0.100_number_0.csv"));
TRPO_sigma_010_number_1 = readmatrix(strcat(path, "TRPO_sigma_0.100_number_1.csv"));
TRPO_sigma_010_number_2 = readmatrix(strcat(path, "TRPO_sigma_0.100_number_2.csv"));
TRPO_sigma_010_number_3 = readmatrix(strcat(path, "TRPO_sigma_0.100_number_3.csv"));
TRPO_sigma_010_number_4 = readmatrix(strcat(path, "TRPO_sigma_0.100_number_4.csv"));

TRPO_sigma_020_number_0 = readmatrix(strcat(path, "TRPO_sigma_0.200_number_0.csv"));
TRPO_sigma_020_number_1 = readmatrix(strcat(path, "TRPO_sigma_0.200_number_1.csv"));
TRPO_sigma_020_number_2 = readmatrix(strcat(path, "TRPO_sigma_0.200_number_2.csv"));
TRPO_sigma_020_number_3 = readmatrix(strcat(path, "TRPO_sigma_0.200_number_3.csv"));
TRPO_sigma_020_number_4 = readmatrix(strcat(path, "TRPO_sigma_0.200_number_4.csv"));

%takle the mean of all
TRPO_sigma_001_mean = (TRPO_sigma_001_number_0 + TRPO_sigma_001_number_1 + TRPO_sigma_001_number_2 + TRPO_sigma_001_number_3 + TRPO_sigma_001_number_4)/5;
TRPO_sigma_002_mean = (TRPO_sigma_002_number_0 + TRPO_sigma_002_number_1 + TRPO_sigma_002_number_2 + TRPO_sigma_002_number_3 + TRPO_sigma_002_number_4)/5;
TRPO_sigma_005_mean = (TRPO_sigma_005_number_0 + TRPO_sigma_005_number_1 + TRPO_sigma_005_number_2 + TRPO_sigma_005_number_3 + TRPO_sigma_005_number_4)/5;
TRPO_sigma_010_mean = (TRPO_sigma_010_number_0 + TRPO_sigma_010_number_1 + TRPO_sigma_010_number_2 + TRPO_sigma_010_number_3 + TRPO_sigma_010_number_4)/5;
TRPO_sigma_020_mean = (TRPO_sigma_020_number_0 + TRPO_sigma_020_number_1 + TRPO_sigma_020_number_2 + TRPO_sigma_020_number_3 + TRPO_sigma_020_number_4)/5;

rows = size(TRPO_sigma_001_mean, 1);
iterations_vector = [1:1:rows];

%plot
figure(1);
hold on;
plot(iterations_vector, trpo_standad_avg(:,train_mean_evaluation_reward), 'LineWidth', 2);
plot(iterations_vector, TRPO_sigma_001_mean(:,train_mean_evaluation_reward));
plot(iterations_vector, TRPO_sigma_002_mean(:,train_mean_evaluation_reward));
plot(iterations_vector, TRPO_sigma_005_mean(:,train_mean_evaluation_reward));
plot(iterations_vector, TRPO_sigma_010_mean(:,train_mean_evaluation_reward));
plot(iterations_vector, TRPO_sigma_020_mean(:,train_mean_evaluation_reward));
legend('baseline', '0.01', '0.02', '0.05', '0.10', '0.20');
title('TRPO: Mean Evaluation Reward vs Iterations');
xlabel('Iterations');
ylabel('Mean Evaluation Reward');
hold off;

TRPO_sigma_001_number_0_first_300 = return_it_where_val_is_reached(TRPO_sigma_001_number_0, 300, train_mean_evaluation_reward);
TRPO_sigma_001_number_1_first_300 = return_it_where_val_is_reached(TRPO_sigma_001_number_1, 300, train_mean_evaluation_reward);
TRPO_sigma_001_number_2_first_300 = return_it_where_val_is_reached(TRPO_sigma_001_number_2, 300, train_mean_evaluation_reward);
TRPO_sigma_001_number_3_first_300 = return_it_where_val_is_reached(TRPO_sigma_001_number_3, 300, train_mean_evaluation_reward);
TRPO_sigma_001_number_4_first_300 = return_it_where_val_is_reached(TRPO_sigma_001_number_4, 300, train_mean_evaluation_reward);

TRPO_sigma_002_number_0_first_300 = return_it_where_val_is_reached(TRPO_sigma_002_number_0, 300, train_mean_evaluation_reward);
TRPO_sigma_002_number_1_first_300 = return_it_where_val_is_reached(TRPO_sigma_002_number_1, 300, train_mean_evaluation_reward);
TRPO_sigma_002_number_2_first_300 = return_it_where_val_is_reached(TRPO_sigma_002_number_2, 300, train_mean_evaluation_reward);
TRPO_sigma_002_number_3_first_300 = return_it_where_val_is_reached(TRPO_sigma_002_number_3, 300, train_mean_evaluation_reward);
TRPO_sigma_002_number_4_first_300 = return_it_where_val_is_reached(TRPO_sigma_002_number_4, 300, train_mean_evaluation_reward);

TRPO_sigma_005_number_0_first_300 = return_it_where_val_is_reached(TRPO_sigma_005_number_0, 300, train_mean_evaluation_reward);
TRPO_sigma_005_number_1_first_300 = return_it_where_val_is_reached(TRPO_sigma_005_number_1, 300, train_mean_evaluation_reward);
TRPO_sigma_005_number_2_first_300 = return_it_where_val_is_reached(TRPO_sigma_005_number_2, 300, train_mean_evaluation_reward);
TRPO_sigma_005_number_3_first_300 = return_it_where_val_is_reached(TRPO_sigma_005_number_3, 300, train_mean_evaluation_reward);
TRPO_sigma_005_number_4_first_300 = return_it_where_val_is_reached(TRPO_sigma_005_number_4, 300, train_mean_evaluation_reward);

TRPO_sigma_010_number_0_first_300 = return_it_where_val_is_reached(TRPO_sigma_010_number_0, 300, train_mean_evaluation_reward);
TRPO_sigma_010_number_1_first_300 = return_it_where_val_is_reached(TRPO_sigma_010_number_1, 300, train_mean_evaluation_reward);
TRPO_sigma_010_number_2_first_300 = return_it_where_val_is_reached(TRPO_sigma_010_number_2, 300, train_mean_evaluation_reward);
TRPO_sigma_010_number_3_first_300 = return_it_where_val_is_reached(TRPO_sigma_010_number_3, 300, train_mean_evaluation_reward);
TRPO_sigma_010_number_4_first_300 = return_it_where_val_is_reached(TRPO_sigma_010_number_4, 300, train_mean_evaluation_reward);

TRPO_sigma_020_number_0_first_300 = return_it_where_val_is_reached(TRPO_sigma_020_number_0, 300, train_mean_evaluation_reward);
TRPO_sigma_020_number_1_first_300 = return_it_where_val_is_reached(TRPO_sigma_020_number_1, 300, train_mean_evaluation_reward);
TRPO_sigma_020_number_2_first_300 = return_it_where_val_is_reached(TRPO_sigma_020_number_2, 300, train_mean_evaluation_reward);
TRPO_sigma_020_number_3_first_300 = return_it_where_val_is_reached(TRPO_sigma_020_number_3, 300, train_mean_evaluation_reward);
TRPO_sigma_020_number_4_first_300 = return_it_where_val_is_reached(TRPO_sigma_020_number_4, 300, train_mean_evaluation_reward);

TRPO_sigma_001_first_300 = [TRPO_sigma_001_number_0_first_300, TRPO_sigma_001_number_1_first_300, TRPO_sigma_001_number_2_first_300, TRPO_sigma_001_number_3_first_300, TRPO_sigma_001_number_4_first_300];
TRPO_sigma_002_first_300 = [TRPO_sigma_002_number_0_first_300, TRPO_sigma_002_number_1_first_300, TRPO_sigma_002_number_2_first_300, TRPO_sigma_002_number_3_first_300, TRPO_sigma_002_number_4_first_300];
TRPO_sigma_005_first_300 = [TRPO_sigma_005_number_0_first_300, TRPO_sigma_005_number_1_first_300, TRPO_sigma_005_number_2_first_300, TRPO_sigma_005_number_3_first_300, TRPO_sigma_005_number_4_first_300];
TRPO_sigma_010_first_300 = [TRPO_sigma_010_number_0_first_300, TRPO_sigma_010_number_1_first_300, TRPO_sigma_010_number_2_first_300, TRPO_sigma_010_number_3_first_300, TRPO_sigma_010_number_4_first_300];
TRPO_sigma_020_first_300 = [TRPO_sigma_020_number_0_first_300, TRPO_sigma_020_number_1_first_300, TRPO_sigma_020_number_2_first_300, TRPO_sigma_020_number_3_first_300, TRPO_sigma_020_number_4_first_300];


TRPO_sigma_001_first_300_mean = mean(TRPO_sigma_001_first_300)
TRPO_sigma_002_first_300_mean = mean(TRPO_sigma_002_first_300)
TRPO_sigma_005_first_300_mean = mean(TRPO_sigma_005_first_300)
TRPO_sigma_010_first_300_mean = mean(TRPO_sigma_010_first_300)
TRPO_sigma_020_first_300_mean = mean(TRPO_sigma_020_first_300)

TRPO_sigma_001_first_300_lowest = min(TRPO_sigma_001_first_300)
TRPO_sigma_002_first_300_lowest = min(TRPO_sigma_002_first_300)
TRPO_sigma_005_first_300_lowest = min(TRPO_sigma_005_first_300)
TRPO_sigma_010_first_300_lowest = min(TRPO_sigma_010_first_300)
TRPO_sigma_020_first_300_lowest = min(TRPO_sigma_020_first_300)

hold on;
figure(2);
%make bar plot of all first_300_mean and first_300_lowest
xticks_vec = ["baseline", "0.01" "0.02" "0.05" "0.1" "0.2"];
bar(xticks_vec, [trpo_first_300_mean, TRPO_sigma_001_first_300_mean, TRPO_sigma_002_first_300_mean, TRPO_sigma_005_first_300_mean, TRPO_sigma_010_first_300_mean, TRPO_sigma_020_first_300_mean; trpo_first_300_lowest, TRPO_sigma_001_first_300_lowest, TRPO_sigma_002_first_300_lowest, TRPO_sigma_005_first_300_lowest, TRPO_sigma_010_first_300_lowest, TRPO_sigma_020_first_300_lowest]);
title('TRPO: Iteration to get reward of 300 vs Sigma');
subtitle('Mean and lowest of 5 runs theta=1')
xlabel('Sigma');
ylabel('Iteration');
yline(trpo_first_300_mean, '--');
yline(trpo_first_300_lowest, '--');
legend('Mean', 'Lowest', 'baseline mean', 'baseline lowest');
hold off;

