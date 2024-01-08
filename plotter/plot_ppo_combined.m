close all;
addpath("plotter/");

load_avg_standard_ppo;

number_of_evals = 20;

step = 1;
rollout_ep_len_mean = 2;
rollout_ep_rew_mean = 3;
time_fps = 4;
train_beta = 5;
train_fitness_score = 6;
train_mean_episodic_Re3_reward = 7;
train_mean_evaluation_length = 8;
train_mean_evaluation_reward = 9;
train_real_mean_ep_len = 10;
train_approx_kl = 11;
train_clip_fraction = 12;
train_clip_range = 13;
train_entropy_loss = 14;
train_explained_variance = 15;
train_learning_rate = 16;
train_loss = 17;
train_policy_gradient_loss = 18;
train_std = 19;
train_value_loss = 20;

path = "data_cpy/csv/PPO_Re3_OU_test/";

run1 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_0.csv"));
run2 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_1.csv"));
run3 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_2.csv"));
run4 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_3.csv"));
run5 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_4.csv"));
run6 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_5.csv"));
run7 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_6.csv"));
run8 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_7.csv"));
run9 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_8.csv"));
run10 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_9.csv"));
run11 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_10.csv"));
run12 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_11.csv"));
run13 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_12.csv"));
run14 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_13.csv"));
run15 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_14.csv"));
run16 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_15.csv"));
run17 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_16.csv"));
run18 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_17.csv"));
run19 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_18.csv"));
run20 = readmatrix(strcat(path, "PPO_k_200_sigma_0.02_theta_1_number_19.csv"));

rows = size(run1, 1);
iterations_vec = [1:1:rows];

PPO_Re3_OU_test_mean =(run1 + run2 + run3 + run4 + run5 + run6 + run7 + run8 + run9 + run10 + run11 + run12 + run13 + run14 + run15 + run16 + run17 + run18 + run19 + run20) / number_of_evals;

figure(1);
hold on;
plot(iterations_vec, PPO_Re3_OU_test_mean(:, PPO_train_mean_evaluation_reward), 'LineWidth', 1);
plot(iterations_vec, PPO_standad_avg(:, ppo_train_mean_evaluation_reward), 'LineWidth', 1);
legend("PPO Re3 OU test", "PPO standard");
legend("Location", "southeast");
xlabel("Iterations");
ylabel("Mean evaluation reward");
xticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150]);
title("PPO Re3 OU test vs PPO standard");
hold off;

run1_first_300 = return_it_where_val_is_reached(run1, 300, PPO_train_mean_evaluation_reward);
run2_first_300 = return_it_where_val_is_reached(run2, 300, PPO_train_mean_evaluation_reward);
run3_first_300 = return_it_where_val_is_reached(run3, 300, PPO_train_mean_evaluation_reward);
run4_first_300 = return_it_where_val_is_reached(run4, 300, PPO_train_mean_evaluation_reward);
run5_first_300 = return_it_where_val_is_reached(run5, 300, PPO_train_mean_evaluation_reward);
run6_first_300 = return_it_where_val_is_reached(run6, 300, PPO_train_mean_evaluation_reward);
run7_first_300 = return_it_where_val_is_reached(run7, 300, PPO_train_mean_evaluation_reward);
run8_first_300 = return_it_where_val_is_reached(run8, 300, PPO_train_mean_evaluation_reward);
run9_first_300 = return_it_where_val_is_reached(run9, 300, PPO_train_mean_evaluation_reward);
run10_first_300 = return_it_where_val_is_reached(run10, 300, PPO_train_mean_evaluation_reward);
run11_first_300 = return_it_where_val_is_reached(run11, 300, PPO_train_mean_evaluation_reward);
run12_first_300 = return_it_where_val_is_reached(run12, 300, PPO_train_mean_evaluation_reward);
run13_first_300 = return_it_where_val_is_reached(run13, 300, PPO_train_mean_evaluation_reward);
run14_first_300 = return_it_where_val_is_reached(run14, 300, PPO_train_mean_evaluation_reward);
run15_first_300 = return_it_where_val_is_reached(run15, 300, PPO_train_mean_evaluation_reward);
run16_first_300 = return_it_where_val_is_reached(run16, 300, PPO_train_mean_evaluation_reward);
run17_first_300 = return_it_where_val_is_reached(run17, 300, PPO_train_mean_evaluation_reward);
run18_first_300 = return_it_where_val_is_reached(run18, 300, PPO_train_mean_evaluation_reward);
run19_first_300 = return_it_where_val_is_reached(run19, 300, PPO_train_mean_evaluation_reward);
run20_first_300 = return_it_where_val_is_reached(run20, 300, PPO_train_mean_evaluation_reward);

PPO_Re3_OU_first_300 = [run1_first_300, run2_first_300, run3_first_300, run4_first_300, run5_first_300, run6_first_300, run7_first_300, run8_first_300, run9_first_300, run10_first_300, run11_first_300, run12_first_300, run13_first_300, run14_first_300, run15_first_300, run16_first_300, run17_first_300, run18_first_300, run19_first_300, run20_first_300]
PPO_Re3_OU_first_300 = PPO_Re3_OU_first_300(PPO_Re3_OU_first_300 ~= rows+1);

PPO_Re3_OU_first_300_mean = mean(PPO_Re3_OU_first_300);
PPO_Re3_OU_first_300_lowest = min(PPO_Re3_OU_first_300);

figure(2);
hold on;
xticks_vec = ["PPO standard", "PPO Re3 OU test"];
bar(xticks_vec, [ppo_first_300_mean, ppo_first_300_lowest; PPO_Re3_OU_first_300_mean, PPO_Re3_OU_first_300_lowest]);

legend("Mean", "Lowest");
title("PPO standard vs PPO Re3 OU test");
ylabel("Iterations");
hold off;
