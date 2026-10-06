samplerate = 16e3;
t = (-0.5:1/samplerate:0.5)';
D = 0.1;

% Definições dadas no guia
s = @(t) (t >= 0).*t; % Unit ramp
uD = @(t,D) (1/D)*(s(t+D/2)-s(t-D/2)); % Approximate unit step
duD = @(t,D,h) (uD(t+h/2,D)-uD(t-h/2,D))/h; % Numeric derivative
deltaD = @(t,D) duD(t,D,1e-6); % Approximate unit impulse

% Teste com a = 2 (comprime o tempo, reduz área para 1/2)
a = 2;

figure;
plot(t, deltaD(t, D)); hold on;
plot(t, deltaD(a*t, D)); hold on
plot(t, (1/abs(a))*deltaD(t, D));
grid on;
