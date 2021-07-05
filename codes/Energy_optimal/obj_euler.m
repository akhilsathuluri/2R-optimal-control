function [J] = obj_euler(w)
N = 200;
m = 2;
u = w(1:m*N);
%u1_opt = w(1:N);
%u2_opt = w(N:m*N);
%J = sum(u1_opt.^2)+sum(u2_opt.^2);
J = sum(u.^2);