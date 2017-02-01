function Z = DIF_FFT(X,Y,N,M,KIND)

if KIND == 1
    Z = ForwardFFT(X,Y,N,M);
elseif KIND == -1
    Z = ForwardFFT(X,-Y,N,M); % conjugate input
    Z = (1/N)*conj(Z); % conjuate output & divide by N
end

%==========================================================================
function Z = ForwardFFT(X,Y,N,M)

Wk=exp(-i*2*pi/N).^(0:N/2-1); % Wk(k+1)= exp(-j*2*pi*k/N), k=0,1,...,N/2-1
C=X+i*Y;
half=N/2;
for Section=1:M
	n=0;
        while(n<N-1)
            k=0;
            for loop=1:half
                % Butterfly
                temp=C(n+1)+C(n+1+half);
                C(n+1+half)=(C(n+1)-C(n+1+half))*Wk(k+1);
                C(n+1)=temp;
                
                k=k+2^(Section-1);
                n=n+1;
            end
            n=n+half;
        end
    half=half/2;
end
% without Bit Reversal
Z=C;
