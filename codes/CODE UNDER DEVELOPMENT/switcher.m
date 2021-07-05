function [t1,t2] = switcher(g1,g2,time)
n = size(g1,2);
c1 = 1;
c2 = 1;
for i=1:n-1
  temp1 = g1(i+1)*g1(i);
  temp2 = g2(i+1)*g2(i);
if temp1<=0
    t1(c1) = time(i);
    c1 = c1+1;
end
if temp2<=0
    t2(c2) = time(i);
    c2 = c2+1;
end

end

end