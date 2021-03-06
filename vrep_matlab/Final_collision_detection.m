%collison_detection
% S = [-1.00 0.00 0.00 0.00; 0.00 0.00 0.00 0.00; 0.00 0.00 0.00 0.00; 0.00 0.00 0.00 0.00; 0.00 0.00 0.00 0.00; -2.00 -1.00 -1.00 -1.00];
% M = [-1.00 0.00 0.00 0.00; 0.00 -1.00 0.00 -6.00; 0.00 0.00 1.00 0.00; 0.00 0.00 0.00 1.00];
% p_robot = [0.00 -2.00 -4.00 -2.00 0.00 0.00; 0.00 -2.00 -4.00 -4.00 -4.00 -6.00; 0.00 0.00 0.00 0.00 0.00 0.00];
% r_robot = [0.90 0.90 0.90 0.90 0.90 0.90];
% p_obstacle = [2.69 -3.90 0.61 -3.68 -1.95 3.34 4.15 1.16 -0.79 3.42 1.26; 0.27 1.98 1.30 -0.26 3.09 4.11 2.07 -1.85 3.02 -0.20 -3.48; -0.47 4.91 1.68 4.29 -1.11 2.02 0.93 4.53 3.27 -3.73 -3.76];
% r_obstacle = [1.65 0.90 1.18 3.56 2.55 0.50 3.27 2.15 3.46 0.78 1.30];
% theta_start = [0.53 -0.45 -0.66 -1.46 0.47 -0.48 -0.46 0.45 -0.61; 0.51 -1.30 -0.62 -0.25 2.21 -2.51 -0.72 0.90 -2.78; -0.51 -1.95 -0.14 2.09 1.49 -2.27 -1.77 2.64 -1.17; 1.42 -2.91 -1.86 -0.09 -2.40 1.17 -2.67 -1.28 0.10];
% theta_goal = [-2.37 -0.46 -0.22 -1.70 -1.63 -1.71 0.65 -1.02 -1.68; -2.54 1.91 -0.98 -2.69 -1.90 -2.38 1.37 -1.66 -2.79; 2.04 -2.46 -1.52 2.64 1.78 -1.42 -1.27 -3.08 -2.53; 0.13 -0.29 -0.75 0.58 3.13 -2.70 -0.80 1.08 -0.09];
% 

function path_ret= Final_collision_detection(S,p_robot,r_robot,theta_start,theta_goal)

%S = [0.00 0.00 -1.00 0.00 0.00; 0.00 0.00 0.00 0.00 0.00; 1.00 0.00 0.00 0.00 0.00; 0.00 0.00 0.00 0.00 0.00; 2.00 0.00 0.00 -1.00 0.00; 0.00 1.00 2.00 0.00 1.00];
%M = [0.00 0.00 -1.00 -8.00; 0.00 1.00 0.00 0.00; 1.00 0.00 0.00 0.00; 0.00 0.00 0.00 1.00];
%p_robot = [0.00 -2.00 -4.00 -6.00 -6.00 -8.00 -8.00; 0.00 0.00 0.00 2.00 0.00 -2.00 0.00; 0.00 0.00 0.00 0.00 0.00 0.00 0.00];
%r_robot = 0.05;
% p_obstacle = [-2.71 -4.69 -0.77 -1.66 3.24; 4.86 2.58 3.45 4.92 4.32; 3.37 -4.87 4.92 1.28 2.98];
% r_obstacle = [3.73 3.09 4.31 2.30 4.01];





   theta_a=theta_start;
   theta_b=theta_goal;


for W=1:500
    
    theta=(1-W/500)*theta_a+(W/500)*theta_b;
    p=zeros(4,8);
    n=1;
p(:,1)=[0;0;0;1];
p(:,2)=[p_robot(:,2);1];
t=1;


for i=3:8
    p(:,i)=t*expm(skew4(S(:,i-2))*theta(i-2,n))*[p_robot(:,i);1];
    t=t*expm(skew4(S(:,i-2))*theta(i-2,n));
    
end

p=p(1:3,:);
FF=0;
for i=6:8
  D1=norm(p(1,i)+0.7);
  if D1>0.05
      a=0;
  else
      a=1;
      FF=FF+a;   
      break
  end
end
    if norm(p(1,8)+0.7)>0.09
      a=0;
  else 
      a=1;
      
   FF=FF+a; 
   break
    end

if FF>0
    break
end


end

if FF>0
    path_ret=1;
else
    path_ret=0;

end