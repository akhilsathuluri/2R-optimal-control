function [J] = obj_2r(a,Hp)
obj1 = 0;
obj2 = 0;
obj3 = 0;
obj4 = 0;
for i =1:Hp-1
    
    obj1 = obj1 + a(2*Hp+4*(i-1)+3)^2;
    obj2 = obj2 + a(2*Hp+4*(i-1)+2)^2;
    obj3 = obj3 + 100*(0.4-a(2*Hp+4*(i-1)+1))^2;
    obj4 = obj4 + a(2*Hp+4*(i-1)+4)^2;
    
end
J = obj1+obj2+obj3+obj4;

end