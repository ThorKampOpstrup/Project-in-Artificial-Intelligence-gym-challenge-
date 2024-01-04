addpath("plotter/");
%function [row] = return_it_where_val_is_reached(matrix, value, column)
%    rows = size(matrix, 1);
%    for i = 1:rows
%        if matrix(i, column) >= value
%            row = i;
%            return
%        end
%    end
%    row = rows+1;
%    return
%end

trpo_number_of_evals = 20;

trpo_step = 1;
trpo_rollout_ep_len_mean = 2;
trpo_rollout_ep_rew_mean = 3;
trpo_time_fps = 4;
trpo_train_fitness_score = 5;
trpo_train_mean_evaluation_length = 6;
trpo_train_mean_evaluation_reward = 7;
trpo_train_real_mean_ep_len = 8;
trpo_train_explained_variance = 9;
trpo_train_is_line_search_success = 10;
trpo_train_kl_divergence_loss = 11;
trpo_train_learning_rate = 12;
trpo_train_policy_objective = 13;
trpo_train_std = 14;
trpo_train_value_loss = 15;

path = "data_cpy/csv/standard_test_trpo/";

run1 = readmatrix(strcat(path, "TRPO_standard_number_0.csv"));
run2 = readmatrix(strcat(path, "TRPO_standard_number_1.csv"));
run3 = readmatrix(strcat(path, "TRPO_standard_number_2.csv"));
run4 = readmatrix(strcat(path, "TRPO_standard_number_3.csv"));
run5 = readmatrix(strcat(path, "TRPO_standard_number_4.csv"));
run6 = readmatrix(strcat(path, "TRPO_standard_number_5.csv"));
run7 = readmatrix(strcat(path, "TRPO_standard_number_6.csv"));
run8 = readmatrix(strcat(path, "TRPO_standard_number_7.csv"));
run9 = readmatrix(strcat(path, "TRPO_standard_number_8.csv"));
run10 = readmatrix(strcat(path, "TRPO_standard_number_9.csv"));
run11 = readmatrix(strcat(path, "TRPO_standard_number_10.csv"));
run12 = readmatrix(strcat(path, "TRPO_standard_number_11.csv"));
run13 = readmatrix(strcat(path, "TRPO_standard_number_12.csv"));
run14 = readmatrix(strcat(path, "TRPO_standard_number_13.csv"));
run15 = readmatrix(strcat(path, "TRPO_standard_number_14.csv"));
run16 = readmatrix(strcat(path, "TRPO_standard_number_15.csv"));
run17 = readmatrix(strcat(path, "TRPO_standard_number_16.csv"));
run18 = readmatrix(strcat(path, "TRPO_standard_number_17.csv"));
run19 = readmatrix(strcat(path, "TRPO_standard_number_18.csv"));
run20 = readmatrix(strcat(path, "TRPO_standard_number_19.csv"));


rows = size(run1, 1);
iterations_vec = [1:1:rows];

trpo_standad_avg =(run1 + run2 + run3 + run4 + run5 + run6 + run7 + run8 + run9 + run10 + run11 + run12 + run13 + run14 + run15 + run16 + run17 + run18 + run19 + run20) / trpo_number_of_evals; 

%calculate the standard diviation for each iteration around the
trpo_std_vector = zeros(rows, 1);
for i = 1:rows
    trpo_std_vector(i) = std([run1(i, trpo_train_mean_evaluation_reward), run2(i, trpo_train_mean_evaluation_reward), run3(i, trpo_train_mean_evaluation_reward), run4(i, trpo_train_mean_evaluation_reward), run5(i, trpo_train_mean_evaluation_reward), run6(i, trpo_train_mean_evaluation_reward), run7(i, trpo_train_mean_evaluation_reward), run8(i, trpo_train_mean_evaluation_reward), run9(i, trpo_train_mean_evaluation_reward), run10(i, trpo_train_mean_evaluation_reward), run11(i, trpo_train_mean_evaluation_reward), run12(i, trpo_train_mean_evaluation_reward), run13(i, trpo_train_mean_evaluation_reward), run14(i, trpo_train_mean_evaluation_reward), run15(i, trpo_train_mean_evaluation_reward), run16(i, trpo_train_mean_evaluation_reward), run17(i, trpo_train_mean_evaluation_reward), run18(i, trpo_train_mean_evaluation_reward), run19(i, trpo_train_mean_evaluation_reward), run20(i, trpo_train_mean_evaluation_reward)]);
end

run1_first_300 = return_it_where_val_is_reached(run1, 300, trpo_train_mean_evaluation_reward);
run2_first_300 = return_it_where_val_is_reached(run2, 300, trpo_train_mean_evaluation_reward);
run3_first_300 = return_it_where_val_is_reached(run3, 300, trpo_train_mean_evaluation_reward);
run4_first_300 = return_it_where_val_is_reached(run4, 300, trpo_train_mean_evaluation_reward);
run5_first_300 = return_it_where_val_is_reached(run5, 300, trpo_train_mean_evaluation_reward);
run6_first_300 = return_it_where_val_is_reached(run6, 300, trpo_train_mean_evaluation_reward);
run7_first_300 = return_it_where_val_is_reached(run7, 300, trpo_train_mean_evaluation_reward);
run8_first_300 = return_it_where_val_is_reached(run8, 300, trpo_train_mean_evaluation_reward);
run9_first_300 = return_it_where_val_is_reached(run9, 300, trpo_train_mean_evaluation_reward);
run10_first_300 = return_it_where_val_is_reached(run10, 300, trpo_train_mean_evaluation_reward);
run11_first_300 = return_it_where_val_is_reached(run11, 300, trpo_train_mean_evaluation_reward);
run12_first_300 = return_it_where_val_is_reached(run12, 300, trpo_train_mean_evaluation_reward);
run13_first_300 = return_it_where_val_is_reached(run13, 300, trpo_train_mean_evaluation_reward);
run14_first_300 = return_it_where_val_is_reached(run14, 300, trpo_train_mean_evaluation_reward);
run15_first_300 = return_it_where_val_is_reached(run15, 300, trpo_train_mean_evaluation_reward);
run16_first_300 = return_it_where_val_is_reached(run16, 300, trpo_train_mean_evaluation_reward);
run17_first_300 = return_it_where_val_is_reached(run17, 300, trpo_train_mean_evaluation_reward);
run18_first_300 = return_it_where_val_is_reached(run18, 300, trpo_train_mean_evaluation_reward);
run19_first_300 = return_it_where_val_is_reached(run19, 300, trpo_train_mean_evaluation_reward);
run20_first_300 = return_it_where_val_is_reached(run20, 300, trpo_train_mean_evaluation_reward);

trpo_first_300 = [run1_first_300, run2_first_300, run3_first_300, run4_first_300, run5_first_300, run6_first_300, run7_first_300, run8_first_300, run9_first_300, run10_first_300, run11_first_300, run12_first_300, run13_first_300, run14_first_300, run15_first_300, run16_first_300, run17_first_300, run18_first_300, run19_first_300, run20_first_300];

trpo_first_300 = trpo_first_300(trpo_first_300 ~= rows+1);
trpo_avg_first_300 = mean(trpo_first_300);
trpo_first_300_lowest = min(trpo_first_300);
"trpo runs that reached 300: " + length(trpo_first_300)/trpo_number_of_evals*100 + "%"
"avg it trpo runs that reached 300: " + trpo_avg_first_300
"lowest it trpo runs that reached 300: " + trpo_first_300_lowest