%close all figures
close all;

addpath('plotter/');

load_avg_standard_ppo
load_avg_standard_trpo

number_of_evals = 5;

% define column descriptors TRPO
TRPO_step = 1;
TRPO_rollout_ep_len_mean = 2;
TRPO_rollout_ep_rew_mean = 3;
TRPO_time_fps = 4;
TRPO_train_fitness_score = 5;
TRPO_train_mean_evaluation_length = 6;
TRPO_train_mean_evaluation_reward = 7;
TRPO_train_real_mean_ep_len = 8;
TRPO_train_explained_variance = 9;
TRPO_train_is_line_search_success = 10;
TRPO_train_kl_divergence_loss = 11;
TRPO_train_learning_rate = 12;
TRPO_train_policy_objective = 13;
TRPO_train_std = 14;
TRPO_train_value_loss = 15;

% define column descriptors PPO
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


TRPO_path = "data_cpy/csv/TRPO_theta_test_sigma_0.05";
PPO_path = "data_cpy/csv/PPO_theta_test_sigma_0.05";

%load TRPO data
TRPO_theta_01_number_0 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.1_number_0.csv"));
TRPO_theta_01_number_1 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.1_number_1.csv"));
TRPO_theta_01_number_2 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.1_number_2.csv"));
TRPO_theta_01_number_3 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.1_number_3.csv"));
TRPO_theta_01_number_4 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.1_number_4.csv"));

TRPO_theta_02_number_0 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.2_number_0.csv"));
TRPO_theta_02_number_1 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.2_number_1.csv"));
TRPO_theta_02_number_2 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.2_number_2.csv"));
TRPO_theta_02_number_3 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.2_number_3.csv"));
TRPO_theta_02_number_4 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.2_number_4.csv"));

TRPO_theta_05_number_0 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.5_number_0.csv"));
TRPO_theta_05_number_1 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.5_number_1.csv"));
TRPO_theta_05_number_2 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.5_number_2.csv"));
TRPO_theta_05_number_3 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.5_number_3.csv"));
TRPO_theta_05_number_4 = readmatrix(strcat(TRPO_path, "/TRPO_theta_0.5_number_4.csv"));

TRPO_theta_1_number_0 = readmatrix(strcat(TRPO_path, "/TRPO_theta_1.0_number_0.csv"));
TRPO_theta_1_number_1 = readmatrix(strcat(TRPO_path, "/TRPO_theta_1.0_number_1.csv"));
TRPO_theta_1_number_2 = readmatrix(strcat(TRPO_path, "/TRPO_theta_1.0_number_2.csv"));
TRPO_theta_1_number_3 = readmatrix(strcat(TRPO_path, "/TRPO_theta_1.0_number_3.csv"));
TRPO_theta_1_number_4 = readmatrix(strcat(TRPO_path, "/TRPO_theta_1.0_number_4.csv"));

TRPO_theta_2_number_0 = readmatrix(strcat(TRPO_path, "/TRPO_theta_2.0_number_0.csv"));
TRPO_theta_2_number_1 = readmatrix(strcat(TRPO_path, "/TRPO_theta_2.0_number_1.csv"));
TRPO_theta_2_number_2 = readmatrix(strcat(TRPO_path, "/TRPO_theta_2.0_number_2.csv"));
TRPO_theta_2_number_3 = readmatrix(strcat(TRPO_path, "/TRPO_theta_2.0_number_3.csv"));
TRPO_theta_2_number_4 = readmatrix(strcat(TRPO_path, "/TRPO_theta_2.0_number_4.csv"));

TRPO_theta_3_number_0 = readmatrix(strcat(TRPO_path, "/TRPO_theta_3.0_number_0.csv"));
TRPO_theta_3_number_1 = readmatrix(strcat(TRPO_path, "/TRPO_theta_3.0_number_1.csv"));
TRPO_theta_3_number_2 = readmatrix(strcat(TRPO_path, "/TRPO_theta_3.0_number_2.csv"));
TRPO_theta_3_number_3 = readmatrix(strcat(TRPO_path, "/TRPO_theta_3.0_number_3.csv"));
TRPO_theta_3_number_4 = readmatrix(strcat(TRPO_path, "/TRPO_theta_3.0_number_4.csv"));

