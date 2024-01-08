close all;
addpath("plotter/");
number_of_evals = 20;

load_avg_standard_trpo
trpo_standard_index =  trpo_train_mean_evaluation_reward;
trpo_standard_best_run = run1;

plot_trpo_combined
trpo_combined_index =  TRPO_train_mean_evaluation_reward;
trpo_combined_best_run = run18;


%find runs manualy
load_avg_standard_ppo
ppo_standard_index =  ppo_train_mean_evaluation_reward;
ppo_standard_best_run = run12;

plot_ppo_combined
ppo_combined_index =  PPO_train_mean_evaluation_reward;
ppo_combined_best_run = run15;

close all;
%plot best runs
%plot ppo in red is color and trpo in blue
figure(1);
hold on;
plot(iterations_vec, trpo_standard_best_run(:, trpo_standard_index), 'LineWidth', 1, 'Color', [0 0.2470 0.9410]);
plot(iterations_vec, trpo_combined_best_run(:, trpo_combined_index), 'LineWidth', 1, 'Color', [0.3010 0.7450 0.9330]);
plot(iterations_vec, ppo_standard_best_run(:, ppo_standard_index), 'LineWidth', 1, 'color', [0.8350 0.0780 0.0840]);
plot(iterations_vec, ppo_combined_best_run(:, ppo_combined_index), 'LineWidth', 1, 'color', [0.9290 0.6940 0.1250]);

plot(iterations_vec, trpo_standad_avg(:, trpo_standard_index), 'LineWidth', 1 , 'LineStyle', '--', 'Color', [0 0.2470 0.9410]);
plot(iterations_vec, TRPO_Re3_OU_test_mean(:, trpo_combined_index), 'LineWidth', 1, 'LineStyle', '--', 'Color', [0.3010 0.7450 0.9330]);
plot(iterations_vec, PPO_standad_avg(:, ppo_standard_index), 'LineWidth', 1, 'LineStyle', '--', 'color', [0.8350 0.0780 0.0840]);
plot(iterations_vec, PPO_Re3_OU_test_mean(:, ppo_combined_index), 'LineWidth', 1, 'LineStyle', '--', 'color', [0.9290 0.6940 0.1250]);
yline(300, '--', "300");
legend("TRPO standard", "TRPO Re3 OU test", "PPO standard", "PPO Re3 OU test", "TRPO standard avg", "TRPO Re3 OU test avg", "PPO standard avg", "PPO Re3 OU test avg");
legend("Location", "southeast");
xlabel("Iterations");
ylabel("Mean evaluation reward");
title("Best and average runs for TRPO and PPO with and without the aditions");
xticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150]);
hold off;



