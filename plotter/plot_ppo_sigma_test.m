clear;
addpath('plotter/');
load_avg_standard_ppo

number_of_evals = 5;

PPO_step =1;
PPO_rollout_ep_len_mean = 2;
PPO_rollout_ep_rew_mean = 3;
PPO_time_fps = 4;
PPO_train_fitness_score = 5;
PPO_train_mean_evaluation_length = 6;
PPO_train_mean_evaluation_reward = 7;
PPO_train_real_mean_ep_len = 8;
PPO_train_approx_kl = 9;
PPO_train_clip_fraction = 10;
PPO_train_clip_range = 11;
PPO_train_entropy_loss = 12;
PPO_train_explained_variance = 13;
PPO_train_learning_rate = 14;
PPO_train_loss = 15;
PPO_train_policy_gradient_loss = 16;
PPO_train_std = 17;
PPO_train_value_loss = 18; 

path = "data_cpy/csv/PPO_sigma_test_theta1";

sigma_000_number_0 = readmatrix(strcat(path, "/sigma_0.000_number_0.csv"));
sigma_000_number_1 = readmatrix(strcat(path, "/sigma_0.000_number_1.csv"));
sigma_000_number_2 = readmatrix(strcat(path, "/sigma_0.000_number_2.csv"));
sigma_000_number_3 = readmatrix(strcat(path, "/sigma_0.000_number_3.csv"));
sigma_000_number_4 = readmatrix(strcat(path, "/sigma_0.000_number_4.csv"));

sigma_050_number_0 = readmatrix(strcat(path, "/sigma_0.050_number_0.csv"));
sigma_050_number_1 = readmatrix(strcat(path, "/sigma_0.050_number_1.csv"));
sigma_050_number_2 = readmatrix(strcat(path, "/sigma_0.050_number_2.csv"));
sigma_050_number_3 = readmatrix(strcat(path, "/sigma_0.050_number_3.csv"));
sigma_050_number_4 = readmatrix(strcat(path, "/sigma_0.050_number_4.csv"));

sigma_075_number_0 = readmatrix(strcat(path, "/sigma_0.075_number_0.csv"));
sigma_075_number_1 = readmatrix(strcat(path, "/sigma_0.075_number_1.csv"));
sigma_075_number_2 = readmatrix(strcat(path, "/sigma_0.075_number_2.csv"));
sigma_075_number_3 = readmatrix(strcat(path, "/sigma_0.075_number_3.csv"));
sigma_075_number_4 = readmatrix(strcat(path, "/sigma_0.075_number_4.csv"));

sigma_100_number_0 = readmatrix(strcat(path, "/sigma_0.100_number_0.csv"));
sigma_100_number_1 = readmatrix(strcat(path, "/sigma_0.100_number_1.csv"));
sigma_100_number_2 = readmatrix(strcat(path, "/sigma_0.100_number_2.csv"));
sigma_100_number_3 = readmatrix(strcat(path, "/sigma_0.100_number_3.csv"));
sigma_100_number_4 = readmatrix(strcat(path, "/sigma_0.100_number_4.csv"));

sigma_125_number_0 = readmatrix(strcat(path, "/sigma_0.125_number_0.csv"));
sigma_125_number_1 = readmatrix(strcat(path, "/sigma_0.125_number_1.csv"));
sigma_125_number_2 = readmatrix(strcat(path, "/sigma_0.125_number_2.csv"));
sigma_125_number_3 = readmatrix(strcat(path, "/sigma_0.125_number_3.csv"));
sigma_125_number_4 = readmatrix(strcat(path, "/sigma_0.125_number_4.csv"));

sigma_150_number_0 = readmatrix(strcat(path, "/sigma_0.150_number_0.csv"));
sigma_150_number_1 = readmatrix(strcat(path, "/sigma_0.150_number_1.csv"));
sigma_150_number_2 = readmatrix(strcat(path, "/sigma_0.150_number_2.csv"));
sigma_150_number_3 = readmatrix(strcat(path, "/sigma_0.150_number_3.csv"));
sigma_150_number_4 = readmatrix(strcat(path, "/sigma_0.150_number_4.csv"));

