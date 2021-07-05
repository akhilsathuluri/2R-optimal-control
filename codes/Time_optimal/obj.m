%% Objective Function

function [J] = obj(a,disc)
% v1 = (a(1:2*disc,1)-30*ones(2*disc,1));
% v2 = (a(1:2*disc,1)+30*ones(2*disc,1));
J = a(6*disc+1);