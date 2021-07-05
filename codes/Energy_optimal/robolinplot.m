th1 = y(1,:);
th2 = y(3,:);
%The coordinates of the links of each of the manipulator
x1 = 0.4*cos(th1);
y1 = 0.4*sin(th1);
x2 = 0.4*cos(th1)+0.25*cos(th1+th2);
y2 = 0.4*sin(th1)+0.25*sin(th1+th2);
figHandle = figure();
for i=1:5:201
    A = [0 x1(i)]; 
    B = [0 y1(i)]; 
 %   subplot(1,3,1);
    plot(A,B,'*')
    axis([-0.8 0.8 -0.5 0.5])
    hold on
    line(A,B)
    hold on
    A2 = [x1(i) x2(i)]; 
    B2 = [y1(i) y2(i)];
 %   subplot(1,3,1);
    plot(A2,B2,'*')
    axis([-0.3 0.8 -0.5 0.8])
    hold on
    line(A2,B2,'Color','red')
 %   subplot(1,3,2);
 %  stairs(t(1:i),u(1:i)');
 %   hold on
 %   subplot(1,3,3)
 %   stairs(t(1:i),u(201:200+i)');
 %   hold on;
  % pause(0.5);
end