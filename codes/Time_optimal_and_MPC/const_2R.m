function  [cineq, ceq] = const_2R(xini,a,Hp,Hc)


 m1 = 29.58;
m2 = 15;
l1 = 0.4;
l2 = 0.25;
I1 = 0.416739;
I2 = 0.205625;
M1 = 25;
M2 = 9;
ma = 0;
mb = 6;

c1 = 0.25*m1*l1^2 + I1 + (m2 + ma + mb)*l1^2;
c2 = m2*0.25*l2^2 + I2 + mb*l2^2;
c3 = (m2*l2*0.5 + mb*l2)*l1;

h = 10^-2;

ceq(1,1) = a(2*Hp+1)-xini(1);
%ceq(end+1,1) = a(2*Hp+2)-xini(2);
ceq(end+1,1)  = a(2*Hp+3)-xini(3);
ceq(end+1,1)  = a(2*Hp+4)-xini(4);

 

 ceq(end+1,1) = a(2*Hp+4*(Hp)-3)-0.975;
 ceq(end+1,1) = a(2*Hp+4*(Hp)-2);
 ceq(end+1,1) = a(2*Hp+4*(Hp)-1);
 ceq(end+1,1) = a(2*Hp+4*(Hp));


 cineq(1,1) = a(1)-30;
  
for j=2:2*Hp
   cineq(end+1,1) = a(j)-30; 
    cineq(end+1,1) = -a(j)-30;
end

for j=Hc:Hp
    a(j) = a(Hc);
    a(j+Hp) = a(Hp+Hc);
end

for i=1:Hp-1
    
      x1= a(4*(i-1)+2*Hp+1);
     x2 = a(4*(i-1)+2*Hp+2);
     x3 = a(4*(i-1)+2*Hp+3);
     x4 = a(4*(i-1)+2*Hp+4);
     u1 = a(i);
     u2 = a(Hp+i);
    
    [t,y] = ode45(@(t,y) optfin_MPC_2r(y,u1,u2), [0 0.1],[x1 x2 x3 x4]);
    
   
% a11 = c1 + c2 + 2*c3*cos(x3);
% a12 = c2 +c3*cos(x3);
% a13 = c3*sin(x3);
% a22 = c2;
% del = a11*a22 - a12^2;
% c11 = 0;
% c12 = 0;
% c21 = a22/del;
% c22 = -a12/del;
% c31 = 0;
% c32 = 0;
% c41 = -a12/del;
% c42 = a11/del;
% a1 = x2;
% a2 = (a13/del)*(a22*(2*x2+x4)*x4+a12*x2^2);
% a3 = x4;
% a4 = (-a13/del)*(a12*(2*x2+x4)*x4+a11*x2^2);
% 
% f1 = (a1+c11*u1+c12*u2);
% f2 = (a2+c21*u1+c22*u2);
% f3 = (a3+c31*u1+c32*u2);
% f4 = (a4+c41*u1+c42*u2);


   ceq(end+1,1) = a(2*Hp+i*4+1)-y(end,1);
   ceq(end+1,1) = a(2*Hp+i*4+2)-y(end,2);
   ceq(end+1,1) = a(2*Hp+i*4+3)-y(end,3);
   ceq(end+1,1) = a(2*Hp+i*4+4)-y(end,4);
  
end



end