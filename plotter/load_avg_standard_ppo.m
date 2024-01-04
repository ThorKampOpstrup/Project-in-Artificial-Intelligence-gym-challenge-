addpath("plotter/");

ppo_number_of_evals = 20;

ppo_step =1;
ppo_rollout_ep_len_mean = 2;
ppo_rollout_ep_rew_mean = 3;
ppo_time_fps = 4;
ppo_train_fitness_score = 5;
ppo_train_mean_evaluation_length = 6;
ppo_train_mean_evaluation_reward = 7;
ppo_train_real_mean_ep_len = 8;
ppo_train_approx_kl = 9;
ppo_train_clip_fraction = 10;
ppo_train_clip_range = 11;
ppo_train_entropy_loss = 12;
ppo_train_explained_variance = 13;
ppo_train_learning_rate = 14;
ppo_train_loss = 15;
ppo_train_policy_gradient_loss = 16;
ppo_train_std = 17;
ppo_train_value_loss = 18;

path = "data_cpy/csv/standard_test_ppo/";

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

rows = size(run1, 1);
iterations_vec = [1:1:rows];

PPO_standad_avg =(run1 + run2 + run3 + run4 + run5 + run6 + run7 + run8 + run9 + run10 + run11 + run12 + run13 + run14 + run15 + run16 + run17 + run18 + run19 + run20) / ppo_number_of_evals; 

%calculate the standard diviation for each iteration around the
ppo_std_vector = zeros(rows, 1);
for i = 1:rows
    ppo_std_vector(i) = std([run1(i, ppo_train_mean_evaluation_reward), run2(i, ppo_train_mean_evaluation_reward), run3(i, ppo_train_mean_evaluation_reward), run4(i, ppo_train_mean_evaluation_reward), run5(i, ppo_train_mean_evaluation_reward), run6(i, ppo_train_mean_evaluation_reward), run7(i, ppo_train_mean_evaluation_reward), run8(i, ppo_train_mean_evaluation_reward), run9(i, ppo_train_mean_evaluation_reward), run10(i, ppo_train_mean_evaluation_reward), run11(i, ppo_train_mean_evaluation_reward), run12(i, ppo_train_mean_evaluation_reward), run13(i, ppo_train_mean_evaluation_reward), run14(i, ppo_train_mean_evaluation_reward), run15(i, ppo_train_mean_evaluation_reward), run16(i, ppo_train_mean_evaluation_reward), run17(i, ppo_train_mean_evaluation_reward), run18(i, ppo_train_mean_evaluation_reward), run19(i, ppo_train_mean_evaluation_reward), run20(i, ppo_train_mean_evaluation_reward)]);
end

run1_first_300 = return_it_where_val_is_reached(run1, 300, ppo_train_mean_evaluation_reward);
run2_first_300 = return_it_where_val_is_reached(run2, 300, ppo_train_mean_evaluation_reward);
run3_first_300 = return_it_where_val_is_reached(run3, 300, ppo_train_mean_evaluation_reward);
run4_first_300 = return_it_where_val_is_reached(run4, 300, ppo_train_mean_evaluation_reward);
run5_first_300 = return_it_where_val_is_reached(run5, 300, ppo_train_mean_evaluation_reward);
run6_first_300 = return_it_where_val_is_reached(run6, 300, ppo_train_mean_evaluation_reward);
run7_first_300 = return_it_where_val_is_reached(run7, 300, ppo_train_mean_evaluation_reward);
run8_first_300 = return_it_where_val_is_reached(run8, 300, ppo_train_mean_evaluation_reward);
run9_first_300 = return_it_where_val_is_reached(run9, 300, ppo_train_mean_evaluation_reward);
run10_first_300 = return_it_where_val_is_reached(run10, 300, ppo_train_mean_evaluation_reward);
run11_first_300 = return_it_where_val_is_reached(run11, 300, ppo_train_mean_evaluation_reward);
run12_first_300 = return_it_where_val_is_reached(run12, 300, ppo_train_mean_evaluation_reward);
run13_first_300 = return_it_where_val_is_reached(run13, 300, ppo_train_mean_evaluation_reward);
run14_first_300 = return_it_where_val_is_reached(run14, 300, ppo_train_mean_evaluation_reward);
run15_first_300 = return_it_where_val_is_reached(run15, 300, ppo_train_mean_evaluation_reward);
run16_first_300 = return_it_where_val_is_reached(run16, 300, ppo_train_mean_evaluation_reward);
run17_first_300 = return_it_where_val_is_reached(run17, 300, ppo_train_mean_evaluation_reward);
run18_first_300 = return_it_where_val_is_reached(run18, 300, ppo_train_mean_evaluation_reward);
run19_first_300 = return_it_where_val_is_reached(run19, 300, ppo_train_mean_evaluation_reward);
run20_first_300 = return_it_where_val_is_reached(run20, 300, ppo_train_mean_evaluation_reward);

ppo_first_300 = [run1_first_300, run2_first_300, run3_first_300, run4_first_300, run5_first_300, run6_first_300, run7_first_300, run8_first_300, run9_first_300, run10_first_300, run11_first_300, run12_first_300, run13_first_300, run14_first_300, run15_first_300, run16_first_300, run17_first_300, run18_first_300, run19_first_300, run20_first_300];
%remove items that are rows + 1
ppo_first_300 = ppo_first_300(ppo_first_300 ~= rows + 1);
ppo_avg_first_300 = mean(ppo_first_300);
ppo_first_300_lowest = min(ppo_first_300);
"ppo runs that reached 300: " + length(ppo_first_300)/ppo_number_of_evals*100 + "%"
"avg ppo runs that reached 300: " + ppo_avg_first_300
"lowest it ppo run that reached 300: " + ppo_first_300_lowest