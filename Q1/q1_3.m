% Frequência de amostragem
samplerate = 1e3;

% Frequências calculadas das notas (em Hz)
f_B2 = 123.471;
f_C3 = 130.813;
f_D3 = 146.832;
f_E3 = 164.814;
f_G3 = 195.997;

% Construção da sequência usando a função seqsin
x = seqsin(samplerate, ...
    0, 0.7, ...        % R(0.7)
    f_E3, 0.4, ...     % E3(0.4)
    0, 0.3, ...        % R(0.3)
    f_E3, 0.3, ...     % E3(0.3)
    f_G3, 0.4, ...     % G3(0.4)
    f_E3, 0.4, ...     % E3(0.4)
    f_D3, 0.3, ...     % D3(0.3)
    f_C3, 0.8, ...     % C3(0.8)
    0, 0.2, ...        % R(0.2)
    f_B2, 0.8, ...     % B2(0.8)
    0, 0.2, ...        % R(0.2)
    f_E3, 0.4, ...     % E3(0.4)
    0, 0.3, ...        % R(0.3)
    f_E3, 0.3, ...     % E3(0.3)
    f_G3, 0.4, ...     % G3(0.4)
    f_E3, 0.4, ...     % E3(0.4)
    f_D3, 0.3, ...     % D3(0.3)
    f_C3, 0.4, ...     % C3(0.4)
    f_D3, 0.4, ...     % D3(0.4)
    f_C3, 0.3, ...     % C3(0.3)
    f_B2, 0.3, ...     % B2(0.3)
    0, 0.7);           % R(0.7)

% Reproduzir o som resultante
soundsc(x, samplerate);