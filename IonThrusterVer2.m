% Ion Thruster Project for ECE325
%
% Group Members:
%   Scott McCarney
%   Wilson Guo
%   John Buccilli
%   Alexandre Tessier
%
% Works Cited: 
%   http://ngpdlab.engin.umich.edu/electric-propulsion/field-emission-electric-propulsion
%   http://descanso.jpl.nasa.gov/SciTechBook/series1/Goebel__cmprsd_opt.pdf

clc

%Constants

q = 1.602*10^-19;       %charge of electron
m = 9.109*10^-31;       %mass of electron
CsMass = 2.2085*10^-25; %mass of Cesium
rocketMass = 2000;      %kilograms
ionFlowRate = 10000;    %ion/sec
impulseTime = 12000;    %Time thruster is active (s)
massOfIon = 1*10^-5;    %kg/ion
fuelMass = 0.2;         %200 g of fuel
flowRateKgS = fuelMass / impulseTime;  % 200 g fuel over impulse Time
massOverTime = ionFlowRate*massOfIon;

%End Constants

%Array
timeArray = 1:impulseTime;      %1:100
voltageArray = 1:impulseTime;   %1:100
voltageArray = 1*10^6*voltageArray;%millions
ThrustTime = 1:impulseTime;     %1:100
ThrustVoltage = 1:impulseTime;  %1:100

for n = 1:impulseTime;      %1:100
    if n == 1
        %ThrustTime(n) = m*sqrt(2*q*ionFlowRate/m)*log((rocketMass)/(rocketMass - massOverTime*timeArray(n))); 
        ThrustTime(n) = flowRateKgS*sqrt(2*q*ionFlowRate/CsMass)*log((rocketMass)/(rocketMass - massOverTime*timeArray(n))); 
    else
        %ThrustTime(n) = m*sqrt(2*q*ionFlowRate/m)*log((rocketMass - massOverTime*timeArray(n-1))/(rocketMass - massOverTime*timeArray(n)));
        ThrustTime(n) = flowRateKgS*sqrt(2*q*ionFlowRate/CsMass)*log((rocketMass - massOverTime*timeArray(n-1))/(rocketMass - massOverTime*timeArray(n)));
    end
end

for n = 1:impulseTime;      %1:100
    if n == 1
        %ThrustVoltage(n) = m*sqrt(2*q*voltageArray(n)/m)*log((rocketMass)/(rocketMass - massOverTime*timeArray(1)));
        ThrustVoltage(n) = flowRateKgS*sqrt(2*q*voltageArray(n)/CsMass)*log((rocketMass)/(rocketMass - massOverTime*timeArray(1))); 
    else
        %ThrustVoltage(n) = m*sqrt(2*q*voltageArray(n)/m)*log((rocketMass - massOverTime*timeArray(1))/(rocketMass - massOverTime*timeArray(2)));
        ThrustVoltage(n) = flowRateKgS*sqrt(2*q*voltageArray(n)/CsMass)*log((rocketMass - massOverTime*timeArray(1))/(rocketMass - massOverTime*timeArray(2)));
    end
end

figure
subplot(2, 1, 1);
plot(timeArray, ThrustTime);
title('Thrust Vs Time');
xlabel('Time(s)');
ylabel('Thrust(N)');
subplot(2, 1, 2);
plot(voltageArray, ThrustVoltage);
title('Thrust Vs Voltage');
xlabel('Voltage(V)');
ylabel('Thrust(N)');