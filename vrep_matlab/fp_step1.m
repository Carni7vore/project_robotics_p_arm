%final project step 1
disp('Program started');
% vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
    disp('Connected to remote API server');

    opMode= vrep.simx_opmode_blocking;
    [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
    [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
    [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
    [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
    [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
    [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
    
    x1=0.7436;
    y1=0.05;
    z1=0.7436;
    T1=[0 1 0 x1;0 0 1 y1; -1 0 0 z1; 0 0 0 1];
    theta1=inverse_kinematics(T1);
    theta= real(single(theta1));
    disp(theta);
    
    res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1), vrep.simx_opmode_blocking);
    pause(1);
    res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2), vrep.simx_opmode_blocking);
    pause(1);
    res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3), vrep.simx_opmode_blocking);
    pause(1);
    res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4), vrep.simx_opmode_blocking);
    pause(1);
    res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5), vrep.simx_opmode_blocking);
    pause(1);
    res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6), vrep.simx_opmode_blocking);
    pause(2);
    
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