TRPO_theta_5_number_0 = readmatrix(strcat(TRPO_path, "/TRPO_theta_5.0_number_0.csv"));
TRPO_theta_5_number_1 = readmatrix(strcat(TRPO_path, "/TRPO_theta_5.0_number_1.csv"));
TRPO_theta_5_number_2 = readmatrix(strcat(TRPO_path, "/TRPO_theta_5.0_number_2.csv"));
TRPO_theta_5_number_3 = readmatrix(strcat(TRPO_path, "/TRPO_theta_5.0_number_3.csv"));
TRPO_theta_5_number_4 = readmatrix(strcat(TRPO_path, "/TRPO_theta_5.0_number_4.csv"));

%load PPO data
PPO_theta_01_number_0 = readmatrix(strcat(PPO_path, "/PPO_theta_0.1_number_0.csv"));
PPO_theta_01_number_1 = readmatrix(strcat(PPO_path, "/PPO_theta_0.1_number_1.csv"));
PPO_theta_01_number_2 = readmatrix(strcat(PPO_path, "/PPO_theta_0.1_number_2.csv"));
PPO_theta_01_number_3 = readmatrix(strcat(PPO_path, "/PPO_theta_0.1_number_3.csv"));
PPO_theta_01_number_4 = readmatrix(strcat(PPO_path, "/PPO_theta_0.1_number_4.csv"));

PPO_theta_02_number_0 = readmatrix(strcat(PPO_path, "/PPO_theta_0.2_number_0.csv"));
PPO_theta_02_number_1 = readmatrix(strcat(PPO_path, "/PPO_theta_0.2_number_1.csv"));
PPO_theta_02_number_2 = readmatrix(strcat(PPO_path, "/PPO_theta_0.2_number_2.csv"));
PPO_theta_02_number_3 = readmatrix(strcat(PPO_path, "/PPO_theta_0.2_number_3.csv"));
PPO_theta_02_number_4 = readmatrix(strcat(PPO_path, "/PPO_theta_0.2_number_4.csv"));

PPO_theta_05_number_0 = readmatrix(strcat(PPO_path, "/PPO_theta_0.5_number_0.csv"));
PPO_theta_05_number_1 = readmatrix(strcat(PPO_path, "/PPO_theta_0.5_number_1.csv"));
PPO_theta_05_number_2 = readmatrix(strcat(PPO_path, "/PPO_theta_0.5_number_2.csv"));
PPO_theta_05_number_3 = readmatrix(strcat(PPO_path, "/PPO_theta_0.5_number_3.csv"));
PPO_theta_05_number_4 = readmatrix(strcat(PPO_path, "/PPO_theta_0.5_number_4.csv"));

PPO_theta_1_number_0 = readmatrix(strcat(PPO_path, "/PPO_theta_1.0_number_0.csv"));
PPO_theta_1_number_1 = readmatrix(strcat(PPO_path, "/PPO_theta_1.0_number_1.csv"));
PPO_theta_1_number_2 = readmatrix(strcat(PPO_path, "/PPO_theta_1.0_number_2.csv"));
PPO_theta_1_number_3 = readmatrix(strcat(PPO_path, "/PPO_theta_1.0_number_3.csv"));
PPO_theta_1_number_4 = readmatrix(strcat(PPO_path, "/PPO_theta_1.0_number_4.csv"));

PPO_theta_3_number_0 = readmatrix(strcat(PPO_path, "/PPO_theta_3.0_number_0.csv"));
PPO_theta_3_number_1 = readmatrix(strcat(PPO_path, "/PPO_theta_3.0_number_1.csv"));
PPO_theta_3_number_2 = readmatrix(strcat(PPO_path, "/PPO_theta_3.0_number_2.csv"));
PPO_theta_3_number_3 = readmatrix(strcat(PPO_path, "/PPO_theta_3.0_number_3.csv"));
PPO_theta_3_number_4 = readmatrix(strcat(PPO_path, "/PPO_theta_3.0_number_4.csv"));

PPO_theta_2_number_0 = readmatrix(strcat(PPO_path, "/PPO_theta_2.0_number_0.csv"));
PPO_theta_2_number_1 = readmatrix(strcat(PPO_path, "/PPO_theta_2.0_number_1.csv"));
PPO_theta_2_number_2 = readmatrix(strcat(PPO_path, "/PPO_theta_2.0_number_2.csv"));
PPO_theta_2_number_3 = readmatrix(strcat(PPO_path, "/PPO_theta_2.0_number_3.csv"));
PPO_theta_2_number_4 = readmatrix(strcat(PPO_path, "/PPO_theta_2.0_number_4.csv"));

