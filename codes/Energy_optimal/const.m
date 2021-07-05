%% Constraints on the states
function  [cineq, ceq] = const(x0,t,w,N,n)
cineq = [];
h = t(2) - t(1);

% Equality constraints
ceq(1,1)=w(N+1)-x0(1)-(x0(2)+w(1))*h;
ceq(2,1)=w(N+2)-x0(2)-w(1)*h;
ceq(3,1)=w(N+3)-x0(3)-0.5*x0(1)^2*h;
for i=1:N-1
    ceq(end+1,1) = w(N+n*i+1)-w(N+n*(i-1)+1)-(w(N+n*(i-1)+2)+w(i+1))*h;
    ceq(end+1,1) = w(N+n*i+2)-w(N+n*(i-1)+2)-w(i+1)*h;
    ceq(end+1,1) = w(N+n*i+3)-w(N+n*(i-1)+3)-0.5*w(N+n*(i-1)+1)^2*h;
end
ceq(end+1,1) = w(end)-w(end-n)-0.5*w(end-n-2)^2*h;
ceq(end+1,1) = w(end-2);
ceq(end+1,1) = w(end-1);
x = [x0,reshape(w(N+1:end),3,N)];
assignin('base', 'x', x)