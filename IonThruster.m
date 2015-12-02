% This is the 325 project main file
clc

%Parallel Plate Parameter

plateWidth = 1 %1 meter
plateHeight = .005% 5 mm 

%Parallel Plate End

%Constants

q = 1.602*10^-19;%charge of electron
m = 9.109*10^-31;%mass of electron
rocketMass = 2970000;%kilograms
ionRate = 1*10^6;

%End Constants

voltageArray = 1:100;
voltageArray = voltageArray*1000000;

eField = voltageArray/plateHeight;

accelArray = q*eField/m;%Acceleration of electron through plates;

ejectVelocityArray = accelArray*plateWidth;

timeArray = 1:100;

Thrust = 1:100;

for n = 1:100
    if n == 1
        Thrust(n) = ejectVelocityArray(n)*log(rocketMass/(rocketMass - ionRate*m*timeArray(n))); 
    else         
        Thrust(n) = ejectVelocityArray(n)*log((rocketMass - ionRate*m*timeArray(n-1))/(rocketMass - ionRate*m*timeArray(n))); 
    end
end



plot(timeArray, Thrust);