clear;

number_of_evals = 5;

steps = 1;
rollout_ep_len_mean = 2;
rollout_ep_rew_mean = 3;
time_fps = 4;
train_beta_loss = 5;
train_fitness_score = 6;
train_mean_episodic_Re3_reward = 7;	
train_mean_evaluation_length = 8;
train_mean_evaluation_reward = 9;
train_real_mean_ep_len = 10;
train_explained_variance = 11;
train_is_line_search_success = 12;	
train_kl_divergence_loss = 13;
train_learning_rate = 14;
train_policy_objective = 15;
train_std = 16;
train_value_loss = 17;


path = "data_cpy/csv/OU_noise_sigma/";

OU_noise_sigma_005_number_0 = readmatrix(strcat(path, "OU_noise_sigma_0.05_number_0.csv"));
OU_noise_sigma_005_number_1 = readmatrix(strcat(path, "OU_noise_sigma_0.05_number_1.csv"));
OU_noise_sigma_005_number_2 = readmatrix(strcat(path, "OU_noise_sigma_0.05_number_2.csv"));
OU_noise_sigma_005_number_3 = readmatrix(strcat(path, "OU_noise_sigma_0.05_number_3.csv"));
OU_noise_sigma_005_number_4 = readmatrix(strcat(path, "OU_noise_sigma_0.05_number_4.csv"));

OU_noise_sigma_011_number_0 = readmatrix(strcat(path, "OU_noise_sigma_0.11_number_0.csv"));
OU_noise_sigma_011_number_1 = readmatrix(strcat(path, "OU_noise_sigma_0.11_number_1.csv"));
OU_noise_sigma_011_number_2 = readmatrix(strcat(path, "OU_noise_sigma_0.11_number_2.csv"));
OU_noise_sigma_011_number_3 = readmatrix(strcat(path, "OU_noise_sigma_0.11_number_3.csv"));
OU_noise_sigma_011_number_4 = readmatrix(strcat(path, "OU_noise_sigma_0.11_number_4.csv"));

OU_noise_sigma_016_number_0 = readmatrix(strcat(path, "OU_noise_sigma_0.16_number_0.csv"));
OU_noise_sigma_016_number_1 = readmatrix(strcat(path, "OU_noise_sigma_0.16_number_1.csv"));
OU_noise_sigma_016_number_2 = readmatrix(strcat(path, "OU_noise_sigma_0.16_number_2.csv"));
OU_noise_sigma_016_number_3 = readmatrix(strcat(path, "OU_noise_sigma_0.16_number_3.csv"));
OU_noise_sigma_016_number_4 = readmatrix(strcat(path, "OU_noise_sigma_0.16_number_4.csv"));

OU_noise_sigma_022_number_0 = readmatrix(strcat(path, "OU_noise_sigma_0.22_number_0.csv"));
OU_noise_sigma_022_number_1 = readmatrix(strcat(path, "OU_noise_sigma_0.22_number_1.csv"));
OU_noise_sigma_022_number_2 = readmatrix(strcat(path, "OU_noise_sigma_0.22_number_2.csv"));
OU_noise_sigma_022_number_3 = readmatrix(strcat(path, "OU_noise_sigma_0.22_number_3.csv"));
OU_noise_sigma_022_number_4 = readmatrix(strcat(path, "OU_noise_sigma_0.22_number_4.csv"));

OU_noise_sigma_027_number_0 = readmatrix(strcat(path, "OU_noise_sigma_0.27_number_0.csv"));
OU_noise_sigma_027_number_1 = readmatrix(strcat(path, "OU_noise_sigma_0.27_number_1.csv"));
OU_noise_sigma_027_number_2 = readmatrix(strcat(path, "OU_noise_sigma_0.27_number_2.csv"));
OU_noise_sigma_027_number_3 = readmatrix(strcat(path, "OU_noise_sigma_0.27_number_3.csv"));
OU_noise_sigma_027_number_4 = readmatrix(strcat(path, "OU_noise_sigma_0.27_number_4.csv"));