PPO_theta_5_number_0 = readmatrix(strcat(PPO_path, "/PPO_theta_5.0_number_0.csv"));
PPO_theta_5_number_1 = readmatrix(strcat(PPO_path, "/PPO_theta_5.0_number_1.csv"));
PPO_theta_5_number_2 = readmatrix(strcat(PPO_path, "/PPO_theta_5.0_number_2.csv"));
PPO_theta_5_number_3 = readmatrix(strcat(PPO_path, "/PPO_theta_5.0_number_3.csv"));
PPO_theta_5_number_4 = readmatrix(strcat(PPO_path, "/PPO_theta_5.0_number_4.csv"));



%take the mean of all
TRPO_theta_01_avg = (TRPO_theta_01_number_0 + TRPO_theta_01_number_1 + TRPO_theta_01_number_2 + TRPO_theta_01_number_3 + TRPO_theta_01_number_4)/number_of_evals;
TRPO_theta_02_avg = (TRPO_theta_02_number_0 + TRPO_theta_02_number_1 + TRPO_theta_02_number_2 + TRPO_theta_02_number_3 + TRPO_theta_02_number_4)/number_of_evals;
TRPO_theta_05_avg = (TRPO_theta_05_number_0 + TRPO_theta_05_number_1 + TRPO_theta_05_number_2 + TRPO_theta_05_number_3 + TRPO_theta_05_number_4)/number_of_evals;
TRPO_theta_1_avg = (TRPO_theta_1_number_0 + TRPO_theta_1_number_1 + TRPO_theta_1_number_2 + TRPO_theta_1_number_3 + TRPO_theta_1_number_4)/number_of_evals;
TRPO_theta_2_avg = (TRPO_theta_2_number_0 + TRPO_theta_2_number_1 + TRPO_theta_2_number_2 + TRPO_theta_2_number_3 + TRPO_theta_2_number_4)/number_of_evals;
TRPO_theta_3_avg = (TRPO_theta_3_number_0 + TRPO_theta_3_number_1 + TRPO_theta_3_number_2 + TRPO_theta_3_number_3 + TRPO_theta_3_number_4)/number_of_evals;
TRPO_theta_5_avg = (TRPO_theta_5_number_0 + TRPO_theta_5_number_1 + TRPO_theta_5_number_2 + TRPO_theta_5_number_3 + TRPO_theta_5_number_4)/number_of_evals;

PPO_theta_01_avg = (PPO_theta_01_number_0 + PPO_theta_01_number_1 + PPO_theta_01_number_2 + PPO_theta_01_number_3 + PPO_theta_01_number_4)/number_of_evals;
PPO_theta_02_avg = (PPO_theta_02_number_0 + PPO_theta_02_number_1 + PPO_theta_02_number_2 + PPO_theta_02_number_3 + PPO_theta_02_number_4)/number_of_evals;
PPO_theta_05_avg = (PPO_theta_05_number_0 + PPO_theta_05_number_1 + PPO_theta_05_number_2 + PPO_theta_05_number_3 + PPO_theta_05_number_4)/number_of_evals;
PPO_theta_1_avg = (PPO_theta_1_number_0 + PPO_theta_1_number_1 + PPO_theta_1_number_2 + PPO_theta_1_number_3 + PPO_theta_1_number_4)/number_of_evals;
PPO_theta_2_avg = (PPO_theta_2_number_0 + PPO_theta_2_number_1 + PPO_theta_2_number_2 + PPO_theta_2_number_3 + PPO_theta_2_number_4)/number_of_evals;
PPO_theta_3_avg = (PPO_theta_3_number_0 + PPO_theta_3_number_1 + PPO_theta_3_number_2 + PPO_theta_3_number_3 + PPO_theta_3_number_4)/number_of_evals;
PPO_theta_5_avg = (PPO_theta_5_number_0 + PPO_theta_5_number_1 + PPO_theta_5_number_2 + PPO_theta_5_number_3 + PPO_theta_5_number_4)/number_of_evals;

rows = size(TRPO_theta_01_avg, 1);
iterations_vec = [1:1:rows];

figure(1);
hold on;

