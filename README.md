# Filtering-Background-Noise
The aim of this project is to filter the background noise on a given audio file and plot the differences between the frequency responses. Initially, the file should be in .wav format or converted to .wav format. The audio used for this project is audio_oboe.wav. In order to detect the cut-off frequency, time domain is changed to frequency domain using fast fourier transform (fft). There are two ways to continue this project.

First one (audio.m) uses the lowfilter function to get rid of the background noise. This method is better if there isn't any physical filter design for the particular audio.

However, if there is a physical filter design, lpfilter.m is more suitable for usage. For lpfilter.m, I used the filter design that my teammates have agreed on. Most significant part of the code is using the transfer function of the low-pass filter.

I personally recommend to attempt this project with a team that has sufficient electronic knowledge.

Further explanation is given on the code.
