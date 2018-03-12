function r=adjoint(t)
r= zeros(6,6);
bracket= @(w) [0 -w(3) w(2); w(3) 0 -w(1); -w(2) w(1) 0];
r(1:3,1:3)=t(1:3,1:3);
r(4:6,4:6)=t(1:3,1:3);
r(4:6,1:3)= bracket(t(1:3,4))*t(1:3,1:3);
end