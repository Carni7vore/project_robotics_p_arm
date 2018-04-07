theta_new=zeros(6,20);
for i=1:20

    j=i-1;
    
    temp=[20;30;-40;60;-20;90]+2*[j*3;-j*3; j*5;-j*5;j*3;-5*j]* ((-1).^j);
    
    theta_new(:,i)=(temp/180.0)*pi;
    disp(theta_new(:,i));
    
end