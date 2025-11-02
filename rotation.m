% definition
% x - roll y - pitch z - yaw
% fc - zyx
% gimbal - zxy

close all;
clear;
clc;

syms x y z real;

%% quaternion
q_x = [cos(x/2),sin(x/2),0,0];
q_y = [cos(y/2),0,sin(y/2),0];
q_z = [cos(z/2),0,0,sin(z/2)];

% qw2b = quaternProd(q_yaw, q_pitch);
% qw2b = quaternProd(qwb, q_roll);

% q_bodyheading2body = quaternProd(q_pitch, q_roll)
% qw2b = quaternProd(q_yaw, q_bodyheading2body);
q_zyx = quaternProd(quaternProd(q_z, q_y), q_x)
q_zxy = quaternProd(quaternProd(q_z, q_x), q_y)

%% rotation matrix
Rz = [cos(z),-sin(z),0;
	  sin(z), cos(z),0;
	       0,      0,1;];

Ry = [cos(y),0,sin(y);
	       0,1,     0;
	 -sin(y),0,cos(y);];

Rx = [1,     0,      0;
	  0,cos(x),-sin(x);
	  0,sin(x), cos(x);];
R_zyx = Rz*Ry*Rx
R_zxy = Rz*Rx*Ry

%% gimbal
syms x_dot y_dot z_dot real;
wx_m = [x_dot 0 0]';
wy_m = [0 y_dot 0]';
wz_m = [0 0 z_dot]';

R_m2c_x = Ry;
R_c2m_x = R_m2c_x';

R_m2c_z = Rx * Ry;
R_c2m_z = R_m2c_z';

w_b_zxy = wy_m + R_c2m_x*wx_m + R_c2m_z*wz_m;
w_b_xy = wy_m + R_c2m_x*wx_m;

X = [cos(y),0,-cos(x)*sin(y);
              0,1,    sin(x);
     sin(y),0, cos(x)*cos(y)];
simplify(inv(X))

A = [cos(y) 0;
         0  1;
     sin(y) 0;];
simplify(pinv(A))
