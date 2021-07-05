function H   = Hamilton(x1,x2,x3,x4,p1,p2,p3,p4)
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

a11 = c1 + c2 + 2*c3*cos(x3);
a12 = c2 +c3*cos(x3);
a13 = c3*sin(x3);
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
a1 = x2;
a2 = (a13/del)*(a22*(2*x2+x4)*x4+a12*x2^2);
a3 = x4;
a4 = (-a13/del)*(a12*(2*x2+x4)*x4+a11*x2^2);
G1 = (1/del)*(p2*a22-p4*a12);
G2 = (1/del)*(-1*p2*a12+p4*a11);
if G1 < 0
    u1 = M1;
else
    u1 = -M1;
end

if G2 < 0
    u2 = M2;
else
    u2 = -M2;
end

H = 1+p1*(a1+c11*u1+c12*u2)+p2*(a2+c21*u1+c22*u2)+p3*(a3+c31*u1+c32*u2)+p4*(a4+c41*u1+c42*u2);

end