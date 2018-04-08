

%project test2 
function forward_kinematics_verify()
disp('Program started');
    % vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
    vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
    vrep.simxFinish(-1); % just in case, close all opened connections
    clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

    if (clientID>-1)
        disp('Connected to remote API server');
            
      
            
         %   [res,pos(:,s)]= vrep.simxGetObjectPosition(clientID,cube(s),-1,opMode);
               
         distance=3;
           opMode= vrep.simx_opmode_blocking;
%         [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',vrep.simx_opmode_blocking);
        [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
        [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
        [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
        [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
        [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
        [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
    while  distance>2
                  theta=[(0)*pi;(100/180)*pi;(0/180)*pi;0;(0/180)*pi;(0/180)*pi];
                  theta_goal=theta;
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6), vrep.simx_opmode_streaming);
        pause(0.1);
        
         opMode= vrep.simx_opmode_blocking;
%         [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',vrep.simx_opmode_blocking);
        [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
        [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
        [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
        [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
        [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
        [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
        
              theta=[(0/180)*pi;(20/180)*pi;(10/180)*pi;0;(0/180)*pi;(0/180)*pi];
              theta_start=theta;
 
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6), vrep.simx_opmode_streaming);
        pause(0.1);
          opMode= vrep.simx_opmode_blocking;
%         [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',vrep.simx_opmode_blocking);
        [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
        [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
        [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
        [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
        [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
        [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
        [res,position1]=vrep.simxGetObjectPosition(clientID,obj6,-1,opMode)
        
        [res, bill]=vrep.simxGetObjectHandle(clientID,'Helicopter_frontCamera',opMode);
        [res,position2]=vrep.simxGetObjectPosition(clientID,bill,-1,opMode)
     
      
    
  
       
       
       distance=norm(position1-position2);
       
distance
    end
    

          opMode= vrep.simx_opmode_blocking;
%         [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',vrep.simx_opmode_blocking);
        [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
        [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
        [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
        [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
        [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
        [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);

 theta=[(0)*pi;(0/180)*pi;(0/180)*pi;0;(0/180)*pi;(0/180)*pi];
 
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6), vrep.simx_opmode_streaming);
        

pause(3)

r_robot=0.05;

M=[1 0 0 -0.35;0 1 0 -0.00013;0 0 1 1.2159;0 0 0 1];
A=[0;0;1];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S1=[A;-W*[-0.35;0;0.2138]];

A=[0;-1;0];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S2=[A;-W*[-0.35;0;0.3625]];

A=[0;-1;0];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S3=[A;-W*[-0.35;0;0.6525]];

A=[0;0;1];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S4=[A;-W*[-0.35;0;0.8172]];

A=[0;-1;0];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S5=[A;-W*[-0.35;0;0.9625]];

A=[0;0;1];
a=A(1,1);
b=A(2,1);
c=A(3,1);
W=[0 -c b;c 0 -a;-b a 0];
S6=[A;-W*[-0.35;0;1.1027]];

S=[S1,S2,S3,S4,S5,S6];
p_obstacle=[-0.9202;0.0227;0.75];
r_obstacle=0.4;
TT=path_planning(S,p_obstacle,r_obstacle,theta_start,theta_goal);
n=size(TT,2);
tt=5;
while tt>0

   for i=1:n  
         theta=TT(:,i);
 
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6), vrep.simx_opmode_streaming);
        pause(0.1);
        
         opMode= vrep.simx_opmode_blocking;
%         [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',vrep.simx_opmode_blocking);
        [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
        [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
        [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
        [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
        [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
        [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
   end
        
                 for i=1:n  
         theta=TT(:,n-i+1);
 
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6), vrep.simx_opmode_streaming);
        pause(0.1);
        
         
                end
        
      tt=tt-1;
end
         
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




