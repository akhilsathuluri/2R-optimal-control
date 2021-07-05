function alp = alpchooser(b1,b2,b3,b4,tf,db1,db2,db3,db4,dtf)
p = 0.01:0.01:1;
 n = size(p,2);
f(1) = 1;
for i=2:n
f(i) = p(i)*(((b1)^2+(b2)^2+(b3)^2+(b4)^4+tf^2)^0.5)/((db1^2+db2^2+db3^2+db4^2+dtf^2))^0.5;
end
alp=  min(f);
end