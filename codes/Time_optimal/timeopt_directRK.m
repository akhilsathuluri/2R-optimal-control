function [cineq,ceq]=timeopt_directRK(x0,a,d)

h = 1/10;

cineq(1,1) = a(1)-30;
for j=2:2*d
   cineq(end+1,1) = a(j)-30; 
    cineq(end+1,1) = -a(j)-30;
end
    cineq(end+1,1) = -a(6*d+1);
 ceq(1,1) = a(2*d+1)-x0(1);
 ceq(2,1) = a(2*d+2)-x0(2);
 ceq(3,1)  = a(2*d+3)-x0(3);
 ceq(4,1) = a(2*d+4)-x0(4);

 for i=1:d-1
    
     x1= a(4*(i-1)+2*d+1);
      x2 = a(4*(i-1)+2*d+2);
     x3 = a(4*(i-1)+2*d+3);
    x4 = a(4*(i-1)+2*d+4);
    u1 = a(2*(i-1)+1);
     u2 = a(2*(i-1)+2);
    
    [t,y] = ode45(@(t,y) optfin(y,u1,u2), [0 h],[x1 x2 x3 x4 a(6*d+1) ]);
    


  ceq(end+1,1) = a(2*d+i*4+1)-y(end,1);
   ceq(end+1,1) = a(2*d+i*4+2)-y(end,2);
   ceq(end+1,1) = a(2*d+i*4+3)-y(end,3);
   ceq(end+1,1) = a(2*d+i*4+4)-y(end,4);
   
end


 
 ceq(end+1,1) = a(2*d+4*(d)-3)-0.975;
 ceq(end+1,1) = a(2*d+4*(d)-2);
 ceq(end+1,1) = a(2*d+4*(d)-1);
 ceq(end+1,1) = a(2*d+4*(d));




end
