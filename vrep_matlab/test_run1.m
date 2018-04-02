%project test2 
% function test_forward()
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
%         for i=1:10
% %         theta_pre=[2.079189734286514; 1.739129102350332;0.013199939361589;4.271977113818379;-2.633905735447700;2.618685867486841];
% %         theta_box1= theta_pre*180/pi;
%         %No collision
%         j=i-1;
%         theta1=[20;30;40;60;-20;90]+[j*3;j*5; j*5;j*5;j*i;-10*j];
%         theta=theta1/180*pi;
%         pos1=[0.2-0.2*i;3-0.2*i;0];
%         pos=real(pos1);
%         opMode= vrep.simx_opmode_blocking;
%        [res, bill]=vrep.simxGetObjectHandle(clientID,'Bill_goalDummy',opMode);
%         res= vrep.simxSetObjectPosition(clientID,bill,-1,pos,opMode);
%    
%         [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
%         [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
%         [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
%         [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
%         [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
%         [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
%         
% %         
%         res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1), vrep.simx_opmode_streaming);
% %         pause(0.1);
%         res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2), vrep.simx_opmode_streaming);
% %         pause(0.1);
%         res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3), vrep.simx_opmode_streaming);
% %         pause(0.1);
%         res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4), vrep.simx_opmode_streaming);
% %         pause(0.1);
%         res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5), vrep.simx_opmode_streaming);
% %         pause(0.1);
%         res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6), vrep.simx_opmode_streaming);
%        
%         pause(0.5);
%         
%         end
        
        
%         theta = [-3.02930556 0.58947261 1.97579613 -2.14461117 -1.86858315 -3.03772853 -1.25607086 0.00005671 -2.43276750 3.03093879 -0.55450422 1.61419638 -2.90479923; 2.90276242 -1.27704739 2.61679294 1.66600257 0.39139950 -1.33035843 -2.41456999 1.21787876 2.04252215 0.84251475 0.67718025 -2.40541008 -1.64689006; -1.81138142 1.17479655 -2.81591920 1.04792699 -0.60514063 -2.09088939 1.71282459 -2.64127389 0.49293400 -0.25278267 -1.61794170 0.36081734 -1.41044265; 2.70890985 0.76635870 0.98316421 1.45862367 -1.53551669 1.89252628 2.31157095 -3.10118204 1.14741283 1.16205460 1.24637953 -0.96540083 2.90506567; -3.01145309 -1.96393591 0.73271888 2.92509460 0.02208347 -0.65835233 -1.68378131 -2.07163589 2.39515226 2.26924235 -2.17804230 -2.18145516 -2.54801529; -2.18610962 2.34803555 2.10801496 1.73911826 0.07018468 -3.09153809 0.76594287 2.81828819 1.14535972 -1.88385747 2.10316889 1.26568214 -2.40811199];
        opMode= vrep.simx_opmode_blocking;
        pos=zeros(3,12);
        for s=1:12
            str1= 'Cuboid';
            str2= num2str(s-1);
            str3= strcat(str1,str2);
%             disp(str3);
            [res, cube(s)]=vrep.simxGetObjectHandle(clientID,str3,opMode);
            [res,pos(:,s)]= vrep.simxGetObjectPosition(clientID,cube(s),-1,opMode);
%             disp(pos(:,s));
           
        end
        r = 0.05;
        r2= 0.206155;
%         theta(:,1)= [0; 0; 0; 0; 0; 0];
%         theta(:,2)= [pi/2;0; 0;0;0;0];
%         theta=zeros(6,12);
        theta(:,1)= [pi/2;pi/3;0;0;0;0];
        
        theta(:,2)=[(70/180)*pi;(75/180)*pi;(0/180)*pi;0;(0/180)*pi;(0/180)*pi];
        theta(:,3)=[(110/180)*pi;(70/180)*pi;(0/180)*pi;0;(0/180)*pi;(0/180)*pi];
        theta(:,4)=[(90/180)*pi;2.146090925750188;-0.358177205811062;0.152286609802887;-0.5; -1.349130187648943];
        theta(:,5)=[(110/180)*pi;2.146090925750188;-0.358177205811062;0.152286609802887;-0.5; -1.349130187648943];
%         
        theta(:,6)= [-pi/2;pi/3;0;0;0;0];
%         
        theta(:,7)=[-(70/180)*pi;(75/180)*pi;(0/180)*pi;0;(0/180)*pi;(0/180)*pi];
        theta(:,8)=[-(110/180)*pi;(70/180)*pi;(0/180)*pi;0;(0/180)*pi;(0/180)*pi];
        theta(:,9)=[-(90/180)*pi;2.146090925750188;-0.358177205811062;0.152286609802887;-0.5; -1.349130187648943];
        theta(:,10)=[-(110/180)*pi;2.146090925750188;-0.358177205811062;0.152286609802887;-0.5; -1.349130187648943];

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
        
        scr= @(w)[0,-w(3),w(2),w(4);w(3),0,-w(1),w(5);-w(2),w(1),0,w(6);0,0,0,0];

        z=size(theta);
