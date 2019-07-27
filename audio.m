[data, fs] = audioread('audio_oboe.wav');         %reading the audio as a wave function (.wav)
data_fft   = fft(data);                           %changing domain from time to frequency with fast forier transfrom in order to observe the frequency that causes the background noise
L = length(data);                                 %storing length of the data to variable L

figure;                                           %opening a figure
subplot(2,1,1); plot(abs(data_fft(:,1)));         %the first graph, not filtered. Using abs because negative frequencies do not exist (negative values for time is not proved yet)
title('Amplitude Spectrum of the Audio ');
xlabel('f[Hz]');
ylabel('Amplitude');

%after observing the cut-off frequency, use it to get rid of the background noise

low_filter = lowpass(data, 1.18*exp(5),fs);       %filtering the frequencies above 1.18*exp(5) Hz)

subplot(2,1,2); plot(abs(low_filter(:,1)));       %the second graph, filtered
title('Lowpass filter with cutoff frequency of 118kHz ');
xlabel('f[Hz]');
ylabel('Amplitude');

player = audioplayer(low_filter, fs);
play(player);
