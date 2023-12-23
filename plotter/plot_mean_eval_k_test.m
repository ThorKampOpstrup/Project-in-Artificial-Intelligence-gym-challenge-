


% define column descriptors
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


% load data from .csv file
path = "data_cpy/csv/k_test/";
k_1_number_0 = readmatrix(strcat(path, "k_1_number_0.csv"));
k_1_number_1 = readmatrix(strcat(path, "k_1_number_1.csv"));
k_1_number_2 = readmatrix(strcat(path, "k_1_number_2.csv"));
k_1_number_3 = readmatrix(strcat(path, "k_1_number_3.csv"));
k_1_number_4 = readmatrix(strcat(path, "k_1_number_4.csv"));

k_2_number_0 = readmatrix(strcat(path, "k_2_number_0.csv"));
k_2_number_1 = readmatrix(strcat(path, "k_2_number_1.csv"));
k_2_number_2 = readmatrix(strcat(path, "k_2_number_2.csv"));
k_2_number_3 = readmatrix(strcat(path, "k_2_number_3.csv"));
k_2_number_4 = readmatrix(strcat(path, "k_2_number_4.csv"));

k_3_number_0 = readmatrix(strcat(path, "k_3_number_0.csv"));
k_3_number_1 = readmatrix(strcat(path, "k_3_number_1.csv"));
k_3_number_2 = readmatrix(strcat(path, "k_3_number_2.csv"));
k_3_number_3 = readmatrix(strcat(path, "k_3_number_3.csv"));
k_3_number_4 = readmatrix(strcat(path, "k_3_number_4.csv"));

k_4_number_0 = readmatrix(strcat(path, "k_4_number_0.csv"));
k_4_number_1 = readmatrix(strcat(path, "k_4_number_1.csv"));
k_4_number_2 = readmatrix(strcat(path, "k_4_number_2.csv"));
k_4_number_3 = readmatrix(strcat(path, "k_4_number_3.csv"));
k_4_number_4 = readmatrix(strcat(path, "k_4_number_4.csv"));

k_5_number_0 = readmatrix(strcat(path, "k_5_number_0.csv"));
k_5_number_1 = readmatrix(strcat(path, "k_5_number_1.csv"));
k_5_number_2 = readmatrix(strcat(path, "k_5_number_2.csv"));
k_5_number_3 = readmatrix(strcat(path, "k_5_number_3.csv"));
k_5_number_4 = readmatrix(strcat(path, "k_5_number_4.csv"));

k_6_number_0 = readmatrix(strcat(path, "k_6_number_0.csv"));
k_6_number_1 = readmatrix(strcat(path, "k_6_number_1.csv"));
k_6_number_2 = readmatrix(strcat(path, "k_6_number_2.csv"));
k_6_number_3 = readmatrix(strcat(path, "k_6_number_3.csv"));
k_6_number_4 = readmatrix(strcat(path, "k_6_number_4.csv"));

k_7_number_0 = readmatrix(strcat(path, "k_7_number_0.csv"));
k_7_number_1 = readmatrix(strcat(path, "k_7_number_1.csv"));
k_7_number_2 = readmatrix(strcat(path, "k_7_number_2.csv"));
k_7_number_3 = readmatrix(strcat(path, "k_7_number_3.csv"));
k_7_number_4 = readmatrix(strcat(path, "k_7_number_4.csv"));

k_8_number_0 = readmatrix(strcat(path, "k_8_number_0.csv"));
k_8_number_1 = readmatrix(strcat(path, "k_8_number_1.csv"));
k_8_number_2 = readmatrix(strcat(path, "k_8_number_2.csv"));
k_8_number_3 = readmatrix(strcat(path, "k_8_number_3.csv"));
k_8_number_4 = readmatrix(strcat(path, "k_8_number_4.csv"));

k_9_number_0 = readmatrix(strcat(path, "k_9_number_0.csv"));
k_9_number_1 = readmatrix(strcat(path, "k_9_number_1.csv"));
k_9_number_2 = readmatrix(strcat(path, "k_9_number_2.csv"));
k_9_number_3 = readmatrix(strcat(path, "k_9_number_3.csv"));
k_9_number_4 = readmatrix(strcat(path, "k_9_number_4.csv"));

