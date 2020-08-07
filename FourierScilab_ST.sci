clc  // Limpa o console
clear  // Apaga as variáveis do "navegador de variáveis"
xdel(winsid())  // Apaga as janelas gráficas abertas

A = 10  // Amplitude do pulso
tau = 1  // Largura do pulso
H = -100:100  // Vetor de harmônicas a serem avaliadas 
nH = length(H)  // Número de harmônicas a serem avaliadas
disp(H)
for T = [5 10 20]  // Laço para variar o período
    disp(T)
    c = zeros(nH, 1)  // Alocando espaço para armazenar o espectro de amplitudes
    f = zeros(nH, 1)  // Alocando espaço para armazenar a frequência da harmônica em Hz 
    for i = 1:nH  // Laço para variar a harmônica
        n = H(i);
        f(i) = n/T  // frequência da n-ésima harmônica
        w = 2*%pi*f(i) // Frequência angular da n-ésima harmônica
        c(i) = 2*A*tau/T*abs(sinc(w*tau))  // amplitude da n-ésima harmônica
    end
    // Resultados
    scf()  // Abre nova janela gráfica
    plot2d3('gnn',f,c)  // Gráfico 
    //
    F = linspace(H(1), H(nH), 1000)/T  // Frequência contínua em Hz
    W = 2*%pi*F // Frequência angular contínua
    C = 2*A*tau/T*abs(sinc(2*%pi*F*tau))  // amplitude continua
    plot(F, C, '--')  // Exibe espcetro de amplitude da transformada de Fourier do pulso
    mtlb_axis([-1.5 1.5 0 max(C)])  // Limita a visualização de -1.5 a 1.5 Hz
    xlabel('Frequência (Hz)')
    ylabel('Amplitude')
end
