# Sound-analysis-using-Matlab
 
The above code is a MATLAB script that demonstrates various audio processing techniques. The script begins by reading an audio file named 'Mohamed214618.mp3' using the audioread function and playing the audio using the sound function. The audio signal is then plotted in a subplot with a title 'Audio signal'.

Next, a bandpass filter is designed to filter out the frequencies between 1000 to 12000 Hz using the butter function. The filtered signal is obtained by applying the filter to the original signal using the filter function, and the filtered signal is played using the sound function. The filtered signal is plotted in a subplot with a title 'Filtered audio signal'.

The original audio signal is time-limited to 4 seconds, and the time-limited signal is plotted in a subplot with a title 'Time-limited audio signal'. The time-limited audio signal is then shifted by 4 seconds and delayed by 3 seconds by appending zeros to the beginning of the signal. The shifted and delayed signal is plotted in a subplot with a title 'Time-limited and shifted audio signal'.

The amplitude of the filtered signal is scaled by a factor of 6 using element-wise multiplication, and the scaled signal is played using the audioplayer object constructed using the scaled signal and the original sampling frequency. The scaled signal is plotted in a subplot with a title 'Amplitude Scaling'.

A sinusoidal amplitude scaling is performed on the filtered signal by multiplying it with a sinusoidal waveform. The resulting signal is played using the sound function, and the sinusoidally scaled signal is plotted in a subplot with a title 'Sinusoidal Amplitude Scaling'.

Finally, the fast Fourier transform is applied to the original and filtered audio signals to obtain their frequency and phase spectra, which are plotted in subplots with titles 'Fast Fourier Transform, Frequency Domain, Unfiltered/Filtered Signal' and 'Fast Fourier Transform, Phase Domain, Unfiltered/Filtered Signal', respectively.

Overall, the script provides a basic understanding of audio processing techniques such as filtering, time-limiting, shifting, amplitude scaling, and Fourier analysis.
