close all;
clear;
clc;

syms psi theta phi real;
q_roll = [cos(phi/2),sin(phi/2),0,0];
q_pitch = [cos(theta/2),0,sin(theta/2),0];
q_yaw = [cos(psi/2),0,0,sin(psi/2)];

% qw2b = quaternProd(q_yaw, q_pitch);
% qw2b = quaternProd(qwb, q_roll);

q_bodyheading2body = quaternProd(q_pitch, q_roll)
qw2b = quaternProd(q_yaw, q_bodyheading2body);

