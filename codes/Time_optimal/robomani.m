clear all;


disc = 10;

u0 = 30*ones(2*disc,1);
x0 = zeros(4*disc,1);


a0 = [u0;x0;1];
x01 = [0;0;0;0];
e=0;
j1 = 1;
j2 = 1;
j3 = 1;
j4 = 1;
j5 = 1;
j6 = 1;
optNLP = optimset('Display','iter','TolX',1e-5,'TolFun', 1e-5, 'TolCon', 1e-5,...
        'MaxFunEval', 100000,'MaxIter', 1000000);
   [opt,fval] = fmincon(@(a)obj(a,disc),a0,[],[],[],[],[],[],@(a)timeopt_directRK(x01,a,disc), optNLP)
 for i=1:disc*6
   if i<=2*disc
     if mod(i,2)==1
         u1(j5) = opt(i);
         j5 = j5+1;
     end
     if mod(i,2)==0
         u2(j6) = opt(i);
         j6 = j6+1;
     end
   end
   if i > 2*disc
     if mod(i-2*disc,4)==1
         x1(j1) = opt(i);
         j1 = j1+1;
     end
     if mod(i-2*disc,4)==2
         x2(j2) = opt(i);
         j2 = j2+1;
     end
     if mod(i-2*disc,4)==3
         x3(j3) = opt(i);
         j3 = j3+1;
     end
 
     if mod(i-2*disc,4)==0
         x4(j4) = opt(i);
         j4 = j4+1;
     end
   end
     
 end
 figure
 plot(u1);
 title('Controlinput1 direct');
 figure
 plot(u2);
 title('Controlinput2 direct');
 figure
 plot(x1)
 title('State1')
 figure
 plot(x2)
 title('State2')
  figure
 plot(x3)
 title('State3')
  figure
 plot(x4)
 title('State4')