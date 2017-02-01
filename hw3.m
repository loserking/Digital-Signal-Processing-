xn_in=1:17;
Xk=CZT(xn_in,17,17,1);
xn_out=CZT(Xk,17,17,-1);
disp('input sequence =');disp(round(real(xn_in)));
disp('CZT of the input sequence =');disp(Xk);
disp('output sequence =');disp(round(real(xn_out)));

xn_in=1:23;
Xk=CZT(xn_in,23,23,1);
xn_out=CZT(Xk,23,23,-1);
disp('input sequence =');disp(round(real(xn_in)));
disp('CZT of the input sequence =');disp(Xk);
disp('output sequence =');disp(round(real(xn_out)));
 