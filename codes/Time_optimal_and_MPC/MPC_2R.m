
Hc = 20;
Hp = 25;
xini(1) = 0;
xini(2) =0;
xini(3) =0;
xini(4) =0;

u0 = 10*ones(2*Hp,1);
x0 = zeros(4*Hp,1);

optNLP = optimset('Display','iter','TolX',1e-5,'TolFun', 1e-5, 'TolCon', 1e-5,...
        'MaxFunEval', 10000,'MaxIter', 10000);
a0 = [u0;x0];

for i=1:100
    
[opt,fval] = fmincon(@(a)obj_2r(a,Hp),a0,[],[],[],[],[],[],@(a)const_2RMPC(xini,a,Hp,Hc),optNLP);
 u = opt(1);
 w = opt(Hp+1);
 [t,y] = ode45(@(t,y) optfin_MPC_2r(y,u,w), [0 0.1],[xini(1), xini(2), xini(3), xini(4)]);
 
 x1 = y(end,1)+rand/50;
  x2 = y(end,2)+rand/50;
   x3 = y(end,3)+rand/50;
    x4 = y(end,4)+rand/50;
    
    xini(1) = x1;
        xini(2) = x2;
            xini(3) = x3;
                xini(4) = x4;
    s1(i) = x1;
    s2(i) = x2;
    s3(i) = x3;
    s4(i) = x4;
end
figure;
plot(s1);
title('State1 Robustness');
figure;
plot(s2);
title('State2 Robustness');
figure;
plot(31);
title('State3 Robustness');
figure;
plot(s4);
title('State4 Robustness');
