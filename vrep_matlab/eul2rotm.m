function r= eul2rotm(angles)
a= angles(1);
b= angles(2);
c= angles(3);

% r= zeros(3,3);
% r(1,1)=  cos(a)* cos(b);
% r(1,2)= cos(a) * sin(b) * sin(c) - sin(a) *cos(c);
% r(1,3)= cos(a) * sin(b) * cos(c) + sin(a) * sin(c);
% r(2,1)= sin(a) * cos(b);
% r(2,2)= sin(a) *sin(b) * sin(c) + cos(a) * cos(c);
% r(2,3)= sin(a)* sin(b) * cos(c) - cos(a) * sin(c);
% r(3,1)= -sin(b);
% r(3,2)= cos(b)*sin(c);
% r(3,3)= cos(b)*cos(c);

Rx= [1 0 0; 0 cos(a) -sin(a); 0 sin(a) cos(a)];
Ry= [cos(b) 0 sin(b); 0 1 0; -sin(b) 0 cos(b)];
Rz= [cos(c) -sin(c) 0; sin(c) cos(c) 0; 0 0 1];

r= Rx*Ry*Rz;


end