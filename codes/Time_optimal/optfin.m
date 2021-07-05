    function dy = optfin(y,u1,u2)
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

a11 = c1 + c2 + 2*c3*cos(y(3));
a12 = c2 +c3*cos(y(3));
a13 = c3*sin(y(3));
a22 = c2;
del = a11*a22 - a12^2;
c11 = 0;
c12 = 0;
c21 = a22/del;
c22 = -a12/del;
c31 = 0;
c32 = 0;
c41 = -a12/del;
c42 = a11/del;
a1 = y(2);
a2 = (a13/del)*(a22*(2*y(2)+y(4))*y(4)+a12*y(2)^2);
a3 = y(4);
a4 = (-a13/del)*(a12*(2*y(2)+y(4))*y(4)+a11*y(2)^2);
%   G1 = (1/del)*(y(6)*a22-y(8)*a12);
%   G2 = (1/del)*(-1*y(6)*a12+y(8)*a11);
%   if G1 < 0
%       u1 = M1;
%   else
%       u1 = -M1;
%   end
%   
%   if G2 < 0
%       u2 = M2;
%   else
%       u2 = -M2;
%   end

dy(1,:) = (a1+c11*u1+c12*u2)*y(5);
dy(2,:) = (a2+c21*u1+c22*u2)*y(5);
dy(3,:) = (a3+c31*u1+c32*u2)*y(5);
dy(4,:) = (a4+c41*u1+c42*u2)*y(5);
dy(5,:) = 0;
%  dy(5,:) = 0;
%   dy(6,:) =(-y(5)-(1.35*y(6)*(1.63*y(4) + 2*y(2)*(0.815 + 1.35*cos(y(3))))*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2) +(1.35*y(8)*(2*y(4)*(0.815 + 1.35*cos(y(3))) + 2*y(2)*(5.774939000000002 + 2.7*cos(y(3))))*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2));
%   dy(7,:) = ((-y(6))*((1.35*cos(y(3))*(0.815*y(4)*(2*y(2) + y(4)) + y(2)^2*(0.815 + 1.35*cos(y(3)))))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2) - (2.9706750000000004*u1*cos(y(3))*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2)^2 + (3.6450000000000005*u2*cos(y(3))*(0.815 + 1.35*cos(y(3)))*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2)^2 + (1.35*u2*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2) - (1.8225000000000002*y(2)^2*sin(y(3))^2)/(4.042350285000001 -1.8225000000000002*cos(y(3))^2) - (4.920750000000001*cos(y(3))*(0.815*y(4)*(2*y(2) + y(4)) + y(2)^2*(0.815 + 1.35*cos(y(3))))*sin(y(3))^2)/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2)^2) - y(8)*(-((1.35*cos(y(3))*(y(4)*(2*y(2) + y(4))*(0.815 + 1.35*cos(y(3))) + y(2)^2*(5.774939000000002 + 2.7*cos(y(3)))))/(4.042350285000001 -1.8225000000000002*cos(y(3))^2)) + (3.6450000000000005*u1*cos(y(3))*(0.815 + 1.35*cos(y(3)))*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2)^2 - (3.6450000000000005*u2*cos(y(3))*(5.774939000000002 + 2.7*cos(y(3)))*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2)^2 + (1.35*u1*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2) -  (2.7*u2*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2) + (4.920750000000001*cos(y(3))*(y(4)*(2*y(2) + y(4))*(0.815 + 1.35*cos(y(3))) + y(2)^2*(5.774939000000002 + 2.7*cos(y(3))))*sin(y(3))^2)/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2)^2 - (1.35*sin(y(3))*(-2.7*y(2)^2*sin(y(3)) - 1.35*y(4)*(2*y(2) + y(4))*sin(y(3))))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2)));
%   dy(8,:) = (-y(7) - (1.35*y(6)*(0.815*y(4) + 0.815*(2*y(2) + y(4)))*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2) + (1.35*y(8)*(y(4)*(0.815 + 1.35*cos(y(3))) + (2*y(2) + y(4))*(0.815 + 1.35*cos(y(3))))*sin(y(3)))/(4.042350285000001 - 1.8225000000000002*cos(y(3))^2));       


end


