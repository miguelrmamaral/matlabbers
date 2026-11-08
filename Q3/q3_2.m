figure; hold on;
for N = 1:5
    % Order of the Fourier expansion (cálculo de xN mantido igual)
    xN = exp(1i*w0*t*(-N:N))*[ak(-N:-1) a0 ak(1:N)].';
    
    % Função fornecida pelo guião para visualização do espetro
    [XN,f] = cftransform(xN,find(t == 0), 1e4, samplerate);
    plot(f, abs(XN));
end
grid on;
xlim([-500 1000]); % Zoom