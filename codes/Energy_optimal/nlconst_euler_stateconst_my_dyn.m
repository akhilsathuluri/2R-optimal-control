function [cineq, ceq] = nlconst_euler_stateconst(y0, h, w, N, n, m)
cineq = [];

% Parameters of the 2R manipulator
l1 = 0.4;
l2  = 0.25;
r2 = 0.125;
m2 = 15;
m3 = 6;
t1 = 1.6;
t2 = 0.43;
t3 = 0.01;
t4 = t2+l2^2*m3;
t5 = t1+l1^2*(m2+m3);
t6 = l1*(r2*m2+l2*m3);
t7 = t3+t4;

%Equality constraints at t0
ceq(1, 1) = w(m*N+1)-y0(1)-h*y0(2);
ceq(2, 1) = w(m*N+2)-y0(2)-(t7*(w(1)-w(N+1)+t6*(y0(2)+y0(4))^2*sin(y0(3)))-cos(y0(3))*t6*(w(N+1)-t6*y0(2)^2*sin(y0(3))))/(t7*t5-t6^2*(cos(y0(3)))^2)*h;
ceq(3, 1) = w(m*N+3)-y0(3)-y0(4)*h;
ceq(4, 1) = w(m*N+4)-y0(4)-((t5+t6*cos(y0(3)))*(w(N+1)-t6*y0(2)^2*sin(y0(3)))-(t7+t6*cos(y0(3)))*(w(1)-w(N+1)+t6*(y0(2)+y0(4))^2*sin(y0(3))))/(t7*t5-t6^2*(cos(y0(3)))^2)*h;
ceq(5, 1) = w(m*N+5)-y0(5)- h*(w(1)^2+w(N+1)^2);
for i = 1:N-1
    ceq(end+1, 1) = w(m*N+i*n+1)-w(m*N+n*(i-1)+1)-w(m*N+2+n*(i-1))*h;
    ceq(end+1, 1) = w(m*N+i*n+2)-w(m*N+n*(i-1)+2)-(t7*(w(i)-w(N+i)+t6*(w(m*N+2+(i-1)*n)+w(m*N+4+(i-1)*n))^2*sin(w(m*N+3+(i-1)*n)))-cos(w(m*N+3+(i-1)*n))*t6*(w(N+i)-t6*w(m*N+2+(i-1)*n)^2*sin(w(m*N+3+(i-1)*n))))/(t7*t5-t6^2*(cos(w(m*N+3+(i-1)*n)))^2)*h;
    ceq(end+1, 1) = w(m*N+i*n+3)-w(m*N+n*(i-1)+3)-w(m*N+4+n*(i-1))*h;
    ceq(end+1, 1) = w(m*N+i*n+4)-w(m*N+n*(i-1)+4)-((t5+t6*cos(w(m*N+3+(i-1)*n)))*(w(N+i)-t6*w(m*N+2+(i-1)*n)^2*sin(w(m*N+3+(i-1)*n)))-(t7+t6*cos(w(m*N+3+(i-1)*n)))*(w(i)-w(N+i)+t6*(w(m*N+2+(i-1)*n)+w(m*N+4+(i-1)*n))^2*sin(w(m*N+3+(i-1)*n))))/(t7*t5-t6^2*(cos(w(m*N+3+(i-1)*n)))^2)*h;
    ceq(end+1, 1) = w(m*N+i*n+5)-w(m*N+n*(i-1)+5)-h*(w(i)^2+w(N+i)^2);
end
ceq(end+1, 1) = w(end-4)-pi;
ceq(end+1, 1) = w(end-3);
ceq(end+1, 1) = w(end-2);
ceq(end+1, 1) = w(end-1);

y = [y0, reshape(w(m*N+1:end), 5, N)];
assignin('base', 'y', y);