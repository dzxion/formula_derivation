close all;
clear;
clc;

syms T m g real;
syms psi phi theta real;

%% rotation matrix
Rpsi = [cos(psi),-sin(psi),0;
	  sin(psi), cos(psi),0;
	       0,      0,1;];

Rtheta = [cos(theta),0,sin(theta);
	       0,1,     0;
	 -sin(theta),0,cos(theta);];

Rphi = [1,     0,      0;
	  0,cos(phi),-sin(phi);
	  0,sin(phi), cos(phi);];
e3 = [0;0;1];

R = Rpsi*Rtheta*Rphi;
F = -T*R*e3 + m*g*e3;
F_M = simplify(Rpsi'*F)

