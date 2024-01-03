clear;

path = "data_cpy/csv/OrnsteinUhlenbeckActionNoise";

OU_noise_theta_1_sigma_1 = readmatrix(strcat(path, "/OU_1_1.csv"));
OU_noise_theta_01_sigma_1 = readmatrix(strcat(path, "/OU_01_1.csv"));
OU_noise_theta_1_sigma_01 = readmatrix(strcat(path, "/OU_1_01.csv"));
OU_noise_theta_01_sigma_01 = readmatrix(strcat(path, "/OU_01_01.csv"));
OU_noise_theta_3_sigma_1 = readmatrix(strcat(path, "/OU_3_1.csv"));
% OU_noise_theta_3_sigma_01 = readmatrix(strcat(path, "/OU_3_01.csv"));

%save first collum
first_collum = OU_noise_theta_1_sigma_1(:,1);
hold on;

figure(1);
plot(first_collum, OU_noise_theta_1_sigma_1(:,2), 'LineWidth', 2);
plot(first_collum, OU_noise_theta_01_sigma_1(:,2), 'LineWidth', 2);
plot(first_collum, OU_noise_theta_1_sigma_01(:,2), 'LineWidth', 2.5);
plot(first_collum, OU_noise_theta_01_sigma_01(:,2), 'LineWidth', 2.5);
plot(first_collum, OU_noise_theta_3_sigma_1(:,2), 'LineWidth', 1);
% plot(first_collum, OU_noise_theta_3_sigma_01(:,2), 'LineWidth', 2);
legend('theta 1 sigma 1', 'theta 0.1 sigma 1', 'theta 1 sigma 0.1', 'theta 0.1 sigma 0.1', 'theta 3 sigma 1');
title('Ornstein-Uhlenbeck example noise');
xlim([0 300]);
xlabel('Sample');
ylabel('Noise');
hold off;

