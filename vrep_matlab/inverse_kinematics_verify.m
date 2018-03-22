function inverse_kinematics_verify()
disp('Program started');
    % vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
    vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
    vrep.simxFinish(-1); % just in case, close all opened connections
    clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

    if (clientID>-1)
        disp('Connected to remote API server');
            
    opMode=vrep.simx_opmode_blocking;
    [res,sphere]= vrep.simxGetObjectHandle(clientID,'Sphere',opMode);
    pause(1);
    if (res==vrep.simx_return_ok)
%             fprintf('Position %d %d %d\n',x1,y1,z1);
        fprintf('ok\n');
    else
            fprintf('Remote API function call returned with error code: %d\n',res);
    end
    
    [res,position]=vrep.simxGetObjectPosition(clientID,sphere,-1,vrep.simx_opmode_blocking);
    pause(1);
%      fprintf('position  %d\n',position);
    if (res==vrep.simx_return_ok)
            fprintf('position  %d\n',position);
    else
            fprintf('Remote API function call returned with error code: %d\n',res);
    end
    x1=position(1);
    y1=position(2);
    z1=position(3);
    
%     x1=0.75;
%     y1=0;
%     z1=0.025;
    T1=[1 0 0 x1; 0 1 0 y1; 0 0 1 z1; 0 0 0 1];
    theta=inverse_kinematics(T1);
    fprintf('theta  %d\n',theta);
    [res1,gripper]= vrep.simxGetObjectHandle(clientID,'BaxterGripper',opMode);
     
        
       %theta 1 
%        theta=[(90/180)*pi;(90/180)*pi;(-90/180)*pi;0;(90/180)*pi;(0/180)*pi];
        
     %Get joints
%         opMode= vrep.simx_opmode_blocking;
%         [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
%         [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
%         [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
%         [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
%         [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
%         [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
%         
%         %Move joints
%         res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1), vrep.simx_opmode_streaming);
%         pause(0.1);
%         res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2), vrep.simx_opmode_streaming);
%         pause(0.1);
%         res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3), vrep.simx_opmode_streaming);
%         pause(0.1);
%         res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4), vrep.simx_opmode_streaming);
%         pause(0.1);
%         res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5), vrep.simx_opmode_streaming);
%         pause(0.1);
%         res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6), vrep.simx_opmode_streaming);
%          pause(3);
%       
%         

        pause(2);
    
       
        % Now send some data to V-REP in a non-blocking fashion:
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



end