OU_noise_sigma_032_number_0 = readmatrix(strcat(path, "OU_noise_sigma_0.32_number_0.csv"));
OU_noise_sigma_032_number_1 = readmatrix(strcat(path, "OU_noise_sigma_0.32_number_1.csv"));
OU_noise_sigma_032_number_2 = readmatrix(strcat(path, "OU_noise_sigma_0.32_number_2.csv"));
OU_noise_sigma_032_number_3 = readmatrix(strcat(path, "OU_noise_sigma_0.32_number_3.csv"));
OU_noise_sigma_032_number_4 = readmatrix(strcat(path, "OU_noise_sigma_0.32_number_4.csv"));

OU_noise_sigma_038_number_0 = readmatrix(strcat(path, "OU_noise_sigma_0.38_number_0.csv"));
OU_noise_sigma_038_number_1 = readmatrix(strcat(path, "OU_noise_sigma_0.38_number_1.csv"));
OU_noise_sigma_038_number_2 = readmatrix(strcat(path, "OU_noise_sigma_0.38_number_2.csv"));
OU_noise_sigma_038_number_3 = readmatrix(strcat(path, "OU_noise_sigma_0.38_number_3.csv"));
OU_noise_sigma_038_number_4 = readmatrix(strcat(path, "OU_noise_sigma_0.38_number_4.csv"));

OU_noise_sigma_044_number_0 = readmatrix(strcat(path, "OU_noise_sigma_0.44_number_0.csv"));
OU_noise_sigma_044_number_1 = readmatrix(strcat(path, "OU_noise_sigma_0.44_number_1.csv"));
OU_noise_sigma_044_number_2 = readmatrix(strcat(path, "OU_noise_sigma_0.44_number_2.csv"));
OU_noise_sigma_044_number_3 = readmatrix(strcat(path, "OU_noise_sigma_0.44_number_3.csv"));
OU_noise_sigma_044_number_4 = readmatrix(strcat(path, "OU_noise_sigma_0.44_number_4.csv"));

OU_noise_sigma_049_number_0 = readmatrix(strcat(path, "OU_noise_sigma_0.49_number_0.csv"));
OU_noise_sigma_049_number_1 = readmatrix(strcat(path, "OU_noise_sigma_0.49_number_1.csv"));
OU_noise_sigma_049_number_2 = readmatrix(strcat(path, "OU_noise_sigma_0.49_number_2.csv"));
OU_noise_sigma_049_number_3 = readmatrix(strcat(path, "OU_noise_sigma_0.49_number_3.csv"));
OU_noise_sigma_049_number_4 = readmatrix(strcat(path, "OU_noise_sigma_0.49_number_4.csv"));

%delete the first row of all
OU_noise_sigma_005_number_0(1,:) = [];
OU_noise_sigma_005_number_1(1,:) = [];
OU_noise_sigma_005_number_2(1,:) = [];
OU_noise_sigma_005_number_3(1,:) = [];
OU_noise_sigma_005_number_4(1,:) = [];

OU_noise_sigma_011_number_0(1,:) = [];
OU_noise_sigma_011_number_1(1,:) = [];
OU_noise_sigma_011_number_2(1,:) = [];
OU_noise_sigma_011_number_3(1,:) = [];
OU_noise_sigma_011_number_4(1,:) = [];

OU_noise_sigma_016_number_0(1,:) = [];
OU_noise_sigma_016_number_1(1,:) = [];
OU_noise_sigma_016_number_2(1,:) = [];
OU_noise_sigma_016_number_3(1,:) = [];
OU_noise_sigma_016_number_4(1,:) = [];

OU_noise_sigma_022_number_0(1,:) = [];
OU_noise_sigma_022_number_1(1,:) = [];
OU_noise_sigma_022_number_2(1,:) = [];
OU_noise_sigma_022_number_3(1,:) = [];
OU_noise_sigma_022_number_4(1,:) = [];

OU_noise_sigma_027_number_0(1,:) = [];
OU_noise_sigma_027_number_1(1,:) = [];
OU_noise_sigma_027_number_2(1,:) = [];
OU_noise_sigma_027_number_3(1,:) = [];
OU_noise_sigma_027_number_4(1,:) = [];

OU_noise_sigma_032_number_0(1,:) = [];
OU_noise_sigma_032_number_1(1,:) = [];
OU_noise_sigma_032_number_2(1,:) = [];
OU_noise_sigma_032_number_3(1,:) = [];
OU_noise_sigma_032_number_4(1,:) = [];

