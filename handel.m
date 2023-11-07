% play
load handel.mat
sound(y,Fs)

% plot the frequency spectrum
figure
pspectrum(y,Fs)

% play the first Hallelujah
t = (1:length(y))/Fs;
sound(y(t<2.5),Fs)

% play the last Hallelujah
sound(y(t>6.9),Fs)

% there is more complex frequency content across multiple notes

% plot the first Hallelujah
figure
pspectrum(y(t<2.5),Fs)
title('First Hallelujah')

% plot the last Hallelujah
figure
pspectrum(y(t>6.9),Fs)
title('Last Hallelujah')

% set the frequency resolution to 60 Hz
figure
pspectrum(y,Fs,'spectrogram','FrequencyResolution',60)

% use fancy options
figure
pspectrum(y,Fs,'spectrogram','FrequencyResolution',60)

% select a slice at 3 seconds
[p_,f_,t_] = pspectrum(y,Fs,'spectrogram','Reassign',true,'OverlapPercent',80);

figure
plot(f_,p_(:,find(t_>3,1,'first')));
xlabel("frequency")
ylabel("amplitude at t=3 seconds")


% FFT vs. PSD of handel
clear
load handel.mat

Fs
% Fs =
%         8192
% Sampled at 8.192 kHz

t = (0:(length(y))-1)/Fs;

y;
N = length(y)
% 73113 voltage-ish values

% Must normalize by length!
yfft = fft(y)/N;
N = length(yfft)
N
% 73113 complex values


% FFT frequencies: 0 to just about 8.192 kHz
fft_f = Fs/N*(0:N-1);
fft_f_shift = (-N/2:N/2-1)*(Fs/N); % zero-centered frequency range

% min(fft_f)
% 
% ans =
%      0
% 
% max(fft_f)
% 
% ans =
%    8.1919e+03

fig = figure;
fig.Color = "white"
tiledlayout("flow")

% Plot the data
nexttile
plot(t,y)
xlim([0 max(t)])
xlabel("Seconds")
ylabel("V")
title("Signal")

% Plot the FFT
nexttile
plot(fft_f,abs(yfft))
xlim([0 Fs])
xlabel("Frequency")
ylabel("V^2")
title("FFT Magnitude")

% Plot the FFT in a cuter organization
nexttile
plot(fft_f_shift,fftshift(abs(yfft)))
xlim([-Fs/2 Fs/2])
xlabel("Frequency (Shifted)")
ylabel("V^2")
title("FFT Magnitude")

nexttile
pspectrum(y,Fs)

figure
plot()

sound(y,Fs)