increments = 1/7;
%plot the daqta, let it go from ret to green ina smooth way in rgb values
plot(iterations_vec, trpo_standad_avg(:,TRPO_train_mean_evaluation_reward), 'Color', [0, 0, 1]);
plot(iterations_vec, TRPO_theta_01_avg(:,TRPO_train_mean_evaluation_reward), 'Color', [1-(1*increments), 0+(1*increments), 0]);
plot(iterations_vec, TRPO_theta_02_avg(:,TRPO_train_mean_evaluation_reward), 'Color', [1-(2*increments), 0+(2*increments), 0]);
plot(iterations_vec, TRPO_theta_05_avg(:,TRPO_train_mean_evaluation_reward), 'Color', [1-(3*increments), 0+(3*increments), 0]);
plot(iterations_vec, TRPO_theta_1_avg(:,TRPO_train_mean_evaluation_reward), 'Color', [1-(4*increments), 0+(4*increments), 0]);
plot(iterations_vec, TRPO_theta_2_avg(:,TRPO_train_mean_evaluation_reward), 'Color', [1-(5*increments), 0+(5*increments), 0]);
plot(iterations_vec, TRPO_theta_3_avg(:,TRPO_train_mean_evaluation_reward), 'Color', [1-(6*increments), 0+(6*increments), 0]);
plot(iterations_vec, TRPO_theta_5_avg(:,TRPO_train_mean_evaluation_reward), 'Color', [1-(7*increments), 0+(7*increments), 0]);

%insert horizontal line at 300 color red and title
%yline(300, '--r', '300');
legend('baseline', 'Theta 0.1', 'Theta 0.2', 'Theta 0.5', 'Theta 1.0', 'Theta 2.0', 'Theta 3.0', 'Theta 5.0');
title('Theta value impact on TRPO');
subtitle('Green higher theta, red lower theta');
xticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150]);
xlabel('Iterations');
ylabel('Mean Evaluation Reward');
legend('Location','northwest');
hold off;


figure(2);
hold on;
plot(iterations_vec, PPO_standad_avg(:,PPO_train_mean_evaluation_reward), 'Color', [0, 0, 1]);
plot(iterations_vec, PPO_theta_01_avg(:,PPO_train_mean_evaluation_reward), 'Color', [1-(1*increments), 0+(1*increments), 0]);
plot(iterations_vec, PPO_theta_02_avg(:,PPO_train_mean_evaluation_reward), 'Color', [1-(2*increments), 0+(2*increments), 0]);
plot(iterations_vec, PPO_theta_05_avg(:,PPO_train_mean_evaluation_reward), 'Color', [1-(3*increments), 0+(3*increments), 0]);
plot(iterations_vec, PPO_theta_1_avg(:,PPO_train_mean_evaluation_reward), 'Color', [1-(4*increments), 0+(4*increments), 0]);
plot(iterations_vec, PPO_theta_2_avg(:,PPO_train_mean_evaluation_reward), 'Color', [1-(5*increments), 0+(5*increments), 0]);
plot(iterations_vec, PPO_theta_3_avg(:,PPO_train_mean_evaluation_reward), 'Color', [1-(6*increments), 0+(6*increments), 0]);
plot(iterations_vec, PPO_theta_5_avg(:,PPO_train_mean_evaluation_reward), 'Color', [1-(7*increments), 0+(7*increments), 0]);

%yline(300, '--r', '300');
title('Theta value impact on PPO');
subtitle('Green higher theta, red lower theta');
xticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150]);
xlabel('Iterations');
ylabel('Mean Evaluation Reward');
legend('baseline', 'Theta 0.1', 'Theta 0.2', 'Theta 0.5', 'Theta 1.0', 'Theta 2.0', 'Theta 3.0', 'Theta 5.0');
%place legend top left corner
legend('Location','northwest');
hold off;

