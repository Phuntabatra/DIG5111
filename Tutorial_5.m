%% Task 1.
filename = 'piano_middle_C.wav';
[sig, fs] = audioread(filename); %Read Signal 

sound(sig, fs);

ir = zeros(1, length(sig)); 
ir([1, 22052, 44104, 66156, 110259]) = [1, 0.8, 0.7, 0.6, 0.5];

y = conv(sig, ir); % convolve the two signals  

sound(y,fs); 

subplot(211), plot(sig); 
subplot(212), plot(y); 