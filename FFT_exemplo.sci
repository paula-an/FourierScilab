clc  // Limpa o console
clear  // Apaga as variáveis do "navegador de variáveis"
xdel(winsid())  // Apaga as janelas gráficas abertas

//
// Taxa de amostragem
ts = 10000  // [Hz]
//
// Tempo discreto
t = 0:1/ts:0.1  // [s]
//
// Número de amostras
N = length(t)
//
// Frequências associadas:
// A resposta da FFT é simétrica deve-se exibir 
// apenas a primeira metade dos pontos (N/2)
freq_vec = ts*(0:(N/2))/N  // [Hz]
freq_n = length(freq_vec)  // Número de frequências a serem exibidas
//
// f(t)
ft = 10*sin(2*%pi*60*t)+5*sin(2*%pi*180*t)
//
// Aplicando a transformada de Fourier no sinal f(t)
Fw = fft(ft)
// Aplicando a função abs() (módulo) e eliminando metade do sinal 
Fw = abs(Fw(1:freq_n))
// Corrigindo a amplitude do sinal no domínio da frequência
Fw = 2*Fw/N;

//
// Resultados

// Sinal no domínio do tempo - f(t)
scf()
plot(t, ft, 'LineWidth', 2)
xlabel('Tempo (s)')
ylabel('Amplitude')
xgrid()

// Sinal no domínio da frequência - F(w)
scf()
plot(freq_vec, Fw, 'LineWidth', 2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
mtlb_axis([0 500 0 max(Fw)])
xgrid()
