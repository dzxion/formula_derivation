close all;
clear;
clc;

syms T m g real;
syms psi phi theta real;

% %% rotation matrix
% Rpsi = [cos(psi),-sin(psi),0;
% 	  sin(psi), cos(psi),0;
% 	       0,      0,1;];
% 
% Rtheta = [cos(theta),0,sin(theta);
% 	       0,1,     0;
% 	 -sin(theta),0,cos(theta);];
% 
% Rphi = [1,     0,      0;
% 	  0,cos(phi),-sin(phi);
% 	  0,sin(phi), cos(phi);];
% e3 = [0;0;1];
% 
% %% 水平力推导
% R = Rpsi*Rtheta*Rphi;
% F = -T*R*e3 + m*g*e3;
% F_M = simplify(Rpsi'*F);
% 
% %% 加速距离计算
% g = 9.81;
% deg = 60;
% a = g*tan(deg2rad(deg))
% v = 35;
% t = v/a
% s = 1/2*a*t^2

%% 世界系升力/加速度计算

% 332s
% rpm0 = 19257;
% rpm1 = 22385;
% rpm2 = 21757;
% rpm3 = 20500;
% % f1 = 1930e-3;
% % f2 = 1725e-3;
% % f3 = 1520e-3;
% % f0 = 1320e-3;
% f0 = linear_interpolation(rpm0,18618,20088,1120e-3,1520e-3);
% f1 = 1930e-3;
% f2 = linear_interpolation(rpm2,20088,22284,1520e-3,1930e-3);
% f3 = linear_interpolation(rpm3,20088,22284,1520e-3,1930e-3);
% rolldeg = 75;
% ay_b = 4.46;
% az_b = -21.9;
% g = 9.81;
% m = 3.6;

% 333s
rpm0 = 9914;
rpm1 = 17714;
rpm2 = 15585;
rpm3 = 9357;
% f1 = 1930e-3;
% f2 = 1725e-3;
% f3 = 1520e-3;
% f0 = 1320e-3;
f0 = linear_interpolation(rpm0,8880,11316,310e-3,520e-3);
f1 = linear_interpolation(rpm1,14802,18618,730e-3,1120e-3);
f2 = linear_interpolation(rpm2,14802,18618,730e-3,1120e-3);
f3 = linear_interpolation(rpm3,8880,11316,310e-3,520e-3);
rolldeg = 75;
ay_b = 9.1;
az_b = -5.46;
g = 9.81;
m = 3.6;

G = m*g
f = f0+f1+f2+f3
roll = deg2rad(rolldeg);
fz_n = f*cos(roll)
fy_n = f*sin(roll)
az_n = ay_b*sin(roll)-az_b*cos(roll)-g
ay_n = -ay_b*cos(roll)-az_b*sin(roll)
Fz_n = m*az_n
Fy_n = m*ay_n
Fz_thrust_n = fz_n*g
Fy_thrust_n = fy_n*g
Fz_ae_n = Fz_n - Fz_thrust_n + m*g
Fy_ae_n = Fy_n - Fy_thrust_n
