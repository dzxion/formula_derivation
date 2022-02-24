close all;
clear;
clc;

syms psi theta phi;
% syms mbx mby mbz real;

% mbody = [mbx,mby,mbz]';%'

Rz = [cos(psi),-sin(psi),0;
	  sin(psi), cos(psi),0;
	         0,        0,1;];

Ry = [ cos(theta),0,sin(theta);
	            0,1,         0;
	  -sin(theta),0,cos(theta);];

Rx = [1,       0,        0;
	  0,cos(phi),-sin(phi);
	  0,sin(phi), cos(phi);];

% R_ENU2Body = Rz*Ry*Rx;
% R_Bodyheading2Body = Ry*Rx;
% mbodyheading = R_Bodyheading2Body*mbody

R_motor2camare = Rx * Ry