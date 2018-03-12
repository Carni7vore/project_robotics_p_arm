function T1= forward_kinematics(M,S,theta)
scr= @(s) [0 -s(3) s(2) s(4); s(3) 0 -s(1) s(5); -s(2) s(1) 0 s(6); 0 0 0 0];
base_frame=[0 0 0 -0.35; 0 0 0 0; 0 0 0 0.24; 0 0 0 0];

t2= expm(scr(S(:,1))* theta(1));
t3= t2* expm(scr(S(:,2))* theta(2));
t4= t3* expm(scr(S(:,3))* theta(3));
t5= t4* expm(scr(S(:,4))* theta(4));
t6= t5* expm(scr(S(:,5))* theta(5));

T1=base_frame+ t6* expm(scr(S(:,6))* theta(6))*M;

end