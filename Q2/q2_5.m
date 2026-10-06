N = 20;
n = (-N:N)';

u = @(n) double(n >= 0);
deltaD = @(n) double(n == 0);

%Linearidade

x1 = u(n);          
x2 = u(n);

a = 3; b = -0.5;
x3 = a*x1 + b*x2;

y1 = system2(x1, n);
y2 = system2(x2, n);
y3 = system2(x3, n);

y3_expected = a*y1 + b*y2;

figure; 
stem(n, y3, 'filled'); hold on;
stem(n, y3_expected,'r'); hold off;
grid on;

% Invariância no Tempo

t0 = 2;

x1 = deltaD(n);
y1 = system2(x1, n);

x2 = deltaD(n-t0);
y2 = system2(x2, n);

figure; 
stem(n, y1, "filled"); hold on;
stem(n, y2,'r'); hold off;
grid on;


%  3 e 4) Memória e Causalidade

x_imp = deltaD(n);
y_imp = system2(x_imp, n);

figure; stem(n, y_imp); grid on;


%  5) Estabilidade


x_step = u(n);
y_step = system2(x_step, n);

figure; stem(n, y_step); grid on;

% 6) Invertibilidade

x_a = u(n);           
x_b = -u(n);          

y_a = system2(x_a, n);
y_b = system2(x_b, n);

figure;
subplot(2,1,1);
stem(n, x_a, 'filled'); hold on;
stem(n, x_b, 'r'); hold off;
grid on;
subplot(2,1,2);
stem(n, y_a, 'filled'); hold on;
stem(n, y_b, 'r'); hold off;
grid on;