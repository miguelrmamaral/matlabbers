%% 0. Definições base do Lab 1 (impulso e degrau)
samplerate = 16e3;
u = @(t) (t >= 0);
s = @(t) (t >= 0).*t; % Unit ramp
uD = @(t,D) (1/D)*(s(t+D/2)-s(t-D/2)); % Approximate unit step
duD = @(t,D,h) (uD(t+h/2,D)-uD(t-h/2,D))/h; % Numeric derivative
deltaD = @(t,D) duD(t,D,1e-6); % Approximate unit impulse

%% 1. Q4.3 — Resposta ao impulso de system3 (via impulso aproximado deltaD)
t = (-0.2:1/samplerate:1)';
x = deltaD(t, 10/samplerate);
y = system3(x, samplerate);

% Verificação alternativa via derivada da resposta ao degrau
ys = system3(u(t), samplerate);
y_step_diff = [diff(ys); 0] * samplerate;

% Gráfico da Resposta ao Impulso h(t)
figure;
plot(t, y, 'b', 'LineWidth', 1.5); hold on;
plot(t, y_step_diff, 'r--', 'LineWidth', 1.2);
grid on;
xlim([-0.02 0.15]); % Zoom em torno de t = 0 para ver o pico h(0)
xlabel('t (s)'); ylabel('h(t)');
title('Q4.3: Resposta ao Impulso h(t) de system3');
legend('Via deltaD', 'Via derivada do degrau');

%% 2. Q4.3 — Transformada de Fourier de h(t) (escala em rad/s)
[H_f, f] = cftransform(y, find(t == 0), 1e4, samplerate);
w_fft = 2 * pi * f; % Converter Hz para rad/s

figure;
plot(w_fft, abs(H_f), 'b', 'LineWidth', 1.5);
grid on;
xlim([0 1000]); % Região [0, 1000] rad/s pedida no guião
xlabel('\omega (rad/s)'); ylabel('|H(j\omega)|');
title('Q4.3: Magnitude da Resposta em Frequência via Fourier de h(t)');

%% 3. Q4.5 — Cálculo de L e Validação (Tempo e Frequência)
R = 3;
h0 = max(y); % Lê automaticamente o pico h(0) ≈ 65 do gráfico da Q4.3
L = R / h0;  % L = 3 / h(0) ≈ 0.04615 H
tau = L / R; % Constante de tempo

fprintf('Pico lido h(0) = %.2f\n', h0);
fprintf('Indutância calculada L = %.5f H\n', L);
fprintf('Constante de tempo tau = %.5f s\n', tau);

% Sobreposição no Domínio do Tempo: h(t) experimental vs h(t) teórico
h_teo = (R / L) * exp(-(R / L) * t) .* u(t);

figure;
plot(t, y, 'b', 'LineWidth', 1.5); hold on;
plot(t, h_teo, 'g--', 'LineWidth', 1.5);
grid on;
xlim([-0.02 0.15]);
xlabel('t (s)'); ylabel('h(t)');
title(['Q4.5: Validação de h(t) (R = 3 \Omega, L = ' num2str(L, '%.4f') ' H)']);
legend('Experimental (system3)', 'Teórico (R/L)e^{-(R/L)t}u(t)');

% Sobreposição no Domínio da Frequência: |H(jw)| experimental vs teórico
w_teo = linspace(0, 1000, 1000);
H_teo = 1 ./ sqrt(1 + (w_teo * tau).^2);

figure;
plot(w_fft, abs(H_f), 'b', 'LineWidth', 1.5); hold on;
plot(w_teo, H_teo, 'g--', 'LineWidth', 1.5);
grid on;
xlim([0 1000]);
xlabel('\omega (rad/s)'); ylabel('|H(j\omega)|');
title('Q4.5: Validação de |H(j\omega)| Experimental vs Teórico');
legend('Experimental (Fourier de h)', 'Teórico 1/\sqrt{1+(\omega\tau)^2}');