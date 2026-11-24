samplerate = 16e3
t=(-320:32000)'/samplerate;
w0=2*pi/0.6;
T=2*pi/w0;
Ta=0.05;
Tb=0.1;


aak=@(k) 30*sin(k*w0*Ta)./(k*pi).*exp(-1i*k*w0*Ta);
aa0=2*Ta/T; % Segregate a0, which often has a different expression

abk=@(k) 15*sin(k*w0*Tb)./(k*pi).*exp(-1i*k*w0*Tb);
ab0=Tb/T;

figure; hold on;

for N = 10000
    % Order of the Fourier expansion
    xN1=exp(1i*w0*(t-0.4)*(-N:N))*[aak(-N:-1) aa0 aak(1:N)].';
    xN2=exp(1i*w0*(t-0.5)*(-N:N))*[abk(-N:-1) ab0 abk(1:N)].';
    plot(t, real (xN1-xN2)); grid
end