p01 = -0.1;
p02 = -0.1;
p03 = -0.1;
p04 = -0.1;
xf = [0.76,0,0.261799,0];
tf = 1.3;
alp1 = 10^-5;
alp2 = 10^-7;
for i=1:3000
 [s1,s2,s3,s4,h] = time_conv(p01,p02,p03,p04,tf);
 [s11,s21,s31,s41,h1] = time_conv(p01+alp1,p02,p03,p04,tf);
 [s12,s22,s32,s42,h2] = time_conv(p01,p02+alp1,p03,p04,tf);
 [s13,s23,s33,s43,h3] = time_conv(p01,p02,p03+alp1,p04,tf);
 [s14,s24,s34,s44,h4] = time_conv(p01,p02,p03,p04+alp1,tf);
 [ts1,ts2,ts3,ts4,th] = time_conv(p01,p02,p03,p04,tf+alp2);
 
b11 = (s11-s1)/alp1;
b12 = (s12-s1)/alp1;
b13 = (s13-s1)/alp1;
b14 = (s14-s1)/alp1;
b15 = (ts1-s1)/alp2;

b21 = (s21-s2)/alp1;
b22 = (s22-s2)/alp1;
b23 = (s23-s2)/alp1;
b24 = (s24-s2)/alp1;
b25 = (ts2-s2)/alp2;

b31 = (s31-s3)/alp1;
b32 = (s32-s3)/alp1;
b33 = (s33-s3)/alp1;
b34 = (s34-s3)/alp1;
b35 = (ts3-s3)/alp2;

b41 = (s41-s4)/alp1;
b42 = (s42-s4)/alp1;
b43 = (s43-s4)/alp1;
b44 = (s44-s4)/alp1;
b45 = (ts4-s4)/alp2;


b51 = 0.001*(h1-h)/alp1;
b52 = 0.001*(h2-h)/alp1;
b53 = 0.001*(h3-h)/alp1;
b54 = 0.001*(h4-h)/alp1;
b55 = 0.001*(th-h)/alp2;

Big = [b11,b12,b13,b14,b15;b21,b22,b23,b24,b25;b31,b32,b33,b34,b35;b41,b42,b43,b44,b45;b51,b52,b53,b54,b55];
L = [s1-xf(1);s2-xf(2);s3-xf(3);(s4-xf(4));0.001*h];
Ln = norm(L);
step = Big\L;
a = alpchooser(p01,p02,p03,p04,tf,step(1),step(2),step(3),step(4),step(5));
step = a*step;
pu1 = p01-step(1);
pu2 = p02-step(2);
pu3 = p03-step(3);
pu4 = p04-step(4);
tup = tf-step(5);
Lp(i) = Ln;
p01 = pu1;
p02 = pu2;
p03 = pu3;
p04 = pu4;
tf = tup;
end
plot(Lp);