%write num
disp('Program started');
load('3.mat');
% vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
x1=-0.7;
y1=-0.335;
z1=0.85;
% theta0= THETA{1};
% temp=size(theta0);
% length= temp(2);

if (clientID>-1)
    disp('Connected to remote API server');

    opMode= vrep.simx_opmode_blocking;
    [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
    [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
    [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
    [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
    [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
    [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
    pause(0.5);
    for k=1:4
        theta0= THETA3{k};
        temp=size(theta0);
        length= temp(2);
    for i=1:length
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta0(1,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta0(2,i), vrep.simx_opmode_blocking);   
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta0(3,i), vrep.simx_opmode_blocking);  
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta0(4,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta0(5,i), vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta0(6,i), vrep.simx_opmode_blocking);
        pause(0.2);
    end
    end
    vrep.simxAddStatusbarMessage(clientID,'Hello V-REP!',vrep.simx_opmode_oneshot);

    % Before closing the connection to V-REP, make sure that the last command sent out had time to arrive. You can guarantee this with (for example):
    vrep.simxGetPingTime(clientID);

    % Now close the connection to V-REP:    
    vrep.simxFinish(clientID);

else
    disp('Failed connecting to remote API server');
end
vrep.delete(); % call the destructor!


disp('Program ended');