% Create note D major (D(30), F(33), A(37))
% difference lengths
NoteC=notes(0.7, 30, 1, 'D'); 
NoteE=notes(0.5, 33, 3, 'F');
NoteG=notes(0.2, 37, 5, 'A');
 
% Combine note of difference time and difference pitch
Ctriad_org = [NoteC NoteE NoteG];
Ctriad = Ctriad_org./max(Ctriad_org);
%sound(Ctriad,11025); 
audiowrite('Ctriad2.wav', Ctriad, 11025); %is audio clipping why? 


function noteX = notes(A, keynum, dur, type)
%function note() will create a note with sampling frequency 11025 by given
%any key and any time duration.
Fs = 11025;
Ts = 1/Fs;
A4=440;
ref_key=49;     %A4 is the 49th Key in piano keyboard 
n = keynum-ref_key;  %Calculate the difference between ref_key and input Key
freq = A4*2^(n/12); %Calculate the frequency of input Key
Time = 0:Ts:dur;

noteX=A*sin(2*pi*freq*Time);

% Resample the audio to change pitch
if type == 'D'
    pitch_factor = 0.5;
    noteX = resample(noteX, round(Fs * pitch_factor), Fs);
end

end
