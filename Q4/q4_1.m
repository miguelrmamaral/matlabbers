samplerate = 16e3;
t = (0:1/samplerate:2)'; % Eixo temporal longo o suficiente para atingir regime permanente

% Vetor de frequências angulares de teste (ajustar consoante a tabela do guião)
omegas = [10, 50, 100, 500, 1000, 2000]; 

A_medido = zeros(size(omegas));
phi_medido = zeros(size(omegas));

for i = 1:length(omegas)
    w = omegas(i);
    
    % Sinal de entrada sinusoidal
    x = cos(w * t);
    
    % Passar pelo sistema do lab (substituir pelo nome da função do guião, ex: system3(x))
    y = system3(x, samplerate); 
    
    % Isolar a zona de regime permanente (segunda metade do sinal)
    idx_rp = t > 1;
    t_rp = t(idx_rp);
    x_rp = x(idx_rp);
    y_rp = y(idx_rp);
    
    % 1. Magnitude |H(jw)| = rácio entre picos máximos
    A_medido(i) = max(y_rp) / max(x_rp);
    
    % 2. Fase <H(jw) = -w * delta_t (diferença entre picos consecutivos)
    [~, idx_max_x] = max(x_rp);
    [~, idx_max_y] = max(y_rp);
    delta_t = t_rp(idx_max_y) - t_rp(idx_max_x);
    phi_medido(i) = -w * delta_t;
end

% Visualização dos diagramas de resposta em frequência
figure;
subplot(2,1,1);
plot(omegas, A_medido, 'o-', 'LineWidth', 1.5); grid on;
xlabel('\omega (rad/s)'); ylabel('|H(j\omega)|');
title('Magnitude da Resposta em Frequência');

subplot(2,1,2);
plot(omegas, phi_medido, 'o-', 'LineWidth', 1.5); grid on;
xlabel('\omega (rad/s)'); ylabel('\angle H(j\omega) (rad)');
title('Fase da Resposta em Frequência');