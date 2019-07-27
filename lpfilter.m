[data, fs] = audioread('audio_oboe.wav'); %read the audio
data_fft = fft(data);                     %compute fourier transform, change time domain to frequency domain
L = length(data);                         %length of signal
T = 1/fs;                                 %Sampling period where fs is the sampling frequency
t = (0:L-1)*T;                            %time vector
f = fs*(0:(L/2))/L;                       %frequency vector

figure; subplot(4,1,1); plot(t, data);    %plot signal with noise in time domain
title('Noisy Signal with Time Domain');
xlabel('t[s]');
ylabel('|P1(t)|');


P2 = abs(data_fft/L);                     %two-sided spectrum for noisy signal, absolute values of the frequency values divided by the length of the signal
P1 = P2(1:L/2+1);                         %single-sided spectrum for noisy signal
P1(2:end-1)= 2*P1(2:end-1);

subplot(4,1,2); plot(f, P1);              %plot signal in frequency domain
title('Noisy Signal with Frequency Domain');
xlabel('f[Hz]');
ylabel('|P1(f)|');


s = tf('s');                               %create a special variable s that can be used in a continous-time transfer function expression
num = 1;                                   %numerator of the transfer function
den = 2.621e-25*s^6 + 1.966e-20*s^5 + 6.144e-16*s^4 + 1.024e-11*s^3 + 9.6e-08*s^2 + 0.00048*s + 1; %denominator of the transfer function
H = num/den;                               %transfer function

[numd, dend] = bilinear(H.num{:},H.den{:}, fs); %transform the filter from analogue to digital, convert the s-domain transfer function to a discrete equivalent to work out coefficients

filtered = filter(numd,dend, data);        %filter the signal using the coefficients of the transfer function
F2 = abs(fft(filtered)/L);                 %two-sided spectrum for filtered signal, absolute values of the frequency values divided by the length of the signal
F1 = F2(1:L/2+1);                          %single-sided spectrum for filtered signal
F1(2:end-1) = 2*F1(2:end-1);

subplot(4,1,3); plot(t, filtered);
title('Filtered Signal with Time Domain');
xlabel('t[s]');
ylabel('|F1(t)|');

subplot(4,1,4); plot(f, F1);               %plot filtered signal both in time domain and the frequency domain
title('Filtered Singal with Frequency Domain');
xlabel('f[Hz]');
ylabel('|F1(f)|');
soundsc(filtered, fs);                     %play the filtered signal
