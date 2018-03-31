%project test2 
function test_forward()
    disp('Program started');
    % vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
    vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
    vrep.simxFinish(-1); % just in case, close all opened connections
    clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

    if (clientID>-1)
        disp('Connected to remote API server');
            
        % Now try to retrieve data in a blocking fashion (i.e. a service call):
     %theta1=135;
     %theta2=110;
     %theta3=115;
     %theta4=165;
     %theta5=115;
     %theta6=160;
        for i=1:20
            
     
            theta1=[20+i*3;30-i*5; 0+i*5;-100+i*5;6*i-50;90-10*i];
        theta=theta1/180*pi;
        pos1=[0.2-0.2*i;3-0.2*i;0];
        pos=real(pos1);
        opMode= vrep.simx_opmode_blocking;
       [res, bill]=vrep.simxGetObjectHandle(clientID,'Bill_goalDummy',opMode);
        res= vrep.simxSetObjectPosition(clientID,bill,-1,pos,opMode);
        
       
        
        
%         [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',vrep.simx_opmode_blocking);
        [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
        [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
        [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
        [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
        [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
        [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
        
        
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1), vrep.simx_opmode_streaming);
%         pause(1);
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2), vrep.simx_opmode_streaming);
%         pause(1);
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3), vrep.simx_opmode_streaming);
%         pause(1);
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4), vrep.simx_opmode_streaming);
%         pause(1);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5), vrep.simx_opmode_streaming);
%         pause(1);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6), vrep.simx_opmode_streaming);
        disp(theta1);
        pause(2);
        
        end
        
%         if (res==vrep.simx_return_ok)
%             fprintf('%d',theta(1));
%          else
%             fprintf('Remote API function call returned with error code: %d\n',res);
%          end
%         for i=1:6
%             
% %             res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(i), opMode);
%             pause(2);
%             if (res==vrep.simx_return_ok)
%                 fprintf('%d',theta(i));
%             else
%                 fprintf('Remote API function call returned with error code: %d\n',res);
%             end
%         end
      
%         opMode=vrep.simx_opmode_blocking;
%          
%     
    
       
        % Now send some data to V-REP in a non-blocking fashion:
%         vrep.simxAddStatusbarMessage(clientID,'Hello V-REP!',vrep.simx_opmode_oneshot);

        % Before closing the connection to V-REP, make sure that the last command sent out had time to arrive. You can guarantee this with (for example):
%         vrep.simxGetPingTime(clientID);

        % Now close the connection to V-REP:    
        vrep.simxFinish(clientID);
    else
        disp('Failed connecting to remote API server');
    end
    vrep.delete(); % call the destructor!
    
    disp('Program ended');



end