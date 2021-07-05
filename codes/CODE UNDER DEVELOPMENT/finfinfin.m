xini = [0,0,0,0];
xf = [0.975,0,0,0];
b1 = 1;
b2 = 2;
b3 = 3;
b4 = 3;
tf = 1;

for j=1:1
    grad_ini = [0,0,0,0;0,0,0,0;0,0,0,0;0,0,0,0;1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1];
[s1,s2,s3,s4,cs1,cs2,cs3,cs4,i1,i2] = topt23(xini(1),xini(2),xini(3),xini(4),b1,b2,b3,b4,tf);
n = size(s1,2);
for i=1:n
   A = propogator(s1(i),s2(i),s3(i),s4(i),cs1(i),cs2(i),cs3(i),cs4(i),i1(i),i2(i)); 
  grad_upd = grad_ini+A*grad_ini*10^-8;
  grad_ini = grad_upd;
end
    L = Lagrange(s1(end),s2(end),s3(end),s4(end),cs1(end),cs2(end),cs3(end),cs4(end),i1(end),i2(end));
    part1 = L*grad_upd;
    [BigF,H] = F(s1(end),s2(end),s3(end),s4(end),cs1(end),cs2(end),cs3(end),cs4(end),i1(end),i2(end));
    part2 = L*BigF;
    Partfinal = horzcat(part1,part2);
    obj = [s1(end)-xf(1);s2(end)-xf(2);s3(end)-xf(3);s4(end)-xf(4);H];
    db = (Partfinal)\obj;
    a = alpchooser(b1,b2,b3,b4,tf,db(1),db(2),db(3),db(4),db(5));
    db_step = a*db;
    b1 = b1-db_step(1);
    b2 = b2-db_step(2);
    b3 = b3-db_step(3);
    b4 = b4-db_step(4);
    tf = tf-db_step(5);
end