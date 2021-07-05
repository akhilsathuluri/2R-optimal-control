function dy = serialmanipulator_dynamic_model(y,u1,u2)
l1 = 0.4;
l2  = 0.25;
r2 = 0.125;
m2 = 15;
m3 = 6;
t1 = 1.6;
t2 = 0.43;
t3 = 0.01;
t4 = t2+l2^2*m3;
t5 = t1+l1^2*(m2+m3);
t6 = l1*(r2*m2+l2*m3);
t7 = t3+t4;
dy(1,:) =y(2);
dy(2,:) = (t7*(u1-u2+t6*(y(2)+y(4))^2*sin(y(3)))-cos(y(3))*t6*(u2-t6*y(2)^2*sin(y(3))))/(t7*t5-t6^2*(cos(y(3)))^2);
dy(3,:) = y(4);
dy(4,:) = ((t5+t6*cos(y(3)))*(u2-t6*y(2)^2*sin(y(3)))-(t7+t6*cos(y(3)))*(u1-u2+t6*(y(2)+y(4))^2*sin(y(3))))/(t7*t5-t6^2*(cos(y(3)))^2);
end