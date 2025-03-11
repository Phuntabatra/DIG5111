% %% f Statements 
% x = 5; 
% y = 10; 
% if (x > 1) 
% y = x+y; 
% end 
% disp(['The new value of Y is: ', num2str(y)]); 
% 
% %% If/Else statements
% if (x>1) 
% y = x+y; 
% else 
% y = x*y; 
% end 
% disp(['The newer value of Y is: ', num2str(y)]);
% 
% %% For Loops
% plot(array); hold on; %plot the array and hold the graph open! 
% arrayLength = length(array); % find the length of the array! 
% for i = 1:arrayLength %run the loop 'arrayLength' times. 
% array(i) = array(i) + i; 
% % replace the existing 'array' values with the array values plus the 
% % corresponding index value (IE: 1+1, 2+2, 1+3, 2+4...) 
% end 
% plot(array, '--'); %plot the new array, with a dotted line!
% 
% %% Combining 'for's and 'If 's
% x = -1:0.01:1; 
% y = x; 
% plot(y, x, '--'), hold on; 
% % we set up 2 straight vectors, to demonstrate the transfer function. 
% % x holds the original signal, y will hold the new clipped signal. 
% xLength = length (x); 
% % we find the length of the input; 
% for i = 1:xLength 
% if (x(i) > 0.5) 
% y(i) = 0.5; 
% end % if the input is higher than 0.5, the output is clipped at 0.5 
% if (x(i) < -0.5) 
% y(i) = -0.5; 
% end % if the input is lower than -0.5, the output is clipped at -0.5 
% end 
% plot(x,y, 'r'), axis([-1, 1, -1, 1]); 
% title('Transfer Function for Hard Clipping Distortion'); 
% grid on; 
% hold off;
% 
% %% Bit Crushing
% fs = 44100; 
% ts = 1/fs; 
% dur = 1; 
% NumberOfSteps = 10; 
% % This is the number of steps we want to create in our signal 
% % IE: the resolution. 
% t = 0:ts:dur; 
% % This will create a straight line. 
% % We will use this to demonstrate our transfer function. 
% subplot(211), plot(x); grid on; hold on; 
% y = t*NumberOfSteps; 
% % y is the x value, scaled by the number of steps. 
% y = round(y); 
% % y is then rounded to the steps. 
% y = y*(1/NumberOfSteps); 
% % we then divide by 1 to normalise the signal. 
% plot(y, '--'); 
% % plot our new signal with a dashed line. 
% z = sin(2*pi*1.*t); 
% subplot(212), plot(z); grid on; hold on; 
% NumberOfSteps2 = 3; 
% y2 = z*NumberOfSteps2; 
% y2 = round(y2); 
% y2 = y2*(1/NumberOfSteps2); 
% plot(y2, '--');

%% Task 2 
%% Design an asymmetrical distortion algorithm that only clips the negative parts of the cycle, set the 
%% threshold to 0.1. Following is the excerpt of the code. Complete the following code.

fs = 44100;  % Sampling frequency in Hz
f = 440;     % Frequency of sine wave (Hz) - A4 note
duration = 2; % Duration in seconds

% Create time vector
t = 0:1/fs:duration;

% Generate sine wave
signal = sin(0.01 * pi * f * t);

% Define the negative clipping threshold
threshold = -0.1;

% Apply asymmetrical distortion
distorted_signal = [];
% Loop through each sample and apply the asymmetric distortion
for i = 1:length(signal)
    if signal(i) < threshold
        distorted_signal(i) = threshold; % Clip negative values below threshold
    else
        distorted_signal(i) = signal(i); % Keep other values unchanged
    end
end

%distorted_signal(distorted_signal < threshold) = threshold;

% Plot the original and distorted signals
t = (0:length(signal)-1) / fs;

figure;
subplot(2,1,1);
plot(t, signal);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Original Signal');
grid on;

subplot(2,1,2);
plot(t, distorted_signal);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Distorted Signal');
grid on;

% Play the distorted signal
sound(distorted_signal, fs);