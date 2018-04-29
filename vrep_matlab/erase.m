function erase()
% disp('Program started');
% vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
% disp('Connected to remote API server');
opMode= vrep.simx_opmode_blocking;
vrep.simxCallScriptFunction(clientID, 'feltPen', vrep.sim_scripttype_childscript, 'removeAllDrawingObjects', [], [], [], [], opMode);
else
%     disp('Failed connecting to remote API server');
end
vrep.delete(); % call the destructor!

% disp('Program ended');


end