clear;
load_avg_standard_ppo
load_avg_standard_trpo

% plot the baseline
figure(1);
hold on;
plot(iterations_vec, PPO_standad_avg(:,ppo_train_mean_evaluation_reward), 'color', 'magenta','LineWidth', 2);
plot(iterations_vec, trpo_standad_avg(:,trpo_train_mean_evaluation_reward), 'color', 'blue', 'LineWidth', 2);
%legend('PPO', 'TRPO');
title('PPO vs TRPO');

subtitle('Mean evaluation reward for each itteration of 20 runs');
xlabel('Iterations');
ylabel('Mean evaluation reward');
xticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150]);

% in the same figure plot the standard diviation but on a different y axis
yyaxis right;
ax = gca;
ax.YColor = 'k';

plot(iterations_vec, ppo_std_vector, '--', 'color', 'magenta');
plot(iterations_vec, trpo_std_vector, '--', 'color', 'blue');
ylabel('standard diviation of mean evaluation reward');
legend('PPO', 'TRPO', 'PPO std', 'TRPO std');
ylim([0 300]);
hold off;


