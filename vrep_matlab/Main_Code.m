Judge=input('What can i do for you?','s');
work1=norm(findstr(Judge, 'the'));


% A=isstrprop(Judge,'digit');
% B=str(A);
% C=str2num(B)

if work1==0
    disp('Program ended');
    break
end