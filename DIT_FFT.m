function Z = DIT_FFT(X,Y,N,M,KIND)

if KIND==1
    Z = ForwardFFT(X,Y,N,M);
elseif KIND==-1
    Z = ForwardFFT(X,-Y,N,M); % conjugate input
    Z = (1/N)*conj(Z); % conjuate output & divide N
end

%==========================================================================
function Z = ForwardFFT(X,Y,N,M)

Wk=exp(-i*2*pi/N).^(0:N/2-1); % Wk(k+1)= exp(-j*2*pi*k/N), k=0,1,...,N/2-1
half=1;
C=X+i*Y;

% without bit reversal
Z=C;

for Section = M:-1:1
	n=0;
        while(n<N-1)
            k=0;
            for loop=1:half
                % Butterfly
                temp= Z(n+1) + Z(n+1+half)*Wk(k+1);
                Z(n+1+half)= Z(n+1) - Z(n+1+half)*Wk(k+1);
                Z(n+1)=temp;
                
                k=k+2^(Section-1);
                n=n+1;
            end
            n=n+half; 
        end
    half=half*2;
end
