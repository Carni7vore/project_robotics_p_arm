function theta= inverse_kinematics(T1)

scr= @(s) [0 -s(3) s(2) s(4); s(3) 0 -s(1) s(5); -s(2) s(1) 0 s(6); 0 0 0 0];
base_frame=[0 0 0 -0.35; 0 0 0 0; 0 0 0 0.24; 0 0 0 0];

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





theta=[0.5;0.8;0.3;0.9;0.1;0.6;0.7;0.2;0.9;0.1;0.2];
l=0.1;
T2= T1-base_frame;
T1=M;
error= 1;
i=0;
V1= logm(T2/(T1));
V=[V1(3,2); V1(1,3);V1(2,1); V1(1,4); V1(2,4); V1(3,4) ];
while error>0.06
V1= logm(T2/(T1));
V=[V1(3,2); V1(1,3);V1(2,1); V1(1,4); V1(2,4); V1(3,4) ];

J=zeros(6,6);
t2= expm(scr(S(:,1))* theta(1));
t3= t2* expm(scr(S(:,2))* theta(2));
t4= t3* expm(scr(S(:,3))* theta(3));
t5= t4* expm(scr(S(:,4))* theta(4));
t6= t5* expm(scr(S(:,5))* theta(5));
t7= t6* expm(scr(S(:,6))* theta(6));


J(:,1)= S(:,1);
J(:,2)= adjoint(t2)* S(:,2);
J(:,3)= adjoint(t3)* S(:,3);
J(:,4)= adjoint(t4)* S(:,4);
J(:,5)= adjoint(t5)* S(:,5);
J(:,6)= adjoint(t6)* S(:,6);


tdot=pinv(J)*V;

T1=t7 *M;


error= norm(V);
i=i+1;
theta= theta+ tdot* l;
end



end