load_avg_standard_ppo
load_avg_standard_trpo

hold on;
figure(1);
plot(iterations_vec, ppo_std_vector);
plot(iterations_vec, trpo_std_vector);
legend('PPO', 'TRPO');
title('PPO vs TRPO');
subtitle('standard diviation of mean evaluation reward for each itteration of 20 runs');
xlabel('Iterations');
ylabel('standard diviation of mean evaluation reward');
xticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150]);
hold off;
