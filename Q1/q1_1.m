samplerate = 16e3;
t = (0:1/samplerate:2)';

f1 = 30;
f2 = 35;

x = cos(2*pi*f1*t) + cos(2*pi*f2*t);

plot(t, x); grid on;
[xi, yi] = ginput;