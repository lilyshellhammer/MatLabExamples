%Lily Shellhammer
%Write a program that continuously asks the user if they want to 
%compute total mortgage interest, total mortgage cost, or stop
clear
clc

%set flag to false to start while loop
flag = false;
%while loop runs program until user tells it to stop
while(flag == false)
    %menu selection: 1)total morgage interest, 1)total morgage cost
    in = input('Do you want to computer total mortgage interest (0), total mortgage cost (1), or stop (2)?');
    if in~=2
        I = input('Enter interest rate (I): '); %user enters interest rate
        n = [15 20 30]; %pay periods 
        P = 100000;
    end
    %if user chooses to run program with values
    if in==0 || in==1
        M = (P.*(I.*(1+I).^n))/((1+I).^n-1);
        T = M.*n*12;
        if in == 1  %if user chose 1, print total morage cost
            for k=1:3  %print morgage cost for each value in array
                fprintf('Total mortgage cost for %0.0f years is: %0.2f\n', n(k), T(k));
            end
        elseif in==0  %else if user chose 0, compute total morgage interest
            for i=1:3 %for loop to print values for each n value
             Tcm = T(i)-P;
             fprintf('Total mortgage interest is %0.3f for %0.0f years, interest rate %0.1f\n', Tcm, n(i), I);
            end
        end
    elseif in==2
        fprintf('Done.');
        flag = true;
    else
        fprintf('Invalid input, try again.\n');
    end
end