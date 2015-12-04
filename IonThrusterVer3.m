clc
clear all
close all

%Constants
mol = 6.02*10^23; % A's Number atoms/mol
%g/mol
caesiumAtomicMass = 132.9; 
indiumAtomicMass = 114.8;
mercuryAtomicMass = 200.59;

%kg/ions
caesiumIonMass = caesiumAtomicMass/(mol*1000);
indiumIonMass = indiumAtomicMass/(mol*1000);
mercuryIonMass = mercuryAtomicMass/(mol*1000);

fprintf('Caesium Ion Mass = %d | Indium Ion Mass = %d | Mercury Ion Mass = %d \n', caesiumIonMass, indiumIonMass, mercuryIonMass);

%Note Ion if negatively charge have more mass than atoms

q = 1.602*10^-19;%charge of electron || Assumed
rocketMass = 1999.8;%kilograms
fuelMass = .2;%kilograms
totalMass = rocketMass + fuelMass;
ionFlowRate = 1*10^10;%(atom/ion)/sec  || Assumed
speedOfLight = 3*10^8;
Voltage = 10000;

%End Constants

ionVelocity = 1:3; %[Caesium, Indium, Mercury]
ionVelocity(1) = sqrt(2*q*Voltage/caesiumIonMass);
ionVelocity(2) = sqrt(2*q*Voltage/indiumIonMass);
ionVelocity(3) = sqrt(2*q*Voltage/mercuryIonMass);

fprintf('Caesium Velocity = %d | Indium Velocity = %d | Mercury Velocity = %d', ionVelocity(1), ionVelocity(2), ionVelocity(3));


%Array
timeArray = 1:100;
voltageArray = 1:100;
voltageArray = 1*10^4*voltageArray;%starting from 10kV to 1MV

ThrustTimeCaesium = 1:100;
velTimeCaesium = 1:100;
ThrustVoltageCaesium = 1:100;
accelTimeCaesium = 1:100;
ThrustTimeCaesiumdt = 1:100;



ThrustTimeIndium = 1:100;
velTimeIndium = 1:100;
ThrustVoltageIndium = 1:100;
accelTimeIndium = 1:100;
ThrustTimeIndiumdt = 1:100;


ThrustTimeMercury = 1:100;
velTimeMercury = 1:100;
ThrustVoltageMercury = 1:100;
accelTimeMercury = 1:100;
ThrustTimeMercurydt = 1:100;


%Speed of Light
ThrustTimeCaesiumC = 1:100;
ThrustVoltageCaesiumC = 1:000;
accelTimeCaesiumC = 1:100;

ThrustTimeIndiumC = 1:100;
ThrustVoltageIndiumC = 1:100;
accelTimeIndiumC = 1:100;

ThrustTimeMercuryC = 1:100;
ThrustVoltageMercuryC = 1:100;
accelTimeMercuryC = 1:100;

k = 1;

for j = 1:15;   
   
    if j == 1 
        ionFlowRate = 1*10^9;
    elseif j ==2
        ionFlowRate = 1*10^10;
    elseif j == 3
        ionFlowRate = 1*10^11;
    elseif j == 4
        ionFlowRate = 1*10^12;
    elseif j == 5
        ionFlowRate = 1*10^13;
    elseif j == 6
        ionFlowRate = 1*10^14;
    elseif j == 7
        ionFlowRate = 1*10^15;
    elseif j == 8
        ionFlowRate = 1*10^16;
    elseif j == 9
        ionFlowRate = 1*10^17;
    elseif j == 10
        ionFlowRate = 1*10^18;
    elseif j == 11
        ionFlowRate = 1*10^19;
    elseif j == 12
        ionFlowRate = 1*10^20;
    elseif j == 13
        ionFlowRate = 1*10^21;
    elseif j == 14
        ionFlowRate = 1*10^22;
    else
        ionFlowRate = 1*10^23;
    end
    
