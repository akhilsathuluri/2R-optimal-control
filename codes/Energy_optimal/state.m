%% State trajectory for a given set of inputs

function [x]=state(x0,t,w,N)
x = zeros(size(x0,1),N+1);
x(:,1) = x0;
h = t(2)-t(1);
for i=1:N
    u = w(i);
    x(:,i+1)=[x(1,i)+(x(2,i)+u)*h;x(2,i)-u*h;x(3,i)+0.5*x(1,i)^2*h];
end
assignin('base', 'x', x)
