clc

%Constants

q = 1.602*10^-19;%charge of electron
m = 9.109*10^-31;%mass of electron
rocketMass = 2000;%kilograms
ionFlowRate = 10000;%ion/sec
massOfIon = 1*10^-5;%kg/ion
massOverTime = ionFlowRate*massOfIon;

%End Constants

%Array
timeArray = 1:100;
voltageArray = 1:100;
voltageArray = 1*10^6*voltageArray;%millions
ThrustTime = 1:100;
ThrustVoltage = 1:100;

for n = 1:100;
    if n == 1
        ThrustTime(n) = m*sqrt(2*q*10000/m)*log((rocketMass)/(rocketMass - massOverTime*timeArray(n))); 
    else
        ThrustTime(n) = m*sqrt(2*q*10000/m)*log((rocketMass - massOverTime*timeArray(n-1))/(rocketMass - massOverTime*timeArray(n))); 
    end
end

for n = 1:100;
    if n == 1
        ThrustVoltage(n) = m*sqrt(2*q*voltageArray(n)/m)*log((rocketMass)/(rocketMass - massOverTime*timeArray(1))); 
    else
        ThrustVoltage(n) = m*sqrt(2*q*voltageArray(n)/m)*log((rocketMass - massOverTime*timeArray(1))/(rocketMass - massOverTime*timeArray(2))); 
    end
end

figure
plot(timeArray, ThrustTime);
title('Thrust Vs Time');
xlabel('Time(s)');
ylabel('Thrust(N)');
figure
plot(voltageArray, ThrustVoltage);
title('Thrust Vs Voltage');
xlabel('Voltage(s)');
ylabel('Thrust(N)');