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

clc         % Clear all variables

%%%%% Parameters %%%%%
ionMassFlowRate = 16.67*10^-6;      % kg/s
ionFlowRate = 7.5480517*10^19       % ions/s
impulseTime = 12000;                % Time thruster is active (s)
CsMass = 2.2085*10^-25;             % Atomic mass of the fuel, Cesium (kg)
FuelMass = 200*10^-3;               % Initial mass of Cesium fuel (kg)
massOfRocket = 5.05*10^3;           % Apollo 13 landing mass: 5,050 kg

% Thrust array that we will plot
Thrust = 1:impulseTime;

%

for n = 1:impulseTime
    if n == 1
        Thrust(n) = ejectVelocityArray(n)*log(rocketMass/(rocketMass - ionRate*m*timeArray(n))); 
    else         
        % Thrust(n) = ejectVelocityArray(n)*log((rocketMass - ionRate*m*timeArray(n-1))/(rocketMass - ionRate*m*timeArray(n))); 
    end
end

% Debugging Stuff
% display(CsMass);

plot(timeArray, Thrust);