sigma_175_number_0 = readmatrix(strcat(path, "/sigma_0.175_number_0.csv"));
sigma_175_number_1 = readmatrix(strcat(path, "/sigma_0.175_number_1.csv"));
sigma_175_number_2 = readmatrix(strcat(path, "/sigma_0.175_number_2.csv"));
sigma_175_number_3 = readmatrix(strcat(path, "/sigma_0.175_number_3.csv"));
sigma_175_number_4 = readmatrix(strcat(path, "/sigma_0.175_number_4.csv"));

sigma_200_number_0 = readmatrix(strcat(path, "/sigma_0.200_number_0.csv"));
sigma_200_number_1 = readmatrix(strcat(path, "/sigma_0.200_number_1.csv"));
sigma_200_number_2 = readmatrix(strcat(path, "/sigma_0.200_number_2.csv"));
sigma_200_number_3 = readmatrix(strcat(path, "/sigma_0.200_number_3.csv"));
sigma_200_number_4 = readmatrix(strcat(path, "/sigma_0.200_number_4.csv"));

sigma_225_number_0 = readmatrix(strcat(path, "/sigma_0.225_number_0.csv"));
sigma_225_number_1 = readmatrix(strcat(path, "/sigma_0.225_number_1.csv"));
sigma_225_number_2 = readmatrix(strcat(path, "/sigma_0.225_number_2.csv"));
sigma_225_number_3 = readmatrix(strcat(path, "/sigma_0.225_number_3.csv"));
sigma_225_number_4 = readmatrix(strcat(path, "/sigma_0.225_number_4.csv"));

sigma_250_number_0 = readmatrix(strcat(path, "/sigma_0.250_number_0.csv"));
sigma_250_number_1 = readmatrix(strcat(path, "/sigma_0.250_number_1.csv"));
sigma_250_number_2 = readmatrix(strcat(path, "/sigma_0.250_number_2.csv"));
sigma_250_number_3 = readmatrix(strcat(path, "/sigma_0.250_number_3.csv"));
sigma_250_number_4 = readmatrix(strcat(path, "/sigma_0.250_number_4.csv"));

sigma_275_number_0 = readmatrix(strcat(path, "/sigma_0.275_number_0.csv"));
sigma_275_number_1 = readmatrix(strcat(path, "/sigma_0.275_number_1.csv"));
sigma_275_number_2 = readmatrix(strcat(path, "/sigma_0.275_number_2.csv"));
sigma_275_number_3 = readmatrix(strcat(path, "/sigma_0.275_number_3.csv"));
sigma_275_number_4 = readmatrix(strcat(path, "/sigma_0.275_number_4.csv"));

sigma_300_number_0 = readmatrix(strcat(path, "/sigma_0.300_number_0.csv"));
sigma_300_number_1 = readmatrix(strcat(path, "/sigma_0.300_number_1.csv"));
sigma_300_number_2 = readmatrix(strcat(path, "/sigma_0.300_number_2.csv"));
sigma_300_number_3 = readmatrix(strcat(path, "/sigma_0.300_number_3.csv"));
sigma_300_number_4 = readmatrix(strcat(path, "/sigma_0.300_number_4.csv"));

sigma_325_number_0 = readmatrix(strcat(path, "/sigma_0.325_number_0.csv"));
sigma_325_number_1 = readmatrix(strcat(path, "/sigma_0.325_number_1.csv"));
sigma_325_number_2 = readmatrix(strcat(path, "/sigma_0.325_number_2.csv"));
sigma_325_number_3 = readmatrix(strcat(path, "/sigma_0.325_number_3.csv"));
sigma_325_number_4 = readmatrix(strcat(path, "/sigma_0.325_number_4.csv"));

sigma_350_number_0 = readmatrix(strcat(path, "/sigma_0.350_number_0.csv"));
sigma_350_number_1 = readmatrix(strcat(path, "/sigma_0.350_number_1.csv"));
sigma_350_number_2 = readmatrix(strcat(path, "/sigma_0.350_number_2.csv"));
sigma_350_number_3 = readmatrix(strcat(path, "/sigma_0.350_number_3.csv"));
sigma_350_number_4 = readmatrix(strcat(path, "/sigma_0.350_number_4.csv"));

