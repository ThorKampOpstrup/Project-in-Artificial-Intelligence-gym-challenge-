clear;


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

%delete last row of all matrices
TRPO_sigma_001_number_0(end,:) = [];
TRPO_sigma_001_number_1(end,:) = [];
TRPO_sigma_001_number_2(end,:) = [];
TRPO_sigma_001_number_3(end,:) = [];
TRPO_sigma_001_number_4(end,:) = [];

TRPO_sigma_002_number_0(end,:) = [];
TRPO_sigma_002_number_1(end,:) = [];
TRPO_sigma_002_number_2(end,:) = [];
TRPO_sigma_002_number_3(end,:) = [];
TRPO_sigma_002_number_4(end,:) = [];

TRPO_sigma_005_number_0(end,:) = [];
TRPO_sigma_005_number_1(end,:) = [];
TRPO_sigma_005_number_2(end,:) = [];
TRPO_sigma_005_number_3(end,:) = [];
TRPO_sigma_005_number_4(end,:) = [];

TRPO_sigma_010_number_0(end,:) = [];
TRPO_sigma_010_number_1(end,:) = [];
TRPO_sigma_010_number_2(end,:) = [];
TRPO_sigma_010_number_3(end,:) = [];
TRPO_sigma_010_number_4(end,:) = [];

TRPO_sigma_020_number_0(end,:) = [];
TRPO_sigma_020_number_1(end,:) = [];
TRPO_sigma_020_number_2(end,:) = [];
TRPO_sigma_020_number_3(end,:) = [];
TRPO_sigma_020_number_4(end,:) = [];

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
plot(iterations_vector, TRPO_sigma_001_mean(:,train_mean_evaluation_reward));
plot(iterations_vector, TRPO_sigma_002_mean(:,train_mean_evaluation_reward));
plot(iterations_vector, TRPO_sigma_005_mean(:,train_mean_evaluation_reward));
plot(iterations_vector, TRPO_sigma_010_mean(:,train_mean_evaluation_reward));
plot(iterations_vector, TRPO_sigma_020_mean(:,train_mean_evaluation_reward));
legend('0.01', '0.02', '0.05', '0.10', '0.20');
title('TRPO: Mean Evaluation Reward vs Iterations');
xlabel('Iterations');
ylabel('Mean Evaluation Reward');
hold off;
