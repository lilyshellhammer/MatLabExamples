%Lily Shellhammer
%This program calculates pi using two different series functions. Then it
%compares the calculated pi to MATLAB's pi definition
clear
clc

%EQUATION 1: pi = 4/1 - 4/3 + 4/5 - 4/7 ...
%set our pi=0, flag=0 to start add the next term (when flag==1, subtract
%next term), i = 1 to start iterations, and k=0 to start while loop
pie1 = 0;
flag = 0;
i = 1;
k = 0;
count1 = 0;
while(k == 0)  %until condition met
    if (flag == 1)
        pie1 = pie1 - 4/(i); %subtraction of next term
        flag = 0;
    elseif(flag == 0)
        pie1 = pie1 + 4/(i); %addition of next term
        flag = 1;
    end
    i = i+2;
    if(abs(pie1-pi) < 0.00001) %condition is our value is within 1e-5 of MATLAB?s value of pi 
        k = 1;                 %this sets k=1 to end while loop
    end
    count1 = count1+1;
end

%EQUATION 1: pi = 3+ 4/(2*3*4) - 4/(4*5*6) + 4/(6*7*8) ...
%set our pi=0, flag=0 to start add the next term (when flag==1, subtract
%next term), i = 1 to start iterations, and k=0 to start while loop
k = 0;
i = 2;
pie2 = 3;
flag = 1;
count2 = 0;
while(k == 0)  %until condition met
    if(flag == 1) %addition of next term
        pie2 = pie2 + 4/(i*(i+1)*(i+2));
        flag = 0;
    elseif(flag == 0) %subtraction of next term
        pie2 = pie2 - 4/(i*(i+1)*(i+2));
        flag = 1;
    end
    i = i + 2;
    if(abs(pie2-pi) < 0.00001) %condition is our value is within 1e-5 of MATLAB?s value of pi 
        k = 1;                 %this sets k=1 to end while loop
    end
    count2 = count2+1;
end

%print results comparing my pi's to MATLAB's pi
fprintf('My pi version 2: %0.12f, MATLAB pi: %0.12f\n', pie1,pi)
fprintf('My pi version 2: %0.12f, MATLAB pi: %0.12f\n', pie2,pi)