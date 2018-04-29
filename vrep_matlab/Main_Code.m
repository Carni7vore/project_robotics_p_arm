while 1

Judge=input('What can i do for you?\n','s');
work1=norm(strfind(Judge, 'time'));
work2=norm(str2num(Judge));

% A=isstrprop(Judge,'digit');
% B=str(A);
% C=str2num(B)
count=1;

if count~=1
    
end


    if work1~=0
    write_num;
    end
    
    if work2~=0
            calculation_final(str2num(Judge));
    end
    
    count=count+1;
    
end