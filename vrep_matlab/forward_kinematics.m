function T1= forward_kinematics(theta)
scr= @(s) [0 -s(3) s(2) s(4); s(3) 0 -s(1) s(5); -s(2) s(1) 0 s(6); 0 0 0 0];
base_frame=[0 0 0 -0.35; 0 0 0 0; 0 0 0 0.24; 0 0 0 0];
%theta=[(-90/180)*pi;(90/180)*pi;(-90/180)*pi;0;(90/180)*pi;(0/180)*pi];
% theta=[(0/180)*pi;(-90/180)*pi;(90/180)*pi;0;(-90/180)*pi;(0/180)*pi];
%Compute S based on measurement 

M=[1 0 0 0;0 1 0 0;0 0 1 0.899;0 0 0 1];

A=[0;0;1];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S1=[A;-W*[0;0;0]];

A=[0;-1;0];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S2=[A;-W*[0;0;0.1483]];

A=[0;-1;0];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S3=[A;-W*[0;0;0.4387]];

A=[0;0;1];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S4=[A;-W*[0;0;0.6035]];

A=[0;-1;0];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S5=[A;-W*[0;0;0.7487]];

A=[0;0;1];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S6=[A;-W*[0;0;0.889]];

S=[S1,S2,S3,S4,S5,S6];



t2= expm(scr(S(:,1))* theta(1));
t3= t2* expm(scr(S(:,2))* theta(2));
t4= t3* expm(scr(S(:,3))* theta(3));
t5= t4* expm(scr(S(:,4))* theta(4));
t6= t5* expm(scr(S(:,5))* theta(5));

T1=base_frame+ t6* expm(scr(S(:,6))* theta(6))*M;

end