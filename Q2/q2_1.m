samplerate = 16e3;

[x,samplerate] = audioread('echoin.wav');

system1 = @(x) filter([1 zeros(1, round(0.6*samplerate) - 1) 0.5],1,x);
%t = (-4:1/samplerate:4)';

u = @(t) double(t >= 0);

%x = u(t) - u(t-2);
y = system1(x);
%plot(t,y); grid on

soundsc(y, samplerate);

% ouve se "hasta la vista baby" com algum eco de volume ligeiramente menor

% Observa se na figura vários impulsos que ao longo do tempo vão
% aumentando em número e diminuindo em intensidade
% No início os impulsos
% são maiores e menos
% frequentes pois ainda se preserva o impulso original, e ao longo do tempo
% vão aumentando e
% ficando menos
% intensos por começarem a haver mais impulsos originados pelo eco a serem
% repitidos por eco, e como a cada repetição o impulso perde intensidade,
% cada repetição terá sempre intensidade progressivamente menor
