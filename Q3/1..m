t = (-320:320)'/samplerate;
w0 = 2*pi*80;
T = 2*pi/w0;
T1 = T/6;
ak = @(k) sin(k*w0*T1)./(k*pi).*exp(-1i*k*w0*T1);
a0 = 2*T1/T; % Segregate a0, which often has a different expression
N = 100; % Order of the Fourier expansion
xN = exp(1i*w0*t*(-N:N))*[ak(-N:-1) a0 ak(1:N)].';
plot(t,real(xN)); grid