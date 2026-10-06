samplerate = 16e3;
f1=30;
f2=35;
t=(0:1/samplerate:2);
x=cos(2*pi*f1*t) + cos(2*pi*f2*t);
plot(x); % T = 0.2s | 3100 samples
[xi,yi] = ginput();
y = downsample(x,7);
%plot(y); % ~450sam
