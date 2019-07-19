[data, fs] = audioread('audio_oboe.wav');        %reading the audio as a wave function
data_fft = fft(data);                            %changing domain from time to frequency with fast forier transfrom   
low_filter = lowpass((data_fft), 1.18*exp(5),fs); %filtering the frequencies above 1.18*exp(5) Hz)

L = length(data);  
figure;                                          %opening a figure                                         
subplot(2,1,1); plot(abs(data_fft(:,1)));        %
title('Amplitude Spectrum of the Audio ');       %
xlabel('f[Hz]');                                 %
ylabel('Amplitude');                             %

subplot(2,1,2); plot(abs(low_filter(:,1)));      %
title('Lowpass filter with cutoff frequency of 118kHz '); %
xlabel('f[Hz]');                                 %
ylabel('Amplitude');                             %

soundsc(low_filter, fs);                         %