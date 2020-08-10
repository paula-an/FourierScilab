clc  // Limpa o console
clear  // Apaga as variáveis do "navegador de variáveis"
xdel(winsid())  // Apaga as janelas gráficas abertas

A = 10  // Amplitude do pulso
tau = 1  // Largura do pulso
H = -100:100  // Vetor de harmônicas a serem avaliadas 
nH = length(H)  // Número de harmônicas a serem avaliadas

// Laço para variar o período
for T = [5 10 15]  
    // Alocando espaço na memória
    c = zeros(nH, 1)  //Espectro de amplitudes
    f = zeros(nH, 1)  // Frequência da harmônica em Hz
    f0 = 1/T  // Frequência fundamental em Hz
    w0 = 2*%pi*f0  // Frequência angular fundamental em rad/s
    
    // Laço para variar a harmônica
    for i = 1:nH  
        n = H(i);
        f(i) = n*f0  // frequência da n-ésima harmônica
        c(i) = A*tau/T*abs(sinc(n*w0*tau/2))  // amplitude da n-ésima harmônica
    end
    // Resultados
    scf()  // Abre nova janela gráfica
    plot2d3('gnn',f,c)  // Gráfico 
    //
    f_cont = linspace(f(1), f(nH), 10000) // Frequência contínua em Hz
    w_cont = 2*%pi*f_cont // Frequência angular contínua
    c_cont = A*tau/T*abs(sinc(w_cont*tau/2))  // amplitude continua
    plot(f_cont, c_cont, '--', 'LineWidth', 3)  // Exibe espcetro de amplitude da transformada de Fourier do pulso
    mtlb_axis([-3 3 0 max(c_cont)])  // Limita a visualização de -1.5 a 1.5 Hz
    xlabel('Frequência (Hz)')
    ylabel('Amplitude')
end

