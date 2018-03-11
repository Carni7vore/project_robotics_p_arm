% Make sure to have the server side running in V-REP: 
% in a child script of a V-REP scene, add following command
% to be executed just once, at simulation start:
%
% simRemoteApi.start(19999)
%
% then start simulation, and run this program.
%
% IMPORTANT: for each successful call to simxStart, there
% should be a corresponding call to simxFinish at the end!

function simpleTest()
    disp('Program started');
    % vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
    vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
    vrep.simxFinish(-1); % just in case, close all opened connections
    clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

    if (clientID>-1)
        disp('Connected to remote API server');
            
        % Now try to retrieve data in a blocking fashion (i.e. a service call):
        
        
        theta=[(90/180)*pi;0;0;0;0;0];
        
        
        
       
        
       
        [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',vrep.simx_opmode_blocking);
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1), vrep.simx_opmode_streaming);
          pause(1);
        if (res==vrep.simx_return_ok)
            fprintf('%d',theta(1));
         else
            fprintf('Remote API function call returned with error code: %d\n',res);
         end
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
        pause(2);
        opMode=vrep.simx_opmode_blocking;
         
        [res,objs]=vrep.simxGetObjects(clientID,vrep.sim_handle_all,vrep.simx_opmode_blocking);
        [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
        [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
        [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
        [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
        [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
        [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
        [res,angle1]=vrep.simxGetJointPosition(clientID,obj1, opMode);
        [res,angle2]=vrep.simxGetJointPosition(clientID,obj2, opMode);
        [res,angle3]=vrep.simxGetJointPosition(clientID,obj3, opMode);
        [res,angle4]=vrep.simxGetJointPosition(clientID,obj4, opMode);
        [res,angle5]=vrep.simxGetJointPosition(clientID,obj5, opMode);
        [res,angle6]=vrep.simxGetJointPosition(clientID,obj6, opMode);
        theta(1)=angle1;
        theta(2)= angle2;
        theta(3)=angle3;
        theta(4)= angle4;
        theta(5)=angle5;
        theta(6)=angle6;
%         jointHandles[i]=sim.getObjectHandle('P_Arm_joint'..i)
        if (res==vrep.simx_return_ok)
            fprintf('Angles %d\n',theta);
        else
            fprintf('Remote API function call returned with error code: %d\n',res);
        end
            
        pause(2);
    
        % Now retrieve streaming data (i.e. in a non-blocking fashion):
%         t=clock;
%         startTime=t(6);
%         currentTime=t(6);
%         vrep.simxGetIntegerParameter(clientID,vrep.sim_intparam_mouse_x,vrep.simx_opmode_streaming); % Initialize streaming
%         
%         while (currentTime-startTime < 5) 
%              theta=[];
%             opMode=vrep.simx_opmode_blocking;
%             [returnCode,data]=vrep.simxGetIntegerParameter(clientID,vrep.sim_intparam_mouse_x,vrep.simx_opmode_buffer); % Try to retrieve the streamed data
%              [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
%             [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
%             [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
%             [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
%             [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
%             [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
%             [res,angle1]=vrep.simxGetJointPosition(clientID,obj1, opMode);
%             [res,angle2]=vrep.simxGetJointPosition(clientID,obj2, opMode);
%             [res,angle3]=vrep.simxGetJointPosition(clientID,obj3, opMode);
%             [res,angle4]=vrep.simxGetJointPosition(clientID,obj4, opMode);
%             [res,angle5]=vrep.simxGetJointPosition(clientID,obj5, opMode);
%             [res,angle6]=vrep.simxGetJointPosition(clientID,obj6, opMode);
%             theta(1)=angle1;
%             theta(2)= angle2;
%             theta(3)=angle3;
%             theta(4)= angle4;
%             theta(5)=angle5;
%             theta(6)=angle6;
%             if (returnCode==vrep.simx_return_ok) % After initialization of streaming, it will take a few ms before the first value arrives, so check the return code
%                 fprintf('theta: %d\n',theta); % Mouse position x is actualized when the cursor is over V-REP's window
%             end
%             t=clock;
%             currentTime=t(6);
%         end
%             
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
