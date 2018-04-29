%path_planning

%hw5_3
function ret=Final_path_planning(theta_start,theta_goal) 
% S = [0.00 0.00 0.00 0.00 0.00; -1.00 0.00 0.00 0.00 0.00; 0.00 0.00 -1.00 -1.00 0.00; 0.00 0.00 2.00 4.00 0.00; 0.00 0.00 -2.00 -2.00 0.00; 4.00 -1.00 0.00 0.00 -1.00];
% M = [0.00 0.00 -1.00 0.00; 0.00 -1.00 0.00 -6.00; -1.00 0.00 0.00 0.00; 0.00 0.00 0.00 1.00];
% p_robot = [0.00 -4.00 -4.00 -2.00 -2.00 0.00 0.00; 0.00 0.00 -2.00 -2.00 -4.00 -4.00 -6.00; 0.00 0.00 0.00 0.00 0.00 0.00 0.00];
% r_robot = [0.90 0.90 0.90 0.90 0.90 0.90 0.90];
% p_obstacle = [-0.35 -2.51 2.52 1.49 2.82 3.87 3.73 3.99 3.51 -4.82 3.53 1.47 4.06 -1.08 -3.94; 3.49 4.09 -0.81 2.87 -0.17 -2.03 -1.57 -0.40 -0.49 4.18 -3.43 -4.84 3.04 0.98 4.77; -4.84 -2.28 3.43 4.91 4.08 0.22 1.76 -3.87 0.28 1.30 -1.66 -2.64 -4.20 4.94 1.59];
% r_obstacle = [2.34 2.54 1.23 0.68 2.10 1.58 2.02 3.10 0.67 2.32 1.60 0.51 4.66 1.86 1.36];
% theta_start = [-1.07; -1.83; -1.55; 1.76; 1.76];
% theta_goal = [1.03; -1.27; -1.45; 2.17; -2.50];

temp1= size(theta_start);
size_theta=temp1(1);
a.theta=theta_start;
a.parent=0;
T_f{1}=a;

b.theta=theta_goal;
b.parent=0;
T_b{1}=b ;

count=0;
n=150;
S=[  0            0            0            0            0            0;
            0           -1           -1            0           -1            0;
            1            0            0            1            0            1;
            0       0.3625       0.6525            0       0.9625            0;
         0.35            0            0         0.35            0         0.35;
            0         0.35         0.35            0         0.35            0];
p= zeros(3,8);
p(:,1)=[-0.35;0;0.1115];
p(:,2)=[-0.35;0;0.2138];
p(:,3)=[-0.35;0;0.3625];
p(:,4)=[-0.35;0;0.6525];
p(:,5)=[-0.35;0;0.8172];
p(:,6)=[-0.35;0;0.9625];
p(:,7)=[-0.35;0;1.2552];
p(:,8)=[-0.35;-0.00013;1.2552];
r_robot=0.05;
while count<n
   
    disp(count);
    theta1=  1*pi/2*(rand(size_theta,1)*2-ones(size_theta,1));
    flag1=0;
    flag2=0;
    %Forward
    size_f= size(T_f);
    size_b= size(T_b);
    fp=1;
    temp= T_f{1}.theta;
    norm1= norm(theta1-temp);
    for i=1:size_f(2)
        temp= T_f{i}.theta;
        n1= norm(theta1-temp);
        if(n1<norm1)
            norm1=n1;
            fp=i;
        end
    end
    theta_a= T_f{fp}.theta;
    theta_b= theta1;
    path_ret= Final_collision_detection(S,p,r_robot,theta_a,theta_b);
    if path_ret==0
        a.theta= theta1;
        a.parent=fp;
        T_f{end+1}=a;
        flag1=1;
    end
    
    %Backward
    bp=1;
    temp= T_b{1}.theta;
    norm2= norm(theta1-temp);
    for i=1:size_b(2)
        temp= T_b{i}.theta;
        n1= norm(theta1-temp);
        if(n1<norm2)
            bp=i;
            norm2=n1;
        end
    end
    theta_a2= theta1;
    theta_b2= T_b{bp}.theta;
    
    
    path_ret= Final_collision_detection(S,p,r_robot,theta_a2,theta_b2);
    if path_ret==0
        b.theta= theta1;
        b.parent=bp;
        T_b{end+1}=b;
        flag2=1;
    end
    
    if (flag1 && flag2)
        a= T_f{end};
        b= T_b{end};
        p1= a.parent;
        p2= b.parent;
        i=1;
        forward_list=zeros(1,1);
        backward_list=zeros(1,1);
        while (p1~=0)
            forward_list(i)=p1;
            a= T_f{p1};
            p1=a.parent;
            i=i+1;
        end
        j=1;
        while (p2~=0)
            backward_list(j)=p2;
            b= T_b{p2};
            p2=b.parent;
            j=j+1;
        end
       
        break;
    end
        
    count=count+1; 
    

    
    
    
end
    sz1= size(forward_list);
    sz2= size(backward_list);
    ret=zeros(size_theta,sz1(2)+sz2(2)+1);
    for i=1:sz1(2)
        t1= forward_list(sz1(2)+1-i);
        ret(:,i)= T_f{t1}.theta;
    end
    ret(:,sz1(2)+1)= T_f{end}.theta;
    for i=1:sz2(2)
        t2= backward_list(i);
        ret(:,i+sz1(2)+1)= T_b{t2}.theta;
    end
    
   