%         disp(z);
        out=zeros(1,z(2));
        out2=zeros(z(2),12);
        out3=zeros(z(2),1);
        for k=1:z(2)
            t2= expm(scr(S(:,1))* theta(1,k));
            t3= t2* expm(scr(S(:,2))* theta(2,k));
            t4= t3* expm(scr(S(:,3))* theta(3,k));
            t5= t4* expm(scr(S(:,4))* theta(4,k));
            t6= t5* expm(scr(S(:,5))* theta(5,k));  
            t7= t6* expm(scr(S(:,6))* theta(6,k));

            p= zeros(4,7);
            p(:,1)=[-0.35;0;0.2138;1];
            p(:,2)=[-0.35;0;0.3625;1];
            p(:,3)=[-0.35;0;0.6525;1];
            p(:,4)=[-0.35;0;0.8172;1];
            p(:,5)=[-0.35;0;0.9625;1];
            p(:,6)=[-0.35;0;1.1027;1];
            p(:,7)=[-0.35;-0.00013;1.2159;1];
            q=zeros(4,7);
            q(:,1)= p(:,1) ;
            q(:,2)= t2* p(:,2);
            q(:,3)= t3* p(:,3);
            q(:,4)= t4* p(:,4);
            q(:,5)= t5* p(:,5);
            q(:,6)= t6* p(:,6);
            q(:,7)= t7* p(:,7);
            flag=0;
            flag2=0;
            p0= [[-0.35;0;0.1115] q(1:3,:)];
%             disp(p0);
%             disp(pos);
%             disp(q);
            for i=1:8
%                 if (flag==1)
%                     break;
%                 end
                for j=(i+1):8

                    v1= p0(:,j)-p0(:,i);
                    n=norm(v1);
%                     disp(n);
                    if n< (2*r)
                        flag=1;
                        break;

                    end

                end
                
            end
                % disp(flag);
                out(1,k)=flag;
            for s=1:12
            if(flag2==1)
                out3(k,1)=1;
                flag2=0;
                break;
            end
                for i=1:8
                        v2=  pos(:,s)-p0(:,i);
                        n2=norm(v2);
                        if n2< (r+r2)
                            flag2=1;
                            disp(n2);
                            break;
                        else
                            flag2=0;
                        end
                end
%                 out2(k,s)=flag2;
            end
        
        end
       
       
%         disp(out);
%          disp(out2);
%          disp(out3);
     %theta1=135;
     %theta2=110;
     %theta3=115;
     %theta4=165;
     %theta5=115;
     %theta6=160;
      theta_new=zeros(6,20);
        for i=1:25
           
            j=i-1;
            temp=[10;30;-40;0;-20;0]+[j*10;-j*6; j*10;-j*10;j*6;-10*j]* (-1).^j;
            theta_new(:,i)=temp/180*pi;
        end
        
       theta(:,11:35)=theta_new(:,1:25);
        for i=1:35
      
        pos1=[0.2-0.2*i;3-0.2*i;0];
        pos=real(pos1);
        opMode= vrep.simx_opmode_blocking;
%        [res, bill]=vrep.simxGetObjectHandle(clientID,'Bill_goalDummy',opMode);
%         res= vrep.simxSetObjectPosition(clientID,bill,-1,pos,opMode);
        [res1,obj1]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint1',opMode);
        [res2,obj2]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint2',opMode);
        [res3,obj3]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint3',opMode);
        [res4,obj4]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint4',opMode);
        [res5,obj5]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint5',opMode);
        [res6,obj6]= vrep.simxGetObjectHandle(clientID,'P_Arm_joint6',opMode);
        theta1=135/180*pi;
        theta2=110/180*pi;
        theta3=115/180*pi;
        theta4=165/180*pi;
        theta5=115/180*pi;
        theta6=160/180*pi;
        if (out3(i,1)==1)
            disp('Collision');
        end
       
        
        if (theta(1,i)>theta1 || theta(1,i)<-theta1 )
            disp('Joint 1 reached limit');
            disp(i);
        end
        
        if (theta(2,i)>theta1 || theta(2,i)<-theta2 )
            disp('Joint 2 reached limit');
            disp(i);
        end
        if (theta(2,i)>theta1 || theta(2,i)<-theta2 )
            disp('Joint 2 reached limit');
            disp(i);
        end
        if (theta(3,i)>theta1 || theta(3,i)<-theta3 )
            disp('Joint 3 reached limit');
            disp(i);
        end
        if (theta(4,i)>theta1 || theta(4,i)<-theta4 )
            disp('Joint 4 reached limit');
            disp(i);
        end
        if (theta(5,i)>theta1 || theta(5,i)<-theta5 )
            disp('Joint 5 reached limit');
            disp(i);
        end
        
        if (theta(6,i)>theta1 || theta(6,i)<-theta6 )
            disp('Joint 6 reached limit');
            disp(i);
        end
        
%         
        res=vrep.simxSetJointTargetPosition(clientID,obj1,theta(1,i), vrep.simx_opmode_streaming);  
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj2,theta(2,i), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj3,theta(3,i), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj4,theta(4,i), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj5,theta(5,i), vrep.simx_opmode_streaming);
        pause(0.1);
        res=vrep.simxSetJointTargetPosition(clientID,obj6,theta(6,i), vrep.simx_opmode_streaming);
        
       pause(2);
        
        end
    
       
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



% end