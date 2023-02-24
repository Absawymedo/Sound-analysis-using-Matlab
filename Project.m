%% Input Audio
[f,fs] = audioread('Mohamed214618.mp3');
sound(f,fs)
subplot(10,1,1)
plot(f)
title('Audio signal')
xlabel 'Time'
ylabel 'Audio signal'
grid on
%% Design a bandpass filter that filters out between 1000 to 12000 Hz
n = 7;                                                  
beginFreq = 1000 / (fs/2);
endFreq = 12000 / (fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
fi = filter(b, a, f);                                   %% Filter the signal
sound(fi,fs)
subplot(10,1,2)
plot(fi)
title('Filtered audio signal')
xlabel 'Time'
ylabel 'Audio signal'
grid on
%% Time-limited audio signal
N = length(f);                                          %% sample length
t = linspace(0, 4, N);
f1 = f(1:fix(N/2),:);
soundsc(f1,fs)
subplot(10,1,3)
plot(t,f)                                               %% pplots the time-limited audio
xlim([0 10])
title('Time-limited audio signal')
xlabel 'Time'
ylabel 'Audio signal'
grid on
%% Time-limited and shifted audio signal
x = t + 4;
delay2 = 3*fs;
Z = zeros(delay2,1);
f2 = [Z;f(1:end-delay2)];
sound(f2,fs)
subplot(10,1,4)
plot(x,f)                                               %% pplots the time-limited shifted audio
xlim([0 10])
title('Time-limited and shifted audio signal')
xlabel 'Time'
ylabel 'Audio signal'
grid on
%% Amplitude Scaling
fOut = 6*fi;                                            
p = audioplayer(fOut, fs);                              %% Construct audioplayer object and play
p.play;
subplot(10,1,5)
plot(fOut)
title('Amplitude Scaling')
xlabel 'Time'
ylabel 'Audio signal'
grid on
%% Sinusoidal Amplitude Scaling
dt = 1/80;                                              %% seconds per sample
StopTime = 3.5;                                         %% seconds
u = (0:dt:StopTime);                                    %% seconds
Fc = 60;                                                %% hertz
si = sin(2*pi*Fc*u);
fsi = fi * si;
stereoSound = fsi(:, 2:2);                              %% Extract first two channels and ignore remaining channels.
sound(stereoSound,fs)
subplot(10,1,6)
plot(fsi)
title('Sinusoidal Amplitude Scaling')
xlabel 'Time'
ylabel 'Audio signal'
grid on
%% Fast Fourier Transform Unfiltered Signal
A = size(f,1);
df = fs / A;                                            
w = (-(A/2):(A/2)-1)*df;
y = fft(f(:,1), A) / A;
y2 = fftshift(y);
subplot(10,1,7)
plot(w,abs(y2))                                         %% Plot the spectrum
title('Fast Fourier Transform, Frequency Domain, Unfiltered Signal')
xlabel 'Frequency'
ylabel 'Audio signal'
grid on
subplot(10,1,8)
plot(w,angle(y2))
title('Fast Fourier Transform, Phase Domain, Unfiltered Signal')
xlabel 'Phase'
ylabel 'Audio signal'
grid on
%% Fast Fourier Transform Filtered Signal
A1 = size(fi,1);
df1 = fs / A1;                                            
w1 = (-(A1/2):(A1/2)-1)*df1;
y1 = fft(fi(:,1), A) / A;
y3 = fftshift(y1);
subplot(10,1,9)
plot(w1,abs(y3))                                        %% Plot the spectrum
title('Fast Fourier Transform, Frequency Domain, Filtered Signal')
xlabel 'Frequency'
ylabel 'Audio signal'
grid on
subplot(10,1,10)
plot(w1,angle(y3))
title('Fast Fourier Transform, Phase Domain, Filtered Signal')
xlabel 'Phase'
ylabel 'Audio signal'
grid on