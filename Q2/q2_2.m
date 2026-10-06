samplerate = 16e3;

mic = [1 2 1];      %posição do recetor
n = 12;
r = 0.1;            %refletividade das paredes
rm = [15 15 5];     %tamanhoda sala
src = [5 5 2];      %posição do source
h = rir(samplerate, mic, n, r, rm, src);

[x,samplerate] = audioread('echoin.wav');
y = conv(h,x);
soundsc(y,samplerate);


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

% Ao aumentar o tamanho da sala e afastar-se o emissor do recetor,
% regista-se uma diferença especialmente no desfazamento dos ecos em 
% relação ao áudio original (mantendo r=0.7)
% Ao aumentar se a
% refletividade das
% paredes, também se nota que a intensidade dos ecos aumenta em relação à
% refletividade 0.7 inicial, provocando um som bastante mais alterado,
% enquanto que ao diminuir, o
% eco vai desaparecendo (em r=0.1 já é impercetível, mediante os restantes
% valores serem os dados no guia)