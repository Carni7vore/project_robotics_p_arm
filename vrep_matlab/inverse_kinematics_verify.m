function inverse_kinematics_verify()
disp('Program started');
    % vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
    vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
    vrep.simxFinish(-1); % just in case, close all opened connections
    clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

    if (clientID>-1)
        disp('Connected to remote API server');
            
    opMode=vrep.simx_opmode_blocking;
    [res,t1]= vrep.simxGetObjectHandle(clientID,'Test1',opMode);
    pause(1);
    if (res==vrep.simx_return_ok)
%             fprintf('Position %d %d %d\n',x1,y1,z1);
        fprintf('ok\n');
    else
            fprintf('Remote API function call returned with error code: %d\n',res);
    end
    
    [res,position1]=vrep.simxGetObjectPosition(clientID,t1,-1,vrep.simx_opmode_blocking);
    [res,ori1]=vrep.simxGetObjectOrientation(clientID,t1,-1,opMode);
    ori1=real(double(ori1));
    disp(ori1);
    rot_mat1= eul2rotm(ori1);
    disp(rot_mat1);
    pause(1);
    
    [res,t2]= vrep.simxGetObjectHandle(clientID,'Test2',opMode);
    [res,ori2]=vrep.simxGetObjectOrientation(clientID,t2,-1,opMode);
    ori2=real(double(ori2));
    rot_mat2= eul2rotm(ori2);
    disp(rot_mat2);
    [res,position2]=vrep.simxGetObjectPosition(clientID,t2,-1,vrep.simx_opmode_blocking);
    
     [res,t3]= vrep.simxGetObjectHandle(clientID,'Test3',opMode);
     [res,ori3]=vrep.simxGetObjectOrientation(clientID,t3,-1,opMode);
    ori3=real(double(ori3));
    rot_mat3= eul2rotm(ori3);
    disp(rot_mat3);
    [res,position3]=vrep.simxGetObjectPosition(clientID,t3,-1,vrep.simx_opmode_blocking);
    
    [res,t4]= vrep.simxGetObjectHandle(clientID,'Failed',opMode);
     [res,ori4]=vrep.simxGetObjectOrientation(clientID,t4,-1,opMode);
    ori4=real(double(ori4));
    rot_mat4= eul2rotm(ori4);
    disp(rot_mat4);
    [res,position4]=vrep.simxGetObjectPosition(clientID,t4,-1,vrep.simx_opmode_blocking);
    
        [res,t5]= vrep.simxGetObjectHandle(clientID,'Cuboid5',opMode);
     [res,ori5]=vrep.simxGetObjectOrientation(clientID,t5,-1,opMode);
    ori5=real(double(ori5));
    rot_mat5= eul2rotm(ori5);
    disp(rot_mat5);
    [res,position5]=vrep.simxGetObjectPosition(clientID,t5,-1,vrep.simx_opmode_blocking);
    
%      fprintf('position  %d\n',position);
%     if (res==vrep.simx_return_ok)
%             fprintf('position  %d\n',position1);
%     else
%             fprintf('Remote API function call returned with error code: %d\n',res);
%     end
    x1=position1(1);
    y1=position1(2);
    z1=position1(3);
    
    x2=position2(1);
    y2=position2(2);
    z2=position2(3);
    
    x3=position3(1);
    y3=position3(2);
    z3=position3(3);
    
    x4=position4(1);
    y4=position4(2);
    z4=position4(3);
    
    x5=position5(1);
    y5=position5(2);
    z5=position5(3);
    
    T1=[0 0 1 x1;0 1 0 y1; -1 0 0 z1; 0 0 0 1];
    T1(1:3,1:3)=rot_mat1;
    T2=[0 0 1 x2;0 1 0 y2; -1 0 0 z2; 0 0 0 1];
    T2(1:3,1:3)=rot_mat2;
    T3=[0 0 1 x3;0 1 0 y3; -1 0 0 z3; 0 0 0 1];
    T3(1:3,1:3)=rot_mat3;
    
    T4=[0 0 1 x4;0 1 0 y4; -1 0 0 z4; 0 0 0 1];
    T4(1:3,1:3)=rot_mat4;
    
    T5=[1 0 0 x5;0 0 -1 y5; 0 1 0 z5; 0 0 0 1];
   % T5(1:3,1:3)=rot_mat5;
%     theta=[];
    w=zeros(6,4);
    theta1=inverse_kinematics(T1);
%     fprintf('theta %d \n',theta1);
    w(:,1) = theta1;
    theta2=inverse_kinematics(T2);
%     fprintf('theta %d \n',theta2);
    w(:,2)= theta2;
    theta3=inverse_kinematics(T3);
%     fprintf('theta %d \n',theta3);
    w(:,3)= theta3;
    theta4=inverse_kinematics(T4);
%     fprintf('theta %d \n',theta4);
    w(:,4)= theta4;
     theta5=inverse_kinematics(T5);
%     fprintf('theta %d \n',theta4);
    w(:,5)= theta5;
%     [res1,gripper]= vrep.simxGetObjectHandle(clientID,'BaxterGripper',opMode);
     %Get joints
     
        opMode= vrep.simx_opmode_blocking;
        [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
        [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
        [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
        [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
        [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
        [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
        
        for i=1:5
            
        theta= real(single(w(:,i)));
        disp(theta);
        target= forward_kinematics(theta);
        disp(target);
%         fprintf('target position %d \n', target);
%         %Move joints
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
        pause(5);
        end   
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
