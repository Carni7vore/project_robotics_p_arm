%write num
disp('Program started');
load('thetas.mat')
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
%     pause(0.5)
%     t=zeros(1,1,1);
    initial=zeros(6,1);
    
    for k=10
        
        size_t= size(thetas{k}.p1);
        t=zeros(size_t(1),size_t(2),4);
        v= clock;
        t={};
        a1= floor(v(4)/10);
        a2= mod(v(4),10);
        a3= floor(v(5)/10);
        a4= mod(v(4),10);
        if (a1==0)
            a1=10;
        end
        if (a2==0)
            a2=10;
        end
        if (a3==0)
            a3=10;
        end
        if (a4==0)
            a4=10;
        end
        t{1}= thetas{a1}.p1;
        t{2}= thetas{a2}.p2;
        t{3}= thetas{a3}.p3;
        t{4}= thetas{a4}.p4;
        for j=1:4   
            
            theta0= t{j};
            path=Final_path_planning(initial,theta0(1:6,1));
            tempi=size(path);
            for i=1:tempi(2)
                  res=vrep.simxSetJointTargetPosition(clientID,obj1,path(1,i), vrep.simx_opmode_blocking);   
                res=vrep.simxSetJointTargetPosition(clientID,obj2,path(2,i), vrep.simx_opmode_blocking);   
                res=vrep.simxSetJointTargetPosition(clientID,obj3,path(3,i), vrep.simx_opmode_blocking);  
                res=vrep.simxSetJointTargetPosition(clientID,obj4,path(4,i), vrep.simx_opmode_blocking);
                res=vrep.simxSetJointTargetPosition(clientID,obj5,path(5,i), vrep.simx_opmode_blocking);
                res=vrep.simxSetJointTargetPosition(clientID,obj6,path(6,i), vrep.simx_opmode_blocking);
                pause(1);
            end
            
                
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
            initial=theta0(1:6,length);
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
% a.p1=THETA7{1};
% a.p2=THETA7{2};
% a.p3=THETA7{3};
% a.p4=THETA7{4};
% thetas{7}=a;