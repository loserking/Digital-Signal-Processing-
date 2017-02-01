% Homework 2
close all;

% 2.1 see FFT.m

% 2.2
xn=[1,2,3,4,5,6,7,8];
yn=[2,3,5,6,1,9,8,7];
hn=[1,2,3,3,2,2,1,2];
% 2.2.a circular convolution
zn=circular_convolution(hn,xn,8);
disp('circular convolution :');
disp(round(real(zn)));
% 2.2.b normal convolution
zn=circular_convolution([hn,zeros(1,8)],[yn,zeros(1,8)],16);
disp('normal convolution :');
disp(round(real(zn)));

% 2.3
xn_in=[1,2,3,4,5,6,7,8];
Xk=DIF_FFT(xn_in,zeros(1,8),8,3,1);
xn_out=DIT_FFT(real(Xk),imag(Xk),8,3,-1);
disp('xn_in = ');disp(abs(xn_in));
disp('xn_out = ');disp(abs(xn_out));

% 2.4
Q2_4(8,16);
Q2_4(8,32);
Q2_4(8,64);