OU_noise_sigma_038_number_0(1,:) = [];
OU_noise_sigma_038_number_1(1,:) = [];
OU_noise_sigma_038_number_2(1,:) = [];
OU_noise_sigma_038_number_3(1,:) = [];
OU_noise_sigma_038_number_4(1,:) = [];

OU_noise_sigma_044_number_0(1,:) = [];
OU_noise_sigma_044_number_1(1,:) = [];
OU_noise_sigma_044_number_2(1,:) = [];
OU_noise_sigma_044_number_3(1,:) = [];
OU_noise_sigma_044_number_4(1,:) = [];

OU_noise_sigma_049_number_0(1,:) = [];
OU_noise_sigma_049_number_1(1,:) = [];
OU_noise_sigma_049_number_2(1,:) = [];
OU_noise_sigma_049_number_3(1,:) = [];
OU_noise_sigma_049_number_4(1,:) = [];

% take the mean of all
OU_noise_sigma_005_avg = (OU_noise_sigma_005_number_0 + OU_noise_sigma_005_number_1 + OU_noise_sigma_005_number_2 + OU_noise_sigma_005_number_3 + OU_noise_sigma_005_number_4)/number_of_evals;
OU_noise_sigma_011_avg = (OU_noise_sigma_011_number_0 + OU_noise_sigma_011_number_1 + OU_noise_sigma_011_number_2 + OU_noise_sigma_011_number_3 + OU_noise_sigma_011_number_4)/number_of_evals;
OU_noise_sigma_016_avg = (OU_noise_sigma_016_number_0 + OU_noise_sigma_016_number_1 + OU_noise_sigma_016_number_2 + OU_noise_sigma_016_number_3 + OU_noise_sigma_016_number_4)/number_of_evals;
OU_noise_sigma_022_avg = (OU_noise_sigma_022_number_0 + OU_noise_sigma_022_number_1 + OU_noise_sigma_022_number_2 + OU_noise_sigma_022_number_3 + OU_noise_sigma_022_number_4)/number_of_evals;
OU_noise_sigma_027_avg = (OU_noise_sigma_027_number_0 + OU_noise_sigma_027_number_1 + OU_noise_sigma_027_number_2 + OU_noise_sigma_027_number_3 + OU_noise_sigma_027_number_4)/number_of_evals;
OU_noise_sigma_032_avg = (OU_noise_sigma_032_number_0 + OU_noise_sigma_032_number_1 + OU_noise_sigma_032_number_2 + OU_noise_sigma_032_number_3 + OU_noise_sigma_032_number_4)/number_of_evals;
OU_noise_sigma_038_avg = (OU_noise_sigma_038_number_0 + OU_noise_sigma_038_number_1 + OU_noise_sigma_038_number_2 + OU_noise_sigma_038_number_3 + OU_noise_sigma_038_number_4)/number_of_evals;
OU_noise_sigma_044_avg = (OU_noise_sigma_044_number_0 + OU_noise_sigma_044_number_1 + OU_noise_sigma_044_number_2 + OU_noise_sigma_044_number_3 + OU_noise_sigma_044_number_4)/number_of_evals;
OU_noise_sigma_049_avg = (OU_noise_sigma_049_number_0 + OU_noise_sigma_049_number_1 + OU_noise_sigma_049_number_2 + OU_noise_sigma_049_number_3 + OU_noise_sigma_049_number_4)/number_of_evals;

rows = size(OU_noise_sigma_005_avg, 1);
iterations_vec = [1:1:rows];

figure(1);
hold on;
plot(iterations_vec, OU_noise_sigma_005_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, OU_noise_sigma_011_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, OU_noise_sigma_016_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, OU_noise_sigma_022_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, OU_noise_sigma_027_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, OU_noise_sigma_032_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, OU_noise_sigma_038_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, OU_noise_sigma_044_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, OU_noise_sigma_049_avg(:,train_mean_evaluation_reward));

legend('OU noise sigma 0.05', 'OU noise sigma 0.11', 'OU noise sigma 0.16', 'OU noise sigma 0.22', 'OU noise sigma 0.27', 'OU noise sigma 0.32', 'OU noise sigma 0.38', 'OU noise sigma 0.44', 'OU noise sigma 0.49');
title('train/mean\_evaluation\_reward over iterations for all OU noise sigma');
xlabel('iterations');
ylabel('train/mean\_evaluation\_reward');
hold off;
