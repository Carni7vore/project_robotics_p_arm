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

function path_ret= collision_detection(S,p_robot,r_robot,p_obstacle,r_obstacle,theta_start,theta_goal)

scr= @(w)[0,-w(3),w(2),w(4);w(3),0,-w(1),w(5);-w(2),w(1),0,w(6);0,0,0,0];
temp1= size(theta_start);
size_theta=temp1(1);

size_p= size(theta_start);
path_c=zeros(size_p(2),1);
num_run=10;
for path=1:size_p(2)
    theta_a= theta_start(:,path);
    theta_b= theta_goal(:,path);
theta=zeros(size_theta,num_run);
for s= 1:num_run
    theta(:,s)= (1-s/num_run)* theta_a+ s/num_run* theta_b;
end

z=size(theta);
out=zeros(1,z(2));
out2=zeros(1,z(2));
r=r_robot;
% for k=1:z(2)
% t2= expm(scr(S(:,1))* theta(1,k));
% t3= t2* expm(scr(S(:,2))* theta(2,k));
% t4= t3* expm(scr(S(:,3))* theta(3,k));
% t5= t4* expm(scr(S(:,4))* theta(4,k));
% t6= t5* expm(scr(S(:,5))* theta(5,k));
% % t7= t6* expm(scr(S(:,6))* theta(6,k));

for k=1:z(2)
    t(:,:,1)= expm(scr(S(:,1))* theta(1,k));
    for j=2:size_theta
        t(:,:,j)= t(:,:,j-1)*expm(scr(S(:,j))* theta(j,k));
    end


p= [p_robot(1:3,:) ; ones(1,size_theta+2)];

q=zeros(4,z(1)+2);
q(:,1)= p(:,1) ;
q(:,2)= p(:,2);
for j=1:size_theta
    temp2=t(:,:,j);
    q(:,j+2)= temp2*p(:,j+2);
end
% q(:,1)= p(:,1) ;
% q(:,2)= p(:,2);
% temp2=t(:,:,1);
% q(:,3)= t2* p(:,3);
% q(:,4)= t3* p(:,4);
% q(:,5)= t4* p(:,5);
% q(:,6)= t5* p(:,6);
% q(:,7)= t6* p(:,7);
% q(:,8)= t7* p(:,7);
flag=0;
p0= q(1:3,:);
for i=1:(z(1)+2)
    if (flag==1)
        break;
    end
    for j=(i+1):(z(1)+2)
        
        v1= p0(:,j)-p0(:,i);
        n=norm(v1);
%         disp(n);
        if n< (2*r)
            flag=1;
            out(1,k)=1;
            break;
       
        end
        
    end
end


so= size(r_obstacle);
size_o=so(2);
flag2=0;
for m=1:size_o
    if (flag2==1)
        
        break;
    end
    for i= 1:(z(1)+2)
        v1= p_obstacle(:,m)-p0(:,i);
        n=norm(v1);
%         disp(n);
%         disp(r+ r_obstacle(m));
        if n< (r+ r_obstacle(m))
            flag2=1;
            out2(1,k)=flag2;
            break;
       
        end
    end
end

% disp(flag);

end
for s=1:num_run
    if out(s)==1
        path_c(path)=s/num_run;
        break;
    end
    if out2(s)==1
        path_c(path)=s/num_run;
        break;
    end
end
% disp(out);
% disp(out2);
end
p_sum= sum(path_c);
if p_sum==0
    path_ret=0;
else
    path_ret=1;
end
end