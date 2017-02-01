function zn = circular_convolution(xn,yn,N)

M=log2(N);
Xk=FFT(real(xn),imag(xn),N,M,1);
Yk=FFT(real(yn),imag(yn),N,M,1);
Zk=Xk.*Yk;
zn=FFT(real(Zk),imag(Zk),N,M,-1);
