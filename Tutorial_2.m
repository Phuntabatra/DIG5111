% %audio filename must in same directory of this m file
% filename = 'piano_middle_C.wav';
% % First read wav file into memory
% [Sig, Fs]=audioread(filename);
% %Sig stores raw audio data in column;
% %Fs sampling frequency
% 
% Duration = length(Sig)/Fs;
% 
% disp(Duration);
% Ts = 1/Fs;
% Time = 0:Ts:Duration;
% Time = Time';
% 
% t = ((0:length(Sig)-1) / Fs)';
% 
% plot(t, Sig);
% ylabel('Amplitude');
% xlabel('Time Sec');

%% Task 2. Apply the audioinfo() function to the 
%% piano_middle_C.wav” file and determine the number of 
%% samples, duration, bit depth and sample rate of the audio 

info = audioinfo('piano_middle_C.wav');

% Extract required details
numSamples = info.TotalSamples;  % Number of samples
duration = info.Duration;        % Duration in seconds
bitDepth = info.BitsPerSample;   % Bit depth
sampleRate = info.SampleRate;    % Sample rate (Hz)

% Display the results
fprintf('Number of Samples: %d\n', numSamples);
fprintf('Duration: %.2f seconds\n', duration);
fprintf('Bit Depth: %d bits\n', bitDepth);
fprintf('Sample Rate: %d Hz\n', sampleRate);