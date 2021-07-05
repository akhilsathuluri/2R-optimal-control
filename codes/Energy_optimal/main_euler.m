%Euler method for direct simulations
clc
clear all

%Parameters for optimization
t0 = 0; %Initial time
tf = 10; %Final time
N = 200;    % Total number of steps
h = (tf-t0)/N; %Step size
y0 = [0;0;0;0;0];%Initial conditions
n = 5;  %Number of state variables
m = 2; %Number of control inputs
t = t0:h:tf;    %time

%Bounds on states
z0 = zeros(n*N, 1);%Initial guess
zl = -10*ones(n*N, 1);%Lower bound
zu = 10*ones(n*N, 1);%Uppper bound

%Bounds on control
w0 = zeros(m*N, 1);   %Initial guess
wl = -10*ones(m*N, 1);    %Lower bound on control
wu = 10*ones(m*N, 1); %Upper bound on control

%Optimization
optNLP = optimset('Display', 'iter', 'TolX', 1e-5, 'TolFun', 1e-5, ...
    'MaxFunEval', 100000, 'MaxIter', 1000);
[opt, fval] = fmincon(@(w)obj_euler(w), [w0;z0], [], [], [], [], [wl;zl], [wu;zu],...
 @(w)nlconst_euler_stateconst(y0, h, w, N, n, m), optNLP);
fval
u = opt(1:m*N);
u(end+1) = u(end);

stairs(t,u(1:201)');
figure();
stairs(t,u(201:401)');
xlabel('Time steps','FontSize', 12);
ylabel('Control input u','FontSize', 12);
figure();
plot(t,y(1,:),'b');
hold on;
plot(t,y(2,:),'r');
xlabel('Time steps','FontSize', 12);
ylabel('State y','FontSize', 12);
plot(t,y(3,:),'g');
plot(t,y(4,:),'--r');
plot(t,y(5,:),'--b');