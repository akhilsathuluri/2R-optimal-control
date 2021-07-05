function A = propogator(x1,x2,x3,x4,p1,p2,p3,p4,u1,u2)

A(1,1) = 0;
A(1,2) = 1;
A(1,3) = 0;
A(1,4) = 0;
A(1,5) = 0;
A(1,6) = 0;
A(1,7) = 0;
A(1,8) = 0;

A(2,1) = 0;
A(2,2) = (1.35*(1.63*x4 + 2*x2*(0.815 + 1.35*cos(x3)))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);
A(2,3) = (1.35*cos(x3)*(0.815*x4*(2*x2 + x4) + x2^2*(0.815 + 1.35*cos(x3))))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (2.9706750000000004*u1*cos(x3)*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (3.6450000000000005*u2*cos(x3)*(0.815 + 1.35*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (1.35*u2*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (1.8225000000000002*x2^2*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (4.920750000000001*cos(x3)*(0.815*x4*(2*x2 + x4) + x2^2*(0.815 + 1.35*cos(x3)))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2;
A(2,4)=(1.35*(0.815*x4 + 0.815*(2*x2 + x4))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);
A(2,5) = 0;
A(2,6) = 0;
A(2,7) = 0;
A(2,8) = 0;

A(3,1) = 0;
A(3,2) = 0;
A(3,3) = 0;
A(3,4) = 1;
A(3,5) = 0;
A(3,6) = 0;
A(3,7) = 0;
A(3,8) = 0;

A(4,1) =  0;
A(4,2) = -((1.35*(2*x4*(0.815 + 1.35*cos(x3)) + 2*x2*(5.774939000000002 + 2.7*cos(x3)))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2));
A(4,3) = -((1.35*cos(x3)*(x4*(2*x2 + x4)*(0.815 + 1.35*cos(x3)) + x2^2*(5.774939000000002 + 2.7*cos(x3))))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)) + (3.6450000000000005*u1*cos(x3)*(0.815 + 1.35*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (3.6450000000000005*u2*cos(x3)*(5.774939000000002 + 2.7*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (1.35*u1*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (2.7*u2*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) + (4.920750000000001*cos(x3)*(x4*(2*x2 + x4)*(0.815 + 1.35*cos(x3)) + x2^2*(5.774939000000002 + 2.7*cos(x3)))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (1.35*sin(x3)*(-2.7*x2^2*sin(x3) - 1.35*x4*(2*x2 + x4)*sin(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);
A(4,4) = -((1.35*(x4*(0.815 + 1.35*cos(x3)) + (2*x2 + x4)*(0.815 + 1.35*cos(x3)))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2));
A(4,5) = 0;
A(4,6) = 0;
A(4,7) = 0;
A(4,8) = 0;

A(5,1) = 0;
A(5,2) = 0;
A(5,3) = 0; 
A(5,4) = 0;
A(5,5) = 0;
A(5,6) = 0;
A(5,7) = 0;
A(5,8) = 0;

A(6,1) = 0;
A(6,2) = -((2.7*p2*(0.815 + 1.35*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)) + (2.7*p4*(5.774939000000002 + 2.7*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);
A(6,3) = -((1.35*p2*cos(x3)*(1.63*x4 + 2*x2*(0.815 + 1.35*cos(x3))))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)) + (1.35*p4*cos(x3)*(2*x4*(0.815 + 1.35*cos(x3)) + 2*x2*(5.774939000000002 + 2.7*cos(x3))))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) + (3.6450000000000005*p2*x2*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) + (4.920750000000001*p2*cos(x3)*(1.63*x4 + 2*x2*(0.815 + 1.35*cos(x3)))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (4.920750000000001*p4*cos(x3)*(2*x4*(0.815 + 1.35*cos(x3)) + 2*x2*(5.774939000000002 + 2.7*cos(x3)))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (1.35*p4*sin(x3)*(-5.4*x2*sin(x3) - 2.7*x4*sin(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);
A(6,4) = -((2.2005*p2*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)) + (2.7*p4*(0.815 + 1.35*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);
A(6,5) = -1;
A(6,6) = -((1.35*(1.63*x4 + 2*x2*(0.815 + 1.35*cos(x3)))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2));
A(6,7) = 0;
A(6,8) = (1.35*(2*x4*(0.815 + 1.35*cos(x3)) + 2*x2*(5.774939000000002 + 2.7*cos(x3)))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);

A(7,1) = 0;
A(7,2) = (-p2)*((1.35*cos(x3)*(1.63*x4 + 2*x2*(0.815 + 1.35*cos(x3))))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (3.6450000000000005*x2*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (4.920750000000001*cos(x3)*(1.63*x4 + 2*x2*(0.815 + 1.35*cos(x3)))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2) - p4*(-((1.35*cos(x3)*(2*x4*(0.815 + 1.35*cos(x3)) + 2*x2*(5.774939000000002 + 2.7*cos(x3))))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)) + (4.920750000000001*cos(x3)*(2*x4*(0.815 + 1.35*cos(x3)) + 2*x2*(5.774939000000002 + 2.7*cos(x3)))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (1.35*sin(x3)*(-5.4*x2*sin(x3) - 2.7*x4*sin(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2));
A(7,3) = (-p2)*(-((2.9706750000000004*u1*cos(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2) + (3.6450000000000005*u2*cos(x3)^2*(0.815 + 1.35*cos(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (1.35*u2*cos(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (5.467500000000001*x2^2*cos(x3)*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (14.762250000000002*cos(x3)^2*(0.815*x4*(2*x2 + x4) + x2^2*(0.815 + 1.35*cos(x3)))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (1.35*(0.815*x4*(2*x2 + x4) + x2^2*(0.815 + 1.35*cos(x3)))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) + (21.656220750000006*u1*cos(x3)^2*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^3 - (26.572050000000008*u2*cos(x3)^2*(0.815 + 1.35*cos(x3))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^3 + (2.9706750000000004*u1*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (9.841500000000002*u2*cos(x3)*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (3.6450000000000005*u2*(0.815 + 1.35*cos(x3))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (13.286025000000004*x2^2*cos(x3)*sin(x3)^3)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (35.872267500000014*cos(x3)^2*(0.815*x4*(2*x2 + x4) + x2^2*(0.815 + 1.35*cos(x3)))*sin(x3)^3)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^3 + (4.920750000000001*(0.815*x4*(2*x2 + x4) + x2^2*(0.815 + 1.35*cos(x3)))*sin(x3)^3)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2) - p4*((3.6450000000000005*u1*cos(x3)^2*(0.815 + 1.35*cos(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (3.6450000000000005*u2*cos(x3)^2*(5.774939000000002 + 2.7*cos(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (1.35*u1*cos(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (2.7*u2*cos(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (1.35*(-2.7*x2^2*cos(x3) - 1.35*x4*(2*x2 + x4)*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) + (14.762250000000002*cos(x3)^2*(x4*(2*x2 + x4)*(0.815 + 1.35*cos(x3)) + x2^2*(5.774939000000002 + 2.7*cos(x3)))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (1.35*(x4*(2*x2 + x4)*(0.815 + 1.35*cos(x3)) + x2^2*(5.774939000000002 + 2.7*cos(x3)))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (26.572050000000008*u1*cos(x3)^2*(0.815 + 1.35*cos(x3))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^3 + (26.572050000000008*u2*cos(x3)^2*(5.774939000000002 + 2.7*cos(x3))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^3 - (9.841500000000002*u1*cos(x3)*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (19.683000000000003*u2*cos(x3)*sin(x3)^2)/       (4.042350285000001 -  1.8225000000000002*cos(x3)^2)^2 - (3.6450000000000005*u1*(0.815 + 1.35*cos(x3))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (3.6450000000000005*u2*(5.774939000000002 + 2.7*cos(x3))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (35.872267500000014*cos(x3)^2*(x4*(2*x2 + x4)*(0.815 + 1.35*cos(x3)) + x2^2*(5.774939000000002 + 2.7*cos(x3)))*sin(x3)^3)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^3 - (4.920750000000001*(x4*(2*x2 + x4)*(0.815 + 1.35*cos(x3)) + x2^2*(5.774939000000002 + 2.7*cos(x3)))*sin(x3)^3)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (2.7*cos(x3)*(-2.7*x2^2*sin(x3) - 1.35*x4*(2*x2 + x4)*sin(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) + (9.841500000000002*cos(x3)*sin(x3)^2*(-2.7*x2^2*sin(x3) - 1.35*x4*(2*x2 + x4)*sin(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2);
A(7,4) = (-p2)*((1.35*(0.815*x4 + 0.815*(2*x2 + x4))*cos(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (4.920750000000001*(0.815*x4 + 0.815*(2*x2 + x4))*cos(x3)*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2) - p4*(-((1.35*cos(x3)*(x4*(0.815 + 1.35*cos(x3)) + (2*x2 + x4)*(0.815 + 1.35*cos(x3))))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)) + (4.920750000000001*cos(x3)*(x4*(0.815 + 1.35*cos(x3)) + (2*x2 + x4)*(0.815 + 1.35*cos(x3)))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (1.35*sin(x3)*(-1.35*x4*sin(x3) - 1.35*(2*x2 + x4)*sin(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2));
A(7,5) = 0;
A(7,6) = -((1.35*cos(x3)*(0.815*x4*(2*x2 + x4) + x2^2*(0.815 + 1.35*cos(x3))))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)) + (2.9706750000000004*u1*cos(x3)*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (3.6450000000000005*u2*cos(x3)*(0.815 + 1.35*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (1.35*u2*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) + (1.8225000000000002*x2^2*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) + (4.920750000000001*cos(x3)*(0.815*x4*(2*x2 + x4) + x2^2*(0.815 + 1.35*cos(x3)))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2;
A(7,7 ) = 0;
A(7,8) = (1.35*cos(x3)*(x4*(2*x2 + x4)*(0.815 + 1.35*cos(x3)) + x2^2*(5.774939000000002 + 2.7*cos(x3))))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (3.6450000000000005*u1*cos(x3)*(0.815 + 1.35*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (3.6450000000000005*u2*cos(x3)*(5.774939000000002 + 2.7*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (1.35*u1*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) + (2.7*u2*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) - (4.920750000000001*cos(x3)*(x4*(2*x2 + x4)*(0.815 + 1.35*cos(x3)) + x2^2*(5.774939000000002 + 2.7*cos(x3)))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (1.35*sin(x3)*(-2.7*x2^2*sin(x3) - 1.35*x4*(2*x2 + x4)*sin(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);

A(8,1) = 0;
A(8,2) = -((2.2005*p2*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)) + (2.7*p4*(0.815 + 1.35*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);
A(8,3) = -((1.35*p2*(0.815*x4 + 0.815*(2*x2 + x4))*cos(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)) + (1.35*p4*cos(x3)*(x4*(0.815 + 1.35*cos(x3)) + (2*x2 + x4)*(0.815 + 1.35*cos(x3))))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2) + (4.920750000000001*p2*(0.815*x4 + 0.815*(2*x2 + x4))*cos(x3)*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 - (4.920750000000001*p4*cos(x3)*(x4*(0.815 + 1.35*cos(x3)) + (2*x2 + x4)*(0.815 + 1.35*cos(x3)))*sin(x3)^2)/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)^2 + (1.35*p4*sin(x3)*(-1.35*x4*sin(x3) - 1.35*(2*x2 + x4)*sin(x3)))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);
A(8,4) = -((2.2005*p2*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2)) + (1.35*p4*(1.63 + 2.7*cos(x3))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);
A(8,5) = 0;
A(8,6) = -((1.35*(0.815*x4 + 0.815*(2*x2 + x4))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2));
A(8,7) = -1;
A(8,8) = (1.35*(x4*(0.815 + 1.35*cos(x3)) + (2*x2 + x4)*(0.815 + 1.35*cos(x3)))*sin(x3))/(4.042350285000001 - 1.8225000000000002*cos(x3)^2);
end