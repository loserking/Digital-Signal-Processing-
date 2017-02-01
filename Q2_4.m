function Q2_4(T,N)

dt=T/N; 
df=1/dt;
t=(0:N-1)*dt;
g=exp(-t);
G=FFT(g,zeros(1,N),N,log2(N),1);
G=G./G(1); % normalize
f=0:1/T:df-1/T;
correct=1./(1+j*2*pi*f);

figure;
subplot(2,2,1); plot(f,real(G),f,real(correct));
title('Real part of G(f)');legend('FFT','Correct');
subplot(2,2,2);
plot(f,imag(G),f,imag(correct));
title('Image part of G(f)');legend('FFT','Correct');
subplot(2,2,3);
plot(f,abs(G),f,abs(correct));
title('Amplitude part of G(f)');legend('FFT','Correct');
subplot(2,2,4);
plot(f,angle(G),f,angle(correct));
title('Phase part of G(f)');legend('FFT','Correct');
