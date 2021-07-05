%% Numerical Optimization
% Direct simulateneous approach using Euler's forward rule 

clc
clear all

t0 = 0;         % Inital time
tf = 2;         % Final time
x0 = [1; 1; 0]; % Initial state
N = 10;         % Number of discrete times
t = t0:(tf-t0)/N:tf; % Discrete times
n = 3;          % Number of states
h = t(2) - t(1);

for i=1:size(N,1)
%Parameterizing the input
w0 = zeros(N,1);    % Initial guess
wl = -10*ones(N,1); % Lower bound
wu = 10*ones(N,1);  % Upper bound

%Parameterizing the states
z0 = zeros(n*N,1);
zl = -0.15*ones(n*N,1); % Lower bound
zu = 1*ones(n*N,1);  % Upper bound

%Optimization problem
optNLP = optimset('Display','iter','TolX',1e-5,'TolFun', 1e-5, 'TolCon', 1e-5,...
        'MaxFunEval', 10000,'MaxIter', 1000);
[opt,fval] = fmincon(@(w)obj(w),[w0;z0],[],[],[],[],[wl;zl],[wu;zu],...
@(w)const(x0,t,w,N,n), optNLP);
fval
u = opt(1:N);
u(end+1) = u(end); 
stairs(t,u')
xlabel('Time steps','FontSize', 12);
ylabel('Control input u','FontSize', 12);
figure();
plot(t,x(1,:),'b');
hold on
plot(t,x(2,:),'r');
xlabel('Time steps','FontSize', 12);
ylabel('State x','FontSize', 12);
legend('x1','x2');






