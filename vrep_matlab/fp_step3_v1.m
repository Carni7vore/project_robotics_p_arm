%final project step 1


disp('Program started');

% vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
% x1=-0.70;
% y1=0.065;
% z1=0.85;
%pos3
x1=-0.7;
y1=0.3-0.035;
z1=0.85;

if (clientID>-1)
    disp('Connected to remote API server');

    opMode= vrep.simx_opmode_blocking;
    [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
    [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
    [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
    [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
    [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
    [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
    theta0=zeros(6,35);
    
    t=[1 0 0 -0.35;0 1 0 -0.00013;0 0 1 1.2552;0 0 0 1];
    T1=[0 0 -1 x1+0.1;0 1 0 y1; 1 0 0 z1; 0 0 0 1];
    theta1=inverse_kinematics(T1,t);
    theta= real(single(theta1));
    theta0(1:6,1)=theta;
    t=T1;
    i=1;
    res=vrep.simxSetJointTargetPosition(clientID,obj1,theta0(1,i), vrep.simx_opmode_blocking);   
    res=vrep.simxSetJointTargetPosition(clientID,obj2,theta0(2,i), vrep.simx_opmode_blocking);   
    res=vrep.simxSetJointTargetPosition(clientID,obj3,theta0(3,i), vrep.simx_opmode_blocking);  
    res=vrep.simxSetJointTargetPosition(clientID,obj4,theta0(4,i), vrep.simx_opmode_blocking);
    res=vrep.simxSetJointTargetPosition(clientID,obj5,theta0(5,i), vrep.simx_opmode_blocking);
    res=vrep.simxSetJointTargetPosition(clientID,obj6,theta0(6,i), vrep.simx_opmode_blocking);
    pause(0.5);
     x1=-0.7;
    for i=2:10
        y1= y1+0.07/8;
        T1=[0 0 -1 x1;0 1 0 y1; 1 0 0 z1; 0 0 0 1];
        theta1=inverse_kinematics(T1,t);
        theta= real(single(theta1));
        theta0(1:6,i)=theta;
        t=T1;
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta0(1,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta0(2,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta0(3,i), vrep.simx_opmode_blocking);  
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta0(4,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta0(5,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta0(6,i), vrep.simx_opmode_blocking);
    end
    x1=-0.65;
    for i=11:14
        z1=z1-0.15/8;
        T1=[0 0 -1 x1;0 1 0 y1; 1 0 0 z1; 0 0 0 1];
        theta1=inverse_kinematics(T1,t);
        theta= real(single(theta1));
        theta0(1:6,i)=theta;
        t=T1;
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta0(1,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta0(2,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta0(3,i), vrep.simx_opmode_blocking);  
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta0(4,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta0(5,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta0(6,i), vrep.simx_opmode_blocking);
    end
    x1=-0.7;
    for i=15:18
        z1=z1-0.15/8;
        T1=[0 0 -1 x1;0 1 0 y1; 1 0 0 z1; 0 0 0 1];
        theta1=inverse_kinematics(T1,t);
        theta= real(single(theta1));
        theta0(1:6,i)=theta;
        t=T1;
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta0(1,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta0(2,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta0(3,i), vrep.simx_opmode_blocking);  
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta0(4,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta0(5,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta0(6,i), vrep.simx_opmode_blocking);
    end
    
    for i=19:26
        y1= y1-0.07/8;
        T1=[0 0 -1 x1;0 1 0 y1; 1 0 0 z1; 0 0 0 1];
        theta1=inverse_kinematics(T1,t);
        theta= real(single(theta1));
        theta0(1:6,i)=theta;
        t=T1;
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta0(1,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta0(2,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta0(3,i), vrep.simx_opmode_blocking);  
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta0(4,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta0(5,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta0(6,i), vrep.simx_opmode_blocking);
    end
    x1=-0.65;
    for i=27:34
        z1=z1+0.15/8;
        T1=[0 0 -1 x1;0 1 0 y1; 1 0 0 z1; 0 0 0 1];
        theta1=inverse_kinematics(T1,t);
        theta= real(single(theta1));
        theta0(1:6,i)=theta;
        t=T1;
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta0(1,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta0(2,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta0(3,i), vrep.simx_opmode_blocking);  
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta0(4,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta0(5,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta0(6,i), vrep.simx_opmode_blocking);
    end
    x1=-0.7;
     for i=35:38
        z1=z1-0.15/8;
        T1=[0 0 -1 x1;0 1 0 y1; 1 0 0 z1; 0 0 0 1];
        theta1=inverse_kinematics(T1,t);
        theta= real(single(theta1));
        theta0(1:6,i)=theta;
        t=T1;
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta0(1,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta0(2,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta0(3,i), vrep.simx_opmode_blocking);  
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta0(4,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta0(5,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta0(6,i), vrep.simx_opmode_blocking);
    end
    
    for i=39:46
        y1=y1+0.07/8;
        T1=[0 0 -1 x1;0 1 0 y1; 1 0 0 z1; 0 0 0 1];
        theta1=inverse_kinematics(T1,t);
        theta= real(single(theta1));
        theta0(1:6,i)=theta;
        t=T1;
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta0(1,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta0(2,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta0(3,i), vrep.simx_opmode_blocking);  
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta0(4,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta0(5,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta0(6,i), vrep.simx_opmode_blocking);
    end
    i=47;
    T1=[0 0 -1 x1+0.1;0 1 0 y1; 1 0 0 z1; 0 0 0 1];
    theta1=inverse_kinematics(T1,t);
    theta= real(single(theta1));
    theta0(1:6,i)=theta;
    t=T1;
   
    res=vrep.simxSetJointTargetPosition(clientID,obj1,theta0(1,i), vrep.simx_opmode_blocking);   
    res=vrep.simxSetJointTargetPosition(clientID,obj2,theta0(2,i), vrep.simx_opmode_blocking);   
    res=vrep.simxSetJointTargetPosition(clientID,obj3,theta0(3,i), vrep.simx_opmode_blocking);  
    res=vrep.simxSetJointTargetPosition(clientID,obj4,theta0(4,i), vrep.simx_opmode_blocking);
    res=vrep.simxSetJointTargetPosition(clientID,obj5,theta0(5,i), vrep.simx_opmode_blocking);
    res=vrep.simxSetJointTargetPosition(clientID,obj6,theta0(6,i), vrep.simx_opmode_blocking);
    
    
    
    vrep.simxAddStatusbarMessage(clientID,'Hello V-REP!',vrep.simx_opmode_oneshot);

    % Before closing the connection to V-REP, make sure that the last command sent out had time to arrive. You can guarantee this with (for example):
    vrep.simxGetPingTime(clientID);

    % Now close the connection to V-REP:    
    vrep.simxFinish(clientID);

else
    disp('Failed connecting to remote API server');
end
vrep.delete(); % call the destructor!
THETA{1}=theta0;

disp('Program ended');