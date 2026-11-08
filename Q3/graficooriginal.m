samplerate=16e3
t = (-320:8000*3.2)'/samplerate; w0 = 2*pi/0.6; T = 2*pi/w0; Ta = 0.05; Tb = 0.1;
aak = @(k) 30*sin(k*w0*Ta)./(k*pi).*exp(-1i*k*w0*Ta);
abk = @(k) 15*sin(k*w0*Tb)./(k*pi).*exp(-1i*k*w0*Tb);
dk = @(k) aak(k).*exp(-1i*k*w0*0.4) - abk(k).*exp(-1i*k*w0*0.5); % a'_k
xk = @(k) dk(k)./(1i*k*w0); % a_k, k ~= 0
x0 = 0.75; % a_0 (c = 0)
for N = [5 20 50]
xN = exp(1i*w0*t*(-N:N))*[xk(-N:-1) x0 xk(1:N)].';
plot(t, real(xN)); hold on
end