sigma_375_number_0 = readmatrix(strcat(path, "/sigma_0.375_number_0.csv"));
sigma_375_number_1 = readmatrix(strcat(path, "/sigma_0.375_number_1.csv"));
sigma_375_number_2 = readmatrix(strcat(path, "/sigma_0.375_number_2.csv"));
sigma_375_number_3 = readmatrix(strcat(path, "/sigma_0.375_number_3.csv"));
sigma_375_number_4 = readmatrix(strcat(path, "/sigma_0.375_number_4.csv"));

sigma_400_number_0 = readmatrix(strcat(path, "/sigma_0.400_number_0.csv"));
sigma_400_number_1 = readmatrix(strcat(path, "/sigma_0.400_number_1.csv"));
sigma_400_number_2 = readmatrix(strcat(path, "/sigma_0.400_number_2.csv"));
sigma_400_number_3 = readmatrix(strcat(path, "/sigma_0.400_number_3.csv"));
sigma_400_number_4 = readmatrix(strcat(path, "/sigma_0.400_number_4.csv"));

%take average of all similar runs
sigma_000_avg = (sigma_000_number_0 + sigma_000_number_1 + sigma_000_number_2 + sigma_000_number_3 + sigma_000_number_4)/number_of_evals;
sigma_050_avg = (sigma_050_number_0 + sigma_050_number_1 + sigma_050_number_2 + sigma_050_number_3 + sigma_050_number_4)/number_of_evals;
sigma_075_avg = (sigma_075_number_0 + sigma_075_number_1 + sigma_075_number_2 + sigma_075_number_3 + sigma_075_number_4)/number_of_evals;
sigma_100_avg = (sigma_100_number_0 + sigma_100_number_1 + sigma_100_number_2 + sigma_100_number_3 + sigma_100_number_4)/number_of_evals;
sigma_125_avg = (sigma_125_number_0 + sigma_125_number_1 + sigma_125_number_2 + sigma_125_number_3 + sigma_125_number_4)/number_of_evals;
sigma_150_avg = (sigma_150_number_0 + sigma_150_number_1 + sigma_150_number_2 + sigma_150_number_3 + sigma_150_number_4)/number_of_evals;
sigma_175_avg = (sigma_175_number_0 + sigma_175_number_1 + sigma_175_number_2 + sigma_175_number_3 + sigma_175_number_4)/number_of_evals;
sigma_200_avg = (sigma_200_number_0 + sigma_200_number_1 + sigma_200_number_2 + sigma_200_number_3 + sigma_200_number_4)/number_of_evals;
sigma_225_avg = (sigma_225_number_0 + sigma_225_number_1 + sigma_225_number_2 + sigma_225_number_3 + sigma_225_number_4)/number_of_evals;
sigma_250_avg = (sigma_250_number_0 + sigma_250_number_1 + sigma_250_number_2 + sigma_250_number_3 + sigma_250_number_4)/number_of_evals;
sigma_275_avg = (sigma_275_number_0 + sigma_275_number_1 + sigma_275_number_2 + sigma_275_number_3 + sigma_275_number_4)/number_of_evals;
sigma_300_avg = (sigma_300_number_0 + sigma_300_number_1 + sigma_300_number_2 + sigma_300_number_3 + sigma_300_number_4)/number_of_evals;
sigma_325_avg = (sigma_325_number_0 + sigma_325_number_1 + sigma_325_number_2 + sigma_325_number_3 + sigma_325_number_4)/number_of_evals;
sigma_350_avg = (sigma_350_number_0 + sigma_350_number_1 + sigma_350_number_2 + sigma_350_number_3 + sigma_350_number_4)/number_of_evals;
sigma_375_avg = (sigma_375_number_0 + sigma_375_number_1 + sigma_375_number_2 + sigma_375_number_3 + sigma_375_number_4)/number_of_evals;
sigma_400_avg = (sigma_400_number_0 + sigma_400_number_1 + sigma_400_number_2 + sigma_400_number_3 + sigma_400_number_4)/number_of_evals;

rows = size(sigma_050_avg, 1);
iterations_vec = [1:1:rows];