%calulate and plot iterations to reach 300
TRPO_theta_01_number_0_first_300 = return_it_where_val_is_reached(TRPO_theta_01_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_01_number_1_first_300 = return_it_where_val_is_reached(TRPO_theta_01_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_01_number_2_first_300 = return_it_where_val_is_reached(TRPO_theta_01_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_01_number_3_first_300 = return_it_where_val_is_reached(TRPO_theta_01_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_01_number_4_first_300 = return_it_where_val_is_reached(TRPO_theta_01_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_theta_02_number_0_first_300 = return_it_where_val_is_reached(TRPO_theta_02_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_02_number_1_first_300 = return_it_where_val_is_reached(TRPO_theta_02_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_02_number_2_first_300 = return_it_where_val_is_reached(TRPO_theta_02_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_02_number_3_first_300 = return_it_where_val_is_reached(TRPO_theta_02_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_02_number_4_first_300 = return_it_where_val_is_reached(TRPO_theta_02_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_theta_05_number_0_first_300 = return_it_where_val_is_reached(TRPO_theta_05_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_05_number_1_first_300 = return_it_where_val_is_reached(TRPO_theta_05_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_05_number_2_first_300 = return_it_where_val_is_reached(TRPO_theta_05_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_05_number_3_first_300 = return_it_where_val_is_reached(TRPO_theta_05_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_05_number_4_first_300 = return_it_where_val_is_reached(TRPO_theta_05_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_theta_1_number_0_first_300 = return_it_where_val_is_reached(TRPO_theta_1_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_1_number_1_first_300 = return_it_where_val_is_reached(TRPO_theta_1_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_1_number_2_first_300 = return_it_where_val_is_reached(TRPO_theta_1_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_1_number_3_first_300 = return_it_where_val_is_reached(TRPO_theta_1_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_1_number_4_first_300 = return_it_where_val_is_reached(TRPO_theta_1_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_theta_2_number_0_first_300 = return_it_where_val_is_reached(TRPO_theta_2_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_2_number_1_first_300 = return_it_where_val_is_reached(TRPO_theta_2_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_2_number_2_first_300 = return_it_where_val_is_reached(TRPO_theta_2_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_2_number_3_first_300 = return_it_where_val_is_reached(TRPO_theta_2_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_2_number_4_first_300 = return_it_where_val_is_reached(TRPO_theta_2_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_theta_3_number_0_first_300 = return_it_where_val_is_reached(TRPO_theta_3_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_3_number_1_first_300 = return_it_where_val_is_reached(TRPO_theta_3_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_3_number_2_first_300 = return_it_where_val_is_reached(TRPO_theta_3_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_3_number_3_first_300 = return_it_where_val_is_reached(TRPO_theta_3_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_3_number_4_first_300 = return_it_where_val_is_reached(TRPO_theta_3_number_4, 300, TRPO_train_mean_evaluation_reward);

TRPO_theta_5_number_0_first_300 = return_it_where_val_is_reached(TRPO_theta_5_number_0, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_5_number_1_first_300 = return_it_where_val_is_reached(TRPO_theta_5_number_1, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_5_number_2_first_300 = return_it_where_val_is_reached(TRPO_theta_5_number_2, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_5_number_3_first_300 = return_it_where_val_is_reached(TRPO_theta_5_number_3, 300, TRPO_train_mean_evaluation_reward);
TRPO_theta_5_number_4_first_300 = return_it_where_val_is_reached(TRPO_theta_5_number_4, 300, TRPO_train_mean_evaluation_reward);

PPO_theta_01_number_0_first_300 = return_it_where_val_is_reached(PPO_theta_01_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_theta_01_number_1_first_300 = return_it_where_val_is_reached(PPO_theta_01_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_theta_01_number_2_first_300 = return_it_where_val_is_reached(PPO_theta_01_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_theta_01_number_3_first_300 = return_it_where_val_is_reached(PPO_theta_01_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_theta_01_number_4_first_300 = return_it_where_val_is_reached(PPO_theta_01_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_theta_02_number_0_first_300 = return_it_where_val_is_reached(PPO_theta_02_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_theta_02_number_1_first_300 = return_it_where_val_is_reached(PPO_theta_02_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_theta_02_number_2_first_300 = return_it_where_val_is_reached(PPO_theta_02_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_theta_02_number_3_first_300 = return_it_where_val_is_reached(PPO_theta_02_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_theta_02_number_4_first_300 = return_it_where_val_is_reached(PPO_theta_02_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_theta_05_number_0_first_300 = return_it_where_val_is_reached(PPO_theta_05_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_theta_05_number_1_first_300 = return_it_where_val_is_reached(PPO_theta_05_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_theta_05_number_2_first_300 = return_it_where_val_is_reached(PPO_theta_05_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_theta_05_number_3_first_300 = return_it_where_val_is_reached(PPO_theta_05_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_theta_05_number_4_first_300 = return_it_where_val_is_reached(PPO_theta_05_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_theta_1_number_0_first_300 = return_it_where_val_is_reached(PPO_theta_1_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_theta_1_number_1_first_300 = return_it_where_val_is_reached(PPO_theta_1_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_theta_1_number_2_first_300 = return_it_where_val_is_reached(PPO_theta_1_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_theta_1_number_3_first_300 = return_it_where_val_is_reached(PPO_theta_1_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_theta_1_number_4_first_300 = return_it_where_val_is_reached(PPO_theta_1_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_theta_2_number_0_first_300 = return_it_where_val_is_reached(PPO_theta_2_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_theta_2_number_1_first_300 = return_it_where_val_is_reached(PPO_theta_2_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_theta_2_number_2_first_300 = return_it_where_val_is_reached(PPO_theta_2_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_theta_2_number_3_first_300 = return_it_where_val_is_reached(PPO_theta_2_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_theta_2_number_4_first_300 = return_it_where_val_is_reached(PPO_theta_2_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_theta_3_number_0_first_300 = return_it_where_val_is_reached(PPO_theta_3_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_theta_3_number_1_first_300 = return_it_where_val_is_reached(PPO_theta_3_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_theta_3_number_2_first_300 = return_it_where_val_is_reached(PPO_theta_3_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_theta_3_number_3_first_300 = return_it_where_val_is_reached(PPO_theta_3_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_theta_3_number_4_first_300 = return_it_where_val_is_reached(PPO_theta_3_number_4, 300, PPO_train_mean_evaluation_reward);

PPO_theta_5_number_0_first_300 = return_it_where_val_is_reached(PPO_theta_5_number_0, 300, PPO_train_mean_evaluation_reward);
PPO_theta_5_number_1_first_300 = return_it_where_val_is_reached(PPO_theta_5_number_1, 300, PPO_train_mean_evaluation_reward);
PPO_theta_5_number_2_first_300 = return_it_where_val_is_reached(PPO_theta_5_number_2, 300, PPO_train_mean_evaluation_reward);
PPO_theta_5_number_3_first_300 = return_it_where_val_is_reached(PPO_theta_5_number_3, 300, PPO_train_mean_evaluation_reward);
PPO_theta_5_number_4_first_300 = return_it_where_val_is_reached(PPO_theta_5_number_4, 300, PPO_train_mean_evaluation_reward);

%make vector with all first reaches
TRPO_theta_01_first_300 = [TRPO_theta_01_number_0_first_300, TRPO_theta_01_number_1_first_300, TRPO_theta_01_number_2_first_300, TRPO_theta_01_number_3_first_300, TRPO_theta_01_number_4_first_300]
TRPO_theta_02_first_300 = [TRPO_theta_02_number_0_first_300, TRPO_theta_02_number_1_first_300, TRPO_theta_02_number_2_first_300, TRPO_theta_02_number_3_first_300, TRPO_theta_02_number_4_first_300]
TRPO_theta_05_first_300 = [TRPO_theta_05_number_0_first_300, TRPO_theta_05_number_1_first_300, TRPO_theta_05_number_2_first_300, TRPO_theta_05_number_3_first_300, TRPO_theta_05_number_4_first_300]
TRPO_theta_1_first_300 = [TRPO_theta_1_number_0_first_300, TRPO_theta_1_number_1_first_300, TRPO_theta_1_number_2_first_300, TRPO_theta_1_number_3_first_300, TRPO_theta_1_number_4_first_300]
TRPO_theta_2_first_300 = [TRPO_theta_2_number_0_first_300, TRPO_theta_2_number_1_first_300, TRPO_theta_2_number_2_first_300, TRPO_theta_2_number_3_first_300, TRPO_theta_2_number_4_first_300]
TRPO_theta_3_first_300 = [TRPO_theta_3_number_0_first_300, TRPO_theta_3_number_1_first_300, TRPO_theta_3_number_2_first_300, TRPO_theta_3_number_3_first_300, TRPO_theta_3_number_4_first_300]
TRPO_theta_5_first_300 = [TRPO_theta_5_number_0_first_300, TRPO_theta_5_number_1_first_300, TRPO_theta_5_number_2_first_300, TRPO_theta_5_number_3_first_300, TRPO_theta_5_number_4_first_300]

PPO_theta_01_first_300 = [PPO_theta_01_number_0_first_300, PPO_theta_01_number_1_first_300, PPO_theta_01_number_2_first_300, PPO_theta_01_number_3_first_300, PPO_theta_01_number_4_first_300]
PPO_theta_02_first_300 = [PPO_theta_02_number_0_first_300, PPO_theta_02_number_1_first_300, PPO_theta_02_number_2_first_300, PPO_theta_02_number_3_first_300, PPO_theta_02_number_4_first_300]
PPO_theta_05_first_300 = [PPO_theta_05_number_0_first_300, PPO_theta_05_number_1_first_300, PPO_theta_05_number_2_first_300, PPO_theta_05_number_3_first_300, PPO_theta_05_number_4_first_300]
PPO_theta_1_first_300 = [PPO_theta_1_number_0_first_300, PPO_theta_1_number_1_first_300, PPO_theta_1_number_2_first_300, PPO_theta_1_number_3_first_300, PPO_theta_1_number_4_first_300]
PPO_theta_2_first_300 = [PPO_theta_2_number_0_first_300, PPO_theta_2_number_1_first_300, PPO_theta_2_number_2_first_300, PPO_theta_2_number_3_first_300, PPO_theta_2_number_4_first_300]
PPO_theta_3_first_300 = [PPO_theta_3_number_0_first_300, PPO_theta_3_number_1_first_300, PPO_theta_3_number_2_first_300, PPO_theta_3_number_3_first_300, PPO_theta_3_number_4_first_300]
PPO_theta_5_first_300 = [PPO_theta_5_number_0_first_300, PPO_theta_5_number_1_first_300, PPO_theta_5_number_2_first_300, PPO_theta_5_number_3_first_300, PPO_theta_5_number_4_first_300]


%calculate mean
TRPO_theta_01_first_300_mean = mean(TRPO_theta_01_first_300);
TRPO_theta_02_first_300_mean = mean(TRPO_theta_02_first_300);
TRPO_theta_05_first_300_mean = mean(TRPO_theta_05_first_300);
TRPO_theta_1_first_300_mean = mean(TRPO_theta_1_first_300);
TRPO_theta_2_first_300_mean = mean(TRPO_theta_2_first_300);
TRPO_theta_3_first_300_mean = mean(TRPO_theta_3_first_300);
TRPO_theta_5_first_300_mean = mean(TRPO_theta_5_first_300);

PPO_theta_01_first_300_mean = mean(PPO_theta_01_first_300);
PPO_theta_02_first_300_mean = mean(PPO_theta_02_first_300);
PPO_theta_05_first_300_mean = mean(PPO_theta_05_first_300);
PPO_theta_1_first_300_mean = mean(PPO_theta_1_first_300);
PPO_theta_2_first_300_mean = mean(PPO_theta_2_first_300);
PPO_theta_3_first_300_mean = mean(PPO_theta_3_first_300);
PPO_theta_5_first_300_mean = mean(PPO_theta_5_first_300);

%if rows+1 exist in TRPO_theta_01_first_300, set TRPO_theta_01_first_300_mean to 0
if sum(TRPO_theta_01_first_300 == rows+1)
    TRPO_theta_01_first_300_mean = 0;
end
if sum(TRPO_theta_02_first_300 == rows+1)
    TRPO_theta_02_first_300_mean = 0;
end
if sum(TRPO_theta_05_first_300 == rows+1)
    TRPO_theta_05_first_300_mean = 0;
end
if sum(TRPO_theta_1_first_300 == rows+1)
    TRPO_theta_1_first_300_mean = 0;
end
if sum(TRPO_theta_2_first_300 == rows+1)
    TRPO_theta_2_first_300_mean = 0;
end
if sum(TRPO_theta_3_first_300 == rows+1)
    TRPO_theta_3_first_300_mean = 0;
end
if sum(TRPO_theta_5_first_300 == rows+1)
    TRPO_theta_5_first_300_mean = 0;
end

if sum(PPO_theta_01_first_300 == rows+1)
    PPO_theta_01_first_300_mean = 0;
end
if sum(PPO_theta_02_first_300 == rows+1)
    PPO_theta_02_first_300_mean = 0;
end

if sum(PPO_theta_05_first_300 == rows+1)
    PPO_theta_05_first_300_mean = 0;
end
if sum(PPO_theta_1_first_300 == rows+1)
    PPO_theta_1_first_300_mean = 0;
end
if sum(PPO_theta_2_first_300 == rows+1)
    PPO_theta_2_first_300_mean = 0;
end
if sum(PPO_theta_3_first_300 == rows+1)
    PPO_theta_3_first_300_mean = 0;
end
if sum(PPO_theta_5_first_300 == rows+1)
    PPO_theta_5_first_300_mean = 0;
end


%calulate lowest    
TRPO_theta_01_first_300_lowest = min(TRPO_theta_01_first_300);
TRPO_theta_02_first_300_lowest = min(TRPO_theta_02_first_300);
TRPO_theta_05_first_300_lowest = min(TRPO_theta_05_first_300);
TRPO_theta_1_first_300_lowest = min(TRPO_theta_1_first_300);
TRPO_theta_2_first_300_lowest = min(TRPO_theta_2_first_300);
TRPO_theta_3_first_300_lowest = min(TRPO_theta_3_first_300);
TRPO_theta_5_first_300_lowest = min(TRPO_theta_5_first_300);

PPO_theta_01_first_300_lowest = min(PPO_theta_01_first_300);
PPO_theta_02_first_300_lowest = min(PPO_theta_02_first_300);
PPO_theta_05_first_300_lowest = min(PPO_theta_05_first_300);
PPO_theta_1_first_300_lowest = min(PPO_theta_1_first_300);
PPO_theta_2_first_300_lowest = min(PPO_theta_2_first_300);
PPO_theta_3_first_300_lowest = min(PPO_theta_3_first_300);
PPO_theta_5_first_300_lowest = min(PPO_theta_5_first_300);

%set best to 0 if best is rows+1
if TRPO_theta_01_first_300_lowest == rows+1
    TRPO_theta_01_first_300_lowest = 0;
end
if TRPO_theta_02_first_300_lowest == rows+1
    TRPO_theta_02_first_300_lowest = 0;
end
if TRPO_theta_05_first_300_lowest == rows+1
    TRPO_theta_05_first_300_lowest = 0;
end
if TRPO_theta_1_first_300_lowest == rows+1
    TRPO_theta_1_first_300_lowest = 0;
end
if TRPO_theta_2_first_300_lowest == rows+1
    TRPO_theta_2_first_300_lowest = 0;
end
if TRPO_theta_3_first_300_lowest == rows+1
    TRPO_theta_3_first_300_lowest = 0;
end
if TRPO_theta_5_first_300_lowest == rows+1
    TRPO_theta_5_first_300_lowest = 0;
end

if PPO_theta_01_first_300_lowest == rows+1
    PPO_theta_01_first_300_lowest = 0;
end
if PPO_theta_02_first_300_lowest == rows+1
    PPO_theta_02_first_300_lowest = 0;
end
if PPO_theta_05_first_300_lowest == rows+1
    PPO_theta_05_first_300_lowest = 0;
end
if PPO_theta_1_first_300_lowest == rows+1
    PPO_theta_1_first_300_lowest = 0;
end
if PPO_theta_2_first_300_lowest == rows+1
    PPO_theta_2_first_300_lowest = 0;
end
if PPO_theta_3_first_300_lowest == rows+1
    PPO_theta_3_first_300_lowest = 0;
end
if PPO_theta_5_first_300_lowest == rows+1
    PPO_theta_5_first_300_lowest = 0;
end

%plot TRPO
figure(3);
xticks_vec = ["baseline" "0.1" "0.2" "0.5" "1.0" "2.0" "3.0" "5.0"];
bar(xticks_vec, [trpo_first_300_mean ,TRPO_theta_01_first_300_mean, TRPO_theta_02_first_300_mean, TRPO_theta_05_first_300_mean, TRPO_theta_1_first_300_mean, TRPO_theta_2_first_300_mean, TRPO_theta_3_first_300_mean, TRPO_theta_5_first_300_mean;trpo_first_300_lowest, TRPO_theta_01_first_300_lowest, TRPO_theta_02_first_300_lowest, TRPO_theta_05_first_300_lowest, TRPO_theta_1_first_300_lowest, TRPO_theta_2_first_300_lowest, TRPO_theta_3_first_300_lowest, TRPO_theta_5_first_300_lowest]);
title('Theta value impact on TRPO: Iteration to reach 300');
subtitle('If no bar is shown, 300 was not reached, sigma=0.05');
xlabel('Theta');
ylabel('Iterations');
yline(trpo_standard_first_300_20_lowest, '--r');
yline(trpo_first_300_mean, '--b');
legend('Mean', 'Lowest', 'baseline 20% lowest', 'baseline mean');
legend('Location','southeast');

%plot PPO
figure(4);
xticks_vec = ["baseline" "0.1" "0.2" "0.5" "1.0" "2.0" "3.0" "5.0"];
bar(xticks_vec, [ppo_first_300_mean, PPO_theta_01_first_300_mean, PPO_theta_02_first_300_mean, PPO_theta_05_first_300_mean, PPO_theta_1_first_300_mean, PPO_theta_2_first_300_mean, PPO_theta_3_first_300_mean, PPO_theta_5_first_300_mean;ppo_first_300_lowest, PPO_theta_01_first_300_lowest, PPO_theta_02_first_300_lowest, PPO_theta_05_first_300_lowest, PPO_theta_1_first_300_lowest, PPO_theta_2_first_300_lowest, PPO_theta_3_first_300_lowest, PPO_theta_5_first_300_lowest]);
title('Theta value impact on PPO: Iteration to reach 300');
subtitle('If no bar is shown, 300 was not reached, sigma=0.05');
xlabel('Theta');
ylabel('Iterations');
yline(ppo_standard_first_300_20_lowest, '--r');
yline(ppo_first_300_mean, '--b');
legend('Mean', 'Lowest', 'baseline 20% lowest', 'baseline mean');
legend('Location','southeast');