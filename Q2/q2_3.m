load fingerprint.mat

mic = [2.5 2.5 2];      %posição do recetor
n = 12;
r = 0.9;            %refletividade das paredes
rm = [5 5 4];     %tamanhoda sala
src = [0 0 2];      %posição do source
h = rir(samplerate, mic, n, r, rm, src);

y1 = conv(h,x);
soundsc(y1,samplerate);

%pause(6);

mic = [10 7.5 5];      %posição do recetor
n = 12;
r = 0.9;            %refletividade das paredes
rm = [20 15 10];     %tamanhoda sala
src = [0 0 2];      %posição do source  
h = rir(samplerate, mic, n, r, rm, src);

y2 = conv(h,x);
%soundsc(y2,samplerate);

plot(y);
figure

plot(y1); 

figure

plot(y2); 


% Chega se à conclusão que a
% sala mais provável é a sala
% pequena, visto que o
% gráfico se assemelha muito
% mais ao do fingerprint.mat do que na sala grande


