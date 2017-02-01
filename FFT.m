function Z = FFT(X,Y,N,M,KIND)
% input     X: real part of the input sequence
%           Y: image part of the input sequence
%           N: length of the input sequecne
%           M: log2(N)
%        KIND:  1 means forward FFT
%              -1 means inverse FFT
% output    Z: FFT of the input sequence

if KIND == 1 % Forward FFT
    Z = ForwardFFT(X,Y,N,M);
elseif KIND == -1 % Inverse FFT
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

Z=complex(zeros(1,N));
for index=1:N
    % Bit Reversal
    Z(BitReversal(index-1,M)+1)=C(index);
end

%==========================================================================
function Y = BitReversal(X,BitNumber)
% Perform bit reversal
Y = 0;
for loop=1:BitNumber 
    Y = Y*2 + mod(X,2); % Y shift left 1 bit and add the right most bit of X
    X = floor(X/2);     % X shift right 1 bit
end