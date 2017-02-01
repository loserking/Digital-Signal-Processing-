function Xk = CZT(xn,N,M,KIND)
% input    xn: input sequence
%           N: length of the input sequence
%           M: length of the output sequence
%        KIND:  1 means forward CZT
%              -1 means inverse CZT
% output   Xk: CZT of the input sequence
if KIND == 1
    Xk=ForwardCZT(xn,N,M);
elseif KIND == -1
    xn=conj(xn);
    Xk=ForwardCZT(xn,N,M);
    Xk=(1/N)*conj(Xk);
end

%==========================================================================
function Xk = ForwardCZT(xn,N,M)

p=ceil(log2(N+M-1));
L=2^p;
n=0:N-1;
W=exp(-i*2*pi/N);

yn=xn.*W.^((n.^2)./2);
yn=[yn zeros(1,L-N)];
Yr=FFT(real(yn),imag(yn),L,p,1);

vn1= W.^(-(n.^2)./2);
vn2= W.^(-((-N+1:-1).^2)/2);
vn=[vn1 zeros(1,L-N-M+1) vn2];
Vr=FFT(real(vn),imag(vn),L,p,1);

Gr=Yr.*Vr;
gk=FFT(real(Gr),imag(Gr),L,p,-1);

Xk=gk(1:M).*W.^((n.^2)/2);