for n = 1:100;
    if n == 1
        velTimeCaesium(n) = sqrt(2*q*Voltage/caesiumIonMass)*log((totalMass)/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n)));
        velTimeIndium(n) = sqrt(2*q*Voltage/indiumIonMass)*log((totalMass)/(totalMass - ionFlowRate*indiumIonMass*timeArray(n)));
        velTimeMercury(n) = sqrt(2*q*Voltage/mercuryIonMass)*log((totalMass)/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n)));
        
    else
        velTimeCaesium(n) = sqrt(2*q*Voltage/caesiumIonMass)*log((totalMass)/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n))) + velTimeCaesium(n-1);
        velTimeIndium(n) = sqrt(2*q*Voltage/indiumIonMass)*log((totalMass)/(totalMass - ionFlowRate*indiumIonMass*timeArray(n))) + velTimeIndium(n-1);
        velTimeMercury(n) = sqrt(2*q*Voltage/mercuryIonMass)*log((totalMass)/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n))) + velTimeMercury(n-1);
        
    end
    
        ThrustVoltageCaesium(n) = (totalMass - ionFlowRate*caesiumIonMass*timeArray(2))*sqrt(2*q*voltageArray(n)/caesiumIonMass)*log((totalMass - ionFlowRate*caesiumIonMass*timeArray(1))/(totalMass - ionFlowRate*caesiumIonMass*timeArray(2))); 
        ThrustVoltageIndium(n) = (totalMass - ionFlowRate*indiumIonMass*timeArray(2))*sqrt(2*q*voltageArray(n)/indiumIonMass)*log((totalMass - ionFlowRate*indiumIonMass*timeArray(1))/(totalMass - ionFlowRate*indiumIonMass*timeArray(2))); 
        ThrustVoltageMercury(n) = (totalMass - ionFlowRate*mercuryIonMass*timeArray(2))*sqrt(2*q*voltageArray(n)/mercuryIonMass)*log((totalMass - ionFlowRate*mercuryIonMass*timeArray(1))/(totalMass - ionFlowRate*mercuryIonMass*timeArray(2))); 
        
        ThrustTimeCaesium(n) = (totalMass - ionFlowRate*caesiumIonMass*timeArray(n))*sqrt(2*q*Voltage/caesiumIonMass)*log((totalMass)/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n))); 
        ThrustTimeIndium(n) = (totalMass - ionFlowRate*indiumIonMass*timeArray(n))*sqrt(2*q*Voltage/indiumIonMass)*log((totalMass)/(totalMass - ionFlowRate*indiumIonMass*timeArray(n)));
        ThrustTimeMercury(n) = (totalMass - ionFlowRate*mercuryIonMass*timeArray(n))*sqrt(2*q*Voltage/mercuryIonMass)*log((totalMass)/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n)));    
        
        ThrustVoltageCaesiumC(n) = (totalMass - ionFlowRate*caesiumIonMass*timeArray(50))*speedOfLight*log((totalMass - ionFlowRate*caesiumIonMass*timeArray(49))/(totalMass - ionFlowRate*caesiumIonMass*timeArray(50))); 
        ThrustVoltageIndiumC(n) = (totalMass - ionFlowRate*indiumIonMass*timeArray(50))*speedOfLight*log((totalMass - ionFlowRate*indiumIonMass*timeArray(49))/(totalMass - ionFlowRate*indiumIonMass*timeArray(50))); 
        ThrustVoltageMercuryC(n) = (totalMass - ionFlowRate*mercuryIonMass*timeArray(50))*speedOfLight*log((totalMass - ionFlowRate*mercuryIonMass*timeArray(49))/(totalMass - ionFlowRate*mercuryIonMass*timeArray(50)));  
    if n == 1
        ThrustTimeCaesiumdt(n) = (totalMass - ionFlowRate*caesiumIonMass*timeArray(n))*sqrt(2*q*Voltage/caesiumIonMass)*log((totalMass)/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n))); 
        ThrustTimeIndiumdt(n) = (totalMass - ionFlowRate*indiumIonMass*timeArray(n))*sqrt(2*q*Voltage/indiumIonMass)*log((totalMass)/(totalMass - ionFlowRate*indiumIonMass*timeArray(n)));
        ThrustTimeMercurydt(n) = (totalMass - ionFlowRate*mercuryIonMass*timeArray(n))*sqrt(2*q*Voltage/mercuryIonMass)*log((totalMass)/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n))); 
        
        accelTimeCaesium(n) = sqrt(2*q*Voltage/caesiumIonMass)*log((totalMass)/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n))); 
        accelTimeIndium(n) = sqrt(2*q*Voltage/indiumIonMass)*log((totalMass)/(totalMass - ionFlowRate*indiumIonMass*timeArray(n)));
        accelTimeMercury(n) = sqrt(2*q*Voltage/mercuryIonMass)*log((totalMass)/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n)));
        
        ThrustTimeCaesiumC(n) = (totalMass - ionFlowRate*caesiumIonMass*timeArray(n))*speedOfLight*log((totalMass)/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n))); 
        ThrustTimeIndiumC(n) = (totalMass - ionFlowRate*indiumIonMass*timeArray(n))*speedOfLight*log((totalMass)/(totalMass - ionFlowRate*indiumIonMass*timeArray(n)));
        ThrustTimeMercuryC(n) = (totalMass - ionFlowRate*mercuryIonMass*timeArray(n))*speedOfLight*log((totalMass)/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n)));    
        accelTimeCaesiumC(n) = speedOfLight*log((totalMass)/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n))); 
        accelTimeIndiumC(n) = speedOfLight*log((totalMass)/(totalMass - ionFlowRate*indiumIonMass*timeArray(n)));
        accelTimeMercuryC(n) = speedOfLight*log((totalMass)/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n)));
    else
        ThrustTimeCaesiumdt(n) = (totalMass - ionFlowRate*caesiumIonMass*timeArray(n))*sqrt(2*q*Voltage/caesiumIonMass)*log((totalMass - ionFlowRate*caesiumIonMass*timeArray(n-1))/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n))); 
        ThrustTimeIndiumdt(n) = (totalMass - ionFlowRate*indiumIonMass*timeArray(n))*sqrt(2*q*Voltage/indiumIonMass)*log((totalMass - ionFlowRate*indiumIonMass*timeArray(n-1))/(totalMass - ionFlowRate*indiumIonMass*timeArray(n))); 
        ThrustTimeMercurydt(n) = (totalMass - ionFlowRate*mercuryIonMass*timeArray(n))*sqrt(2*q*Voltage/mercuryIonMass)*log((totalMass - ionFlowRate*mercuryIonMass*timeArray(n-1))/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n))); 
        accelTimeCaesium(n) = sqrt(2*q*Voltage/caesiumIonMass)*log((totalMass - ionFlowRate*caesiumIonMass*timeArray(n-1))/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n))); 
        accelTimeIndium(n) = sqrt(2*q*Voltage/indiumIonMass)*log((totalMass - ionFlowRate*indiumIonMass*timeArray(n-1))/(totalMass - ionFlowRate*indiumIonMass*timeArray(n))); 
        accelTimeMercury(n) = sqrt(2*q*Voltage/mercuryIonMass)*log((totalMass - ionFlowRate*mercuryIonMass*timeArray(n-1))/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n))); 
        
        ThrustTimeCaesiumC(n) = (totalMass - ionFlowRate*caesiumIonMass*timeArray(n))*speedOfLight*log((totalMass - ionFlowRate*caesiumIonMass*timeArray(n-1))/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n))); 
        ThrustTimeIndiumC(n) = (totalMass - ionFlowRate*indiumIonMass*timeArray(n))*speedOfLight*log((totalMass - ionFlowRate*indiumIonMass*timeArray(n-1))/(totalMass - ionFlowRate*indiumIonMass*timeArray(n))); 
        ThrustTimeMercuryC(n) = (totalMass - ionFlowRate*mercuryIonMass*timeArray(n))*speedOfLight*log((totalMass - ionFlowRate*mercuryIonMass*timeArray(n-1))/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n))); 
        accelTimeCaesiumC(n) = speedOfLight*log((totalMass - ionFlowRate*caesiumIonMass*timeArray(n-1))/(totalMass - ionFlowRate*caesiumIonMass*timeArray(n))); 
        accelTimeIndiumC(n) = speedOfLight*log((totalMass - ionFlowRate*indiumIonMass*timeArray(n-1))/(totalMass - ionFlowRate*indiumIonMass*timeArray(n))); 
        accelTimeMercuryC(n) = speedOfLight*log((totalMass - ionFlowRate*mercuryIonMass*timeArray(n-1))/(totalMass - ionFlowRate*mercuryIonMass*timeArray(n))); 
    end
    if ionFlowRate*caesiumIonMass*timeArray(n) > fuelMass
        ThrustTimeCaesium(n) = 0;
        ThrustTimeCaesiumdt(n) = 0;
        ThrustVoltageCaesium(n) = 0;
        accelTimeCaesium(n) = 0;
        ThrustTimeCaesiumC(n) = 0;
        ThrustVoltageCaesiumC(n) = 0;
        accelTimeCaesiumC(n) = 0;
    end
    if ionFlowRate*indiumIonMass*timeArray(n) > fuelMass
        ThrustTimeIndium(n) = 0;
        ThrustTimeIndiumdt(n) = 0;
        ThrustVoltageIndium(n) = 0;
        accelTimeIndium(n) = 0;
        ThrustTimeIndiumC(n) = 0;
        ThrustVoltageIndiumC(n) = 0;
        accelTimeIndiumC(n) = 0;
    end
    if ionFlowRate*mercuryIonMass*timeArray(n) > fuelMass
        ThrustTimeMercury(n) = 0;
        ThrustTimeMercurydt(n) = 0;
        ThrustVoltageMercury(n) = 0;
        accelTimeMercury(n) = 0;
        ThrustTimeMercuryC(n) = 0;
        ThrustVoltageMercuryC(n) = 0;
        accelTimeMercuryC(n) = 0;
    end
    