figure(1);
hold on;
increments = 1/16;
plot(iterations_vec, PPO_standad_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0, 0, 1], 'LineWidth', 2);

%plot(iterations_vec, sigma_000_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(1*increments), 1-(1*increments), 0], 'LineWidth', 2);
plot(iterations_vec, sigma_050_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(2*increments), 1-(2*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_075_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(3*increments), 1-(3*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_100_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(4*increments), 1-(4*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_125_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(5*increments), 1-(5*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_150_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(6*increments), 1-(6*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_175_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(7*increments), 1-(7*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_200_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(8*increments), 1-(8*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_225_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(9*increments), 1-(9*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_250_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(10*increments), 1-(10*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_275_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(11*increments), 1-(11*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_300_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(12*increments), 1-(12*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_325_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(13*increments), 1-(13*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_350_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(14*increments), 1-(14*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_375_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(15*increments), 1-(15*increments), 0], 'LineWidth', 1);
plot(iterations_vec, sigma_400_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0+(16*increments), 1-(16*increments), 0], 'LineWidth', 1);

legend('standard', 'sigma 0.050', 'sigma 0.075', 'sigma 0.100', 'sigma 0.125', 'sigma 0.150', 'sigma 0.175', 'sigma 0.200', 'sigma 0.225', 'sigma 0.250', 'sigma 0.275', 'sigma 0.300', 'sigma 0.325', 'sigma 0.350', 'sigma 0.375', 'sigma 0.400');
xlabel('iterations');
ylabel('mean evaluation reward');
title('Mean evaluation reward in PPO for different sigmas theta 1');
subtitle('Green is lower sigma, red is higher sigma');
legend('Location', 'northwest');
xticks([10 20 30 40 50 60 70 80 90 100 110 120 130 140 150])
hold off;

PPO_sigma_000_number_0_first_300 = return_it_where_val_is_reached(sigma_000_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_050_number_0_first_300 = return_it_where_val_is_reached(sigma_050_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_075_number_0_first_300 = return_it_where_val_is_reached(sigma_075_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_100_number_0_first_300 = return_it_where_val_is_reached(sigma_100_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_125_number_0_first_300 = return_it_where_val_is_reached(sigma_125_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_150_number_0_first_300 = return_it_where_val_is_reached(sigma_150_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_175_number_0_first_300 = return_it_where_val_is_reached(sigma_175_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_200_number_0_first_300 = return_it_where_val_is_reached(sigma_200_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_225_number_0_first_300 = return_it_where_val_is_reached(sigma_225_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_250_number_0_first_300 = return_it_where_val_is_reached(sigma_250_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_275_number_0_first_300 = return_it_where_val_is_reached(sigma_275_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_300_number_0_first_300 = return_it_where_val_is_reached(sigma_300_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_325_number_0_first_300 = return_it_where_val_is_reached(sigma_325_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_350_number_0_first_300 = return_it_where_val_is_reached(sigma_350_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_375_number_0_first_300 = return_it_where_val_is_reached(sigma_375_number_0, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_400_number_0_first_300 = return_it_where_val_is_reached(sigma_400_number_0, 300,ppo_train_mean_evaluation_reward);

PPO_sigma_000_number_1_first_300 = return_it_where_val_is_reached(sigma_000_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_050_number_1_first_300 = return_it_where_val_is_reached(sigma_050_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_075_number_1_first_300 = return_it_where_val_is_reached(sigma_075_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_100_number_1_first_300 = return_it_where_val_is_reached(sigma_100_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_125_number_1_first_300 = return_it_where_val_is_reached(sigma_125_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_150_number_1_first_300 = return_it_where_val_is_reached(sigma_150_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_175_number_1_first_300 = return_it_where_val_is_reached(sigma_175_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_200_number_1_first_300 = return_it_where_val_is_reached(sigma_200_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_225_number_1_first_300 = return_it_where_val_is_reached(sigma_225_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_250_number_1_first_300 = return_it_where_val_is_reached(sigma_250_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_275_number_1_first_300 = return_it_where_val_is_reached(sigma_275_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_300_number_1_first_300 = return_it_where_val_is_reached(sigma_300_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_325_number_1_first_300 = return_it_where_val_is_reached(sigma_325_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_350_number_1_first_300 = return_it_where_val_is_reached(sigma_350_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_375_number_1_first_300 = return_it_where_val_is_reached(sigma_375_number_1, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_400_number_1_first_300 = return_it_where_val_is_reached(sigma_400_number_1, 300,ppo_train_mean_evaluation_reward);

PPO_sigma_000_number_2_first_300 = return_it_where_val_is_reached(sigma_000_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_050_number_2_first_300 = return_it_where_val_is_reached(sigma_050_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_075_number_2_first_300 = return_it_where_val_is_reached(sigma_075_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_100_number_2_first_300 = return_it_where_val_is_reached(sigma_100_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_125_number_2_first_300 = return_it_where_val_is_reached(sigma_125_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_150_number_2_first_300 = return_it_where_val_is_reached(sigma_150_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_175_number_2_first_300 = return_it_where_val_is_reached(sigma_175_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_200_number_2_first_300 = return_it_where_val_is_reached(sigma_200_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_225_number_2_first_300 = return_it_where_val_is_reached(sigma_225_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_250_number_2_first_300 = return_it_where_val_is_reached(sigma_250_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_275_number_2_first_300 = return_it_where_val_is_reached(sigma_275_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_300_number_2_first_300 = return_it_where_val_is_reached(sigma_300_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_325_number_2_first_300 = return_it_where_val_is_reached(sigma_325_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_350_number_2_first_300 = return_it_where_val_is_reached(sigma_350_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_375_number_2_first_300 = return_it_where_val_is_reached(sigma_375_number_2, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_400_number_2_first_300 = return_it_where_val_is_reached(sigma_400_number_2, 300,ppo_train_mean_evaluation_reward);

PPO_sigma_000_number_3_first_300 = return_it_where_val_is_reached(sigma_000_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_050_number_3_first_300 = return_it_where_val_is_reached(sigma_050_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_075_number_3_first_300 = return_it_where_val_is_reached(sigma_075_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_100_number_3_first_300 = return_it_where_val_is_reached(sigma_100_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_125_number_3_first_300 = return_it_where_val_is_reached(sigma_125_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_150_number_3_first_300 = return_it_where_val_is_reached(sigma_150_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_175_number_3_first_300 = return_it_where_val_is_reached(sigma_175_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_200_number_3_first_300 = return_it_where_val_is_reached(sigma_200_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_225_number_3_first_300 = return_it_where_val_is_reached(sigma_225_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_250_number_3_first_300 = return_it_where_val_is_reached(sigma_250_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_275_number_3_first_300 = return_it_where_val_is_reached(sigma_275_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_300_number_3_first_300 = return_it_where_val_is_reached(sigma_300_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_325_number_3_first_300 = return_it_where_val_is_reached(sigma_325_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_350_number_3_first_300 = return_it_where_val_is_reached(sigma_350_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_375_number_3_first_300 = return_it_where_val_is_reached(sigma_375_number_3, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_400_number_3_first_300 = return_it_where_val_is_reached(sigma_400_number_3, 300,ppo_train_mean_evaluation_reward);

PPO_sigma_000_number_4_first_300 = return_it_where_val_is_reached(sigma_000_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_050_number_4_first_300 = return_it_where_val_is_reached(sigma_050_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_075_number_4_first_300 = return_it_where_val_is_reached(sigma_075_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_100_number_4_first_300 = return_it_where_val_is_reached(sigma_100_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_125_number_4_first_300 = return_it_where_val_is_reached(sigma_125_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_150_number_4_first_300 = return_it_where_val_is_reached(sigma_150_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_175_number_4_first_300 = return_it_where_val_is_reached(sigma_175_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_200_number_4_first_300 = return_it_where_val_is_reached(sigma_200_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_225_number_4_first_300 = return_it_where_val_is_reached(sigma_225_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_250_number_4_first_300 = return_it_where_val_is_reached(sigma_250_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_275_number_4_first_300 = return_it_where_val_is_reached(sigma_275_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_300_number_4_first_300 = return_it_where_val_is_reached(sigma_300_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_325_number_4_first_300 = return_it_where_val_is_reached(sigma_325_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_350_number_4_first_300 = return_it_where_val_is_reached(sigma_350_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_375_number_4_first_300 = return_it_where_val_is_reached(sigma_375_number_4, 300,ppo_train_mean_evaluation_reward);
PPO_sigma_400_number_4_first_300 = return_it_where_val_is_reached(sigma_400_number_4, 300,ppo_train_mean_evaluation_reward);

%make first vector of all the forst runs
PPO_sigma_000_first_300 = [PPO_sigma_000_number_0_first_300, PPO_sigma_000_number_1_first_300, PPO_sigma_000_number_2_first_300, PPO_sigma_000_number_3_first_300, PPO_sigma_000_number_4_first_300]
PPO_sigma_050_first_300 = [PPO_sigma_050_number_0_first_300, PPO_sigma_050_number_1_first_300, PPO_sigma_050_number_2_first_300, PPO_sigma_050_number_3_first_300, PPO_sigma_050_number_4_first_300]
PPO_sigma_075_first_300 = [PPO_sigma_075_number_0_first_300, PPO_sigma_075_number_1_first_300, PPO_sigma_075_number_2_first_300, PPO_sigma_075_number_3_first_300, PPO_sigma_075_number_4_first_300]
PPO_sigma_100_first_300 = [PPO_sigma_100_number_0_first_300, PPO_sigma_100_number_1_first_300, PPO_sigma_100_number_2_first_300, PPO_sigma_100_number_3_first_300, PPO_sigma_100_number_4_first_300]
PPO_sigma_125_first_300 = [PPO_sigma_125_number_0_first_300, PPO_sigma_125_number_1_first_300, PPO_sigma_125_number_2_first_300, PPO_sigma_125_number_3_first_300, PPO_sigma_125_number_4_first_300]
PPO_sigma_150_first_300 = [PPO_sigma_150_number_0_first_300, PPO_sigma_150_number_1_first_300, PPO_sigma_150_number_2_first_300, PPO_sigma_150_number_3_first_300, PPO_sigma_150_number_4_first_300]
PPO_sigma_175_first_300 = [PPO_sigma_175_number_0_first_300, PPO_sigma_175_number_1_first_300, PPO_sigma_175_number_2_first_300, PPO_sigma_175_number_3_first_300, PPO_sigma_175_number_4_first_300]
PPO_sigma_200_first_300 = [PPO_sigma_200_number_0_first_300, PPO_sigma_200_number_1_first_300, PPO_sigma_200_number_2_first_300, PPO_sigma_200_number_3_first_300, PPO_sigma_200_number_4_first_300]
PPO_sigma_225_first_300 = [PPO_sigma_225_number_0_first_300, PPO_sigma_225_number_1_first_300, PPO_sigma_225_number_2_first_300, PPO_sigma_225_number_3_first_300, PPO_sigma_225_number_4_first_300]
PPO_sigma_250_first_300 = [PPO_sigma_250_number_0_first_300, PPO_sigma_250_number_1_first_300, PPO_sigma_250_number_2_first_300, PPO_sigma_250_number_3_first_300, PPO_sigma_250_number_4_first_300]
PPO_sigma_275_first_300 = [PPO_sigma_275_number_0_first_300, PPO_sigma_275_number_1_first_300, PPO_sigma_275_number_2_first_300, PPO_sigma_275_number_3_first_300, PPO_sigma_275_number_4_first_300]
PPO_sigma_300_first_300 = [PPO_sigma_300_number_0_first_300, PPO_sigma_300_number_1_first_300, PPO_sigma_300_number_2_first_300, PPO_sigma_300_number_3_first_300, PPO_sigma_300_number_4_first_300]
PPO_sigma_325_first_300 = [PPO_sigma_325_number_0_first_300, PPO_sigma_325_number_1_first_300, PPO_sigma_325_number_2_first_300, PPO_sigma_325_number_3_first_300, PPO_sigma_325_number_4_first_300]
PPO_sigma_350_first_300 = [PPO_sigma_350_number_0_first_300, PPO_sigma_350_number_1_first_300, PPO_sigma_350_number_2_first_300, PPO_sigma_350_number_3_first_300, PPO_sigma_350_number_4_first_300]
PPO_sigma_375_first_300 = [PPO_sigma_375_number_0_first_300, PPO_sigma_375_number_1_first_300, PPO_sigma_375_number_2_first_300, PPO_sigma_375_number_3_first_300, PPO_sigma_375_number_4_first_300]
PPO_sigma_400_first_300 = [PPO_sigma_400_number_0_first_300, PPO_sigma_400_number_1_first_300, PPO_sigma_400_number_2_first_300, PPO_sigma_400_number_3_first_300, PPO_sigma_400_number_4_first_300]

%caluclate mean
PPO_sigma_000_first_300_mean = mean(PPO_sigma_000_first_300);
PPO_sigma_050_first_300_mean = mean(PPO_sigma_050_first_300);
PPO_sigma_075_first_300_mean = mean(PPO_sigma_075_first_300);
PPO_sigma_100_first_300_mean = mean(PPO_sigma_100_first_300);
PPO_sigma_125_first_300_mean = mean(PPO_sigma_125_first_300);
PPO_sigma_150_first_300_mean = mean(PPO_sigma_150_first_300);
PPO_sigma_175_first_300_mean = mean(PPO_sigma_175_first_300);
PPO_sigma_200_first_300_mean = mean(PPO_sigma_200_first_300);
PPO_sigma_225_first_300_mean = mean(PPO_sigma_225_first_300);
PPO_sigma_250_first_300_mean = mean(PPO_sigma_250_first_300);
PPO_sigma_275_first_300_mean = mean(PPO_sigma_275_first_300);
PPO_sigma_300_first_300_mean = mean(PPO_sigma_300_first_300);
PPO_sigma_325_first_300_mean = mean(PPO_sigma_325_first_300);
PPO_sigma_350_first_300_mean = mean(PPO_sigma_350_first_300);
PPO_sigma_375_first_300_mean = mean(PPO_sigma_375_first_300);
PPO_sigma_400_first_300_mean = mean(PPO_sigma_400_first_300);


%if rows+1 exist in TRPO_theta_01_first_300, set TRPO_theta_01_first_300_mean to 0
if sum(PPO_sigma_000_first_300 == rows+1)
    PPO_sigma_000_first_300_mean = 0;
end
if sum(PPO_sigma_050_first_300 == rows+1)
    PPO_sigma_050_first_300_mean = 0;
end
if sum(PPO_sigma_075_first_300 == rows+1)
    PPO_sigma_075_first_300_mean = 0;
end
if sum(PPO_sigma_100_first_300 == rows+1)
    PPO_sigma_100_first_300_mean = 0;
end
if sum(PPO_sigma_125_first_300 == rows+1)
    PPO_sigma_125_first_300_mean = 0;
end
if sum(PPO_sigma_150_first_300 == rows+1)
    PPO_sigma_150_first_300_mean = 0;
end
if sum(PPO_sigma_175_first_300 == rows+1)
    PPO_sigma_175_first_300_mean = 0;
end
if sum(PPO_sigma_200_first_300 == rows+1)
    PPO_sigma_200_first_300_mean = 0;
end
if sum(PPO_sigma_225_first_300 == rows+1)
    PPO_sigma_225_first_300_mean = 0;
end
if sum(PPO_sigma_250_first_300 == rows+1)
    PPO_sigma_250_first_300_mean = 0;
end
if sum(PPO_sigma_275_first_300 == rows+1)
    PPO_sigma_275_first_300_mean = 0;
end
if sum(PPO_sigma_300_first_300 == rows+1)
    PPO_sigma_300_first_300_mean = 0;
end
if sum(PPO_sigma_325_first_300 == rows+1)
    PPO_sigma_325_first_300_mean = 0;
end
if sum(PPO_sigma_350_first_300 == rows+1)
    PPO_sigma_350_first_300_mean = 0;
end
if sum(PPO_sigma_375_first_300 == rows+1)
    PPO_sigma_375_first_300_mean = 0;
end
if sum(PPO_sigma_400_first_300 == rows+1)
    PPO_sigma_400_first_300_mean = 0;
end

%calulate the lowest iteration where the 300 is reached
PPO_sigma_000_first_300_lowest = min(PPO_sigma_000_first_300);
PPO_sigma_050_first_300_lowest = min(PPO_sigma_050_first_300);
PPO_sigma_075_first_300_lowest = min(PPO_sigma_075_first_300);
PPO_sigma_100_first_300_lowest = min(PPO_sigma_100_first_300);
PPO_sigma_125_first_300_lowest = min(PPO_sigma_125_first_300);
PPO_sigma_150_first_300_lowest = min(PPO_sigma_150_first_300);
PPO_sigma_175_first_300_lowest = min(PPO_sigma_175_first_300);
PPO_sigma_200_first_300_lowest = min(PPO_sigma_200_first_300);
PPO_sigma_225_first_300_lowest = min(PPO_sigma_225_first_300);
PPO_sigma_250_first_300_lowest = min(PPO_sigma_250_first_300);
PPO_sigma_275_first_300_lowest = min(PPO_sigma_275_first_300);
PPO_sigma_300_first_300_lowest = min(PPO_sigma_300_first_300);
PPO_sigma_325_first_300_lowest = min(PPO_sigma_325_first_300);
PPO_sigma_350_first_300_lowest = min(PPO_sigma_350_first_300);
PPO_sigma_375_first_300_lowest = min(PPO_sigma_375_first_300);
PPO_sigma_400_first_300_lowest = min(PPO_sigma_400_first_300);

if PPO_sigma_000_first_300_lowest == rows+1
    PPO_sigma_000_first_300_lowest = 0;
end
if PPO_sigma_050_first_300_lowest == rows+1
    PPO_sigma_050_first_300_lowest = 0;
end
if PPO_sigma_075_first_300_lowest == rows+1
    PPO_sigma_075_first_300_lowest = 0;
end
if PPO_sigma_100_first_300_lowest == rows+1
    PPO_sigma_100_first_300_lowest = 0;
end
if PPO_sigma_125_first_300_lowest == rows+1
    PPO_sigma_125_first_300_lowest = 0;
end
if PPO_sigma_150_first_300_lowest == rows+1
    PPO_sigma_150_first_300_lowest = 0;
end
if PPO_sigma_175_first_300_lowest == rows+1
    PPO_sigma_175_first_300_lowest = 0;
end
if PPO_sigma_200_first_300_lowest == rows+1
    PPO_sigma_200_first_300_lowest = 0;
end
if PPO_sigma_225_first_300_lowest == rows+1
    PPO_sigma_225_first_300_lowest = 0;
end
if PPO_sigma_250_first_300_lowest == rows+1
    PPO_sigma_250_first_300_lowest = 0;
end
if PPO_sigma_275_first_300_lowest == rows+1
    PPO_sigma_275_first_300_lowest = 0;
end
if PPO_sigma_300_first_300_lowest == rows+1
    PPO_sigma_300_first_300_lowest = 0;
end
if PPO_sigma_325_first_300_lowest == rows+1
    PPO_sigma_325_first_300_lowest = 0;
end
if PPO_sigma_350_first_300_lowest == rows+1
    PPO_sigma_350_first_300_lowest = 0;
end
if PPO_sigma_375_first_300_lowest == rows+1
    PPO_sigma_375_first_300_lowest = 0;
end
if PPO_sigma_400_first_300_lowest == rows+1
    PPO_sigma_400_first_300_lowest = 0;
end

%plot the graph
figure(2);
hold on;
xticks_vec=["baseline", "0.05", "0.075", "0.10"];
bar(xticks_vec, [ppo_first_300_mean, PPO_sigma_050_first_300_mean, PPO_sigma_075_first_300_mean, PPO_sigma_100_first_300_mean; ppo_first_300_lowest, PPO_sigma_050_first_300_lowest, PPO_sigma_075_first_300_lowest, PPO_sigma_100_first_300_lowest]);
title('PPO: Iteration to get reward of 300 vs Sigma');
subtitle('If no bar is shown, the 300 mean evaluation reward was not reached');
xlabel('sigma');
ylabel('iterations');
yline(ppo_first_300_mean, '--r');
yline(ppo_standard_first_300_20_lowest, '--b');
legend('mean', 'lowest iteration', 'baseline mean', 'baseline 20% lowest iteration');
legend('Location', 'southeast');
