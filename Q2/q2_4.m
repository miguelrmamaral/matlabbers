samplerate = 16e3;
t = (0:1/samplerate:4)';

omega = 36;
x1 = cos(omega * t);

system1 = @(x) filter([1 zeros(1, round(0.6*samplerate)-1) 0.5], 1, x);

y1 = system1(x1)

A = 0.57;
y2 = A*cos(omega*t)

plot(t, y1); hold on
plot(t, y2); hold off

% y(t) = x(t) + 0.5x(t -0.6) = cos(omega*t) + 0.5cos(omega(t-0.6))
% 