k_10_number_0 = readmatrix(strcat(path, "k_10_number_0.csv"));
k_10_number_1 = readmatrix(strcat(path, "k_10_number_1.csv"));
k_10_number_2 = readmatrix(strcat(path, "k_10_number_2.csv"));
k_10_number_3 = readmatrix(strcat(path, "k_10_number_3.csv"));
k_10_number_4 = readmatrix(strcat(path, "k_10_number_4.csv"));

% delete first row of all k
k_1_number_0(1,:) = [];
k_1_number_1(1,:) = [];
k_1_number_2(1,:) = [];
k_1_number_3(1,:) = [];
k_1_number_4(1,:) = [];

k_2_number_0(1,:) = [];
k_2_number_1(1,:) = [];
k_2_number_2(1,:) = [];
k_2_number_3(1,:) = [];
k_2_number_4(1,:) = [];


k_3_number_0(1,:) = [];
k_3_number_1(1,:) = [];
k_3_number_2(1,:) = [];
k_3_number_3(1,:) = [];
k_3_number_4(1,:) = [];

k_4_number_0(1,:) = [];
k_4_number_1(1,:) = [];
k_4_number_2(1,:) = [];
k_4_number_3(1,:) = [];
k_4_number_4(1,:) = [];

k_5_number_0(1,:) = [];
k_5_number_1(1,:) = [];
k_5_number_2(1,:) = [];
k_5_number_3(1,:) = [];
k_5_number_4(1,:) = [];

k_6_number_0(1,:) = [];
k_6_number_1(1,:) = [];
k_6_number_2(1,:) = [];
k_6_number_3(1,:) = [];
k_6_number_4(1,:) = [];

k_7_number_0(1,:) = [];
k_7_number_1(1,:) = [];
k_7_number_2(1,:) = [];
k_7_number_3(1,:) = [];
k_7_number_4(1,:) = [];

k_8_number_0(1,:) = [];
k_8_number_1(1,:) = [];
k_8_number_2(1,:) = [];
k_8_number_3(1,:) = [];
k_8_number_4(1,:) = [];

k_9_number_0(1,:) = [];
k_9_number_1(1,:) = [];
k_9_number_2(1,:) = [];
k_9_number_3(1,:) = [];
k_9_number_4(1,:) = [];

k_10_number_0(1,:) = [];
k_10_number_1(1,:) = [];
k_10_number_2(1,:) = [];
k_10_number_3(1,:) = [];
k_10_number_4(1,:) = [];

% take average of each k and save them
k1_avg = (k_1_number_0 + k_1_number_1 + k_1_number_2 + k_1_number_3 + k_1_number_4) / 5;
k2_avg = (k_2_number_0 + k_2_number_1 + k_2_number_2 + k_2_number_3 + k_2_number_4) / 5;
k3_avg = (k_3_number_0 + k_3_number_1 + k_3_number_2 + k_3_number_3 + k_3_number_4) / 5;
k4_avg = (k_4_number_0 + k_4_number_1 + k_4_number_2 + k_4_number_3 + k_4_number_4) / 5;
k5_avg = (k_5_number_0 + k_5_number_1 + k_5_number_2 + k_5_number_3 + k_5_number_4) / 5;
k6_avg = (k_6_number_0 + k_6_number_1 + k_6_number_2 + k_6_number_3 + k_6_number_4) / 5;
k7_avg = (k_7_number_0 + k_7_number_1 + k_7_number_2 + k_7_number_3 + k_7_number_4) / 5;
k8_avg = (k_8_number_0 + k_8_number_1 + k_8_number_2 + k_8_number_3 + k_8_number_4) / 5;
k9_avg = (k_9_number_0 + k_9_number_1 + k_9_number_2 + k_9_number_3 + k_9_number_4) / 5;
k10_avg = (k_10_number_0 + k_10_number_1 + k_10_number_2 + k_10_number_3 + k_10_number_4) / 5;


% rows in k_1_number_0
rows = size(k_1_number_0, 1);
iterations_vec = [1:1:rows];

% plot train_mean_evaluation_reward over iterations for all k
figure(1);
hold on;
plot(iterations_vec, k1_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, k2_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, k3_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, k4_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, k5_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, k6_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, k7_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, k8_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, k9_avg(:,train_mean_evaluation_reward));
plot(iterations_vec, k10_avg(:,train_mean_evaluation_reward));


title("train/mean\_evaluation\_reward over iterations for all k");
xlabel("iterations");
ylabel("train/mean\_evaluation\_reward");
legend("k=1", "k=2", "k=3", "k=4", "k=5", "k=6", "k=7", "k=8", "k=9", "k=10");
hold off;