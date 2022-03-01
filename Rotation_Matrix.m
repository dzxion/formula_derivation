close all;
clear;
clc;

syms psi theta phi real;
Rz = [cos(psi),-sin(psi),0;
	  sin(psi), cos(psi),0;
	         0,        0,1;];

Ry = [ cos(theta),0,sin(theta);
	            0,1,         0;
	  -sin(theta),0,cos(theta);];

Rx = [1,       0,        0;
	  0,cos(phi),-sin(phi);
	  0,sin(phi), cos(phi);];

%% 磁力计相关
% syms mbx mby mbz real;
% mbody = [mbx,mby,mbz]';
% R_ENU2Body = Rz*Ry*Rx;
% R_Bodyheading2Body = Ry*Rx;
% mbodyheading = R_Bodyheading2Body*mbody

%% 云台相关
syms x_dot y_dot z_dot real;% 电机角速度
wx_m = [x_dot 0 0]';
wy_m = [0 y_dot 0]';
wz_m = [0 0 z_dot]';

R_m2c_x = Ry;
R_c2m_x = R_m2c_x';

R_m2c_z = Rx * Ry;
R_c2m_z = R_m2c_z';

w_c = wy_m + R_c2m_x*wx_m + R_c2m_z*wz_m;

X = [cos(theta),0,-cos(phi)*sin(theta);
              0,1,            sin(phi);
     sin(theta),0, cos(phi)*cos(theta)];
Y = inv(X);
simplify(Y)
