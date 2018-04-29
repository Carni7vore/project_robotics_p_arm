% function test_forward()
disp('Program started');
% vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
disp('Connected to remote API server');
opMode= vrep.simx_opmode_blocking;
vrep.simxCallScriptFunction(clientID, 'feltPen', vrep.sim_scripttype_childscript, 'removeAllDrawingObjects', [], [], [], [], opMode);

% [res,Paint]= vrep.simxGetObjectHandle(clientID,'PaintNozzle',opMode);
% position=zeros(3,4);
% x=-0.5;
% y=-0.4;
% z=0.9;
% p= [x,y,z];
% res=vrep.simxSetObjectPosition(clientID,Paint,-1,p,opMode);
% for i=1:180
%     y=y+0.004;
%     position(:,i)= [x;y;z];
%     res=vrep.simxSetObjectPosition(clientID,Paint,-1,position(:,i),opMode);
%     pause(0.1);
% end
% z=0.85;
% for i=1:180
%     y=y-0.004;
%     position(:,i)= [x;y;z];
%     res=vrep.simxSetObjectPosition(clientID,Paint,-1,position(:,i),opMode);
%     pause(0.1);
% end
% 
% 
% y=-0.775
% z=1.26;
% p=[x,y,z];
% res=vrep.simxSetObjectPosition(clientID,Paint,-1,p,opMode);
% pos=zeros(3,5);
% for s=1:5
%     str1= 'Sphere';
%     str2= num2str(s-1);
%     str3= strcat(str1,str2);
% %             disp(str3);
%     [res, sphere(s)]=vrep.simxGetObjectHandle(clientID,str3,opMode);
%     [res,pos(:,s)]= vrep.simxGetObjectPosition(clientID,sphere(s),-1,opMode);
% %             disp(pos(:,s));
% 
% end
% 
% r = 0.1;
% r2= 0.25;
% r_obstacle=ones(5,1)*r2;
% T1= zeros(4,4,3);
% [res,RF1]= vrep.simxGetObjectHandle(clientID,'RF1',opMode);
% [res,RF1_pos]= vrep.simxGetObjectPosition(clientID,RF1,-1,opMode);
% [res,RF1_ori]= vrep.simxGetObjectOrientation(clientID,RF1,-1,opMode);
% ori1=real(double(RF1_ori));
% rot_mat1= eul2rotm(ori1);
% T1(:,:,1)= [rot_mat1(1:3,1:3),RF1_pos';[0 0 0 1]];
% 
% [res,RF2]= vrep.simxGetObjectHandle(clientID,'RF2',opMode);
% [res,RF2_pos]= vrep.simxGetObjectPosition(clientID,RF2,-1,opMode);
% [res,RF2_ori]= vrep.simxGetObjectOrientation(clientID,RF2,-1,opMode);
% ori2=real(double(RF2_ori));
% rot_mat2= eul2rotm(ori2);
% T1(:,:,2)= [rot_mat2(1:3,1:3),RF2_pos';[0 0 0 1]];
% 
% [res,RF3]= vrep.simxGetObjectHandle(clientID,'RF3',opMode);
% [res,RF3_pos]= vrep.simxGetObjectPosition(clientID,RF3,-1,opMode);
% [res,RF3_ori]= vrep.simxGetObjectOrientation(clientID,RF3,-1,opMode);
% ori3=real(double(RF3_ori));
% rot_mat3= eul2rotm(ori3);
% T1(:,:,3)= [rot_mat3(1:3,1:3),RF3_pos';[0 0 0 1]];
% % disp(T1);
% theta_temp=[0;0;0;0;0;0];
% for m=1:3
%     T2= T1(:,:,m);
% [theta0,S]=inverse_kinematics(T2);
% disp(theta0);
% theta_1=real(theta0);
% theta=path_planning(S,pos,r_obstacle,theta_temp,theta_1);
% size1=size(theta);
% 
% disp(theta);
% theta_temp=theta_1;
% for i=1:size1(2)
% opMode= vrep.simx_opmode_blocking;
% [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
% [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
% [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
% [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
% [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
% [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
% 
% theta1=135/180*pi;
% theta2=110/180*pi;
% theta3=115/180*pi;
% theta4=165/180*pi;
% theta5=115/180*pi;
% theta6=160/180*pi;
% 
% if (theta(1,i)>theta1 || theta(1,i)<-theta1 )
%     disp('Joint 1 reached limit');
%     disp(i);
% end
% 
% if (theta(2,i)>theta1 || theta(2,i)<-theta2 )
%     disp('Joint 2 reached limit');
%     disp(i);
% end
% if (theta(2,i)>theta1 || theta(2,i)<-theta2 )
%     disp('Joint 2 reached limit');
%     disp(i);
% end
% if (theta(3,i)>theta1 || theta(3,i)<-theta3 )
%     disp('Joint 3 reached limit');
%     disp(i);
% end
% if (theta(4,i)>theta1 || theta(4,i)<-theta4 )
%     disp('Joint 4 reached limit');
%     disp(i);
% end
% if (theta(5,i)>theta1 || theta(5,i)<-theta5 )
%     disp('Joint 5 reached limit');
%     disp(i);
% end
% 
% if (theta(6,i)>theta1 || theta(6,i)<-theta6 )
%     disp('Joint 6 reached limit');
%     disp(i);
% end
% 
% res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1,i), vrep.simx_opmode_streaming);  
% pause(0.1);
% res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2,i), vrep.simx_opmode_streaming);
% pause(0.1);
% res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3,i), vrep.simx_opmode_streaming);
% pause(0.1);
% res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4,i), vrep.simx_opmode_streaming);
% pause(0.1);
% res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5,i), vrep.simx_opmode_streaming);
% pause(0.1);
% res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6,i), vrep.simx_opmode_streaming);
%         
% pause(2);
% end
% end

else
    disp('Failed connecting to remote API server');
end
vrep.delete(); % call the destructor!

disp('Program ended');

% end