end

if (j-1)/2 == 1||(j-1)/2 == 2||(j-1)/2 == 3 || j == 1||(j-1)/2 == 4||(j-1)/2 == 5||(j-1)/2 == 6||(j-1)/2 == 7
    figure('units','normalized','outerposition',[0 0 1 1]) % Maximize plot window
    k = 1;
end
subplot(2,5, 5*k - 4);
plot(timeArray, ThrustTimeCaesium, timeArray, ThrustTimeIndium, timeArray, ThrustTimeMercury);
title(sprintf('Thrust Vs Time|IonFlowRate = %.1e|10kV', ionFlowRate));
xlabel('Time(s)');
ylabel('Thrust(N)');
legend('Caesium', 'Indium', 'Mercury');
subplot(2,5,5*k - 3);
plot(timeArray, ThrustTimeCaesiumdt, timeArray, ThrustTimeIndiumdt, timeArray, ThrustTimeMercurydt);
title(sprintf('Thrust Vs. Time|IonFlowRate = %.1e|10kV @c', ionFlowRate'));
xlabel('Time(s)');
ylabel('Thrust(N)/dt');
legend('Caesium', 'Indium', 'Mercury');
subplot(2,5,5*k - 2);
plot(voltageArray, ThrustVoltageCaesium, voltageArray, ThrustVoltageIndium, voltageArray, ThrustVoltageMercury);
title(sprintf('Thrust Vs. Voltage|Ion Flow Rate = %.1e', ionFlowRate'));
xlabel('Voltage(v)');
ylabel('Thrust(N)');
legend('Caesium', 'Indium', 'Mercury');
subplot(2,5,5*k - 1);
plot(timeArray, ThrustTimeCaesiumC, timeArray, ThrustTimeIndiumC, timeArray, ThrustTimeMercuryC);
title(sprintf('Thrust Vs. Time|IonFlowRate = %.1e|10kV @c', ionFlowRate'));
xlabel('Time(s)');
ylabel('Thrust(N)/dt');
legend('Caesium', 'Indium', 'Mercury');
subplot(2,5,5*k);
plot(timeArray, velTimeCaesium, timeArray, velTimeIndium, timeArray, velTimeMercury);
title(sprintf('Thrust Vs. Time|IonFlowRate = %.1e|10kV @c', ionFlowRate'));
xlabel('Time(s)');
ylabel('Velocity (m/(s^{2}))');
legend('Caesium', 'Indium', 'Mercury');

k = k + 1;
end
