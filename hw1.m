close all;
% HW1-1
a1=1.3711242;
a2=0.93906244;
v=0:0.01:1;
z=exp(j*pi*v);
H=0.5*((1+a2)-2*a1*z.^(-1)+(1+a2)*z.^(-2))./(1-a1*z.^(-1)+a2*z.^(-2));

figure;
subplot(2,1,1); plot(v,abs(H));
title('Amplitude of H(v)');
subplot(2,1,2); plot(v,angle(H));
title('Phase of H(v)');

% HW1-2
F0=1250;
dt=0.0001;
t=0:dt:0.02-dt;
length_t=length(t);
% y[n]=a1*y[n-1]-a2*y[n-2]+0.5*(1-a2)*x[n]-a1*x[n-1]+0.5*(1+a2)*x[n-2]
% (a) input frequency = F0
x=sin(2*pi*F0*t);
y=zeros(1,length_t);
n=1;
y(n)=0.5*(1+a2)*x(n);
n=2;
y(n)=a1*y(n-1)+0.5*(1+a2)*x(n)-a1*x(n-1);
for n=3:length_t
    y(n)=a1*y(n-1)-a2*y(n-2)+0.5*(1+a2)*x(n)-a1*x(n-1)+0.5*(1+a2)*x(n-2);
end
figure;
subplot(2,1,1);plot(x);
title('x[n]');xlabel('n');
subplot(2,1,2);plot(y);
title('y[n]');xlabel('n');
% (b) input frequency = F0*2
x=sin(2*pi*2*F0*t); 
y=zeros(1,length_t);
n=1;
y(n)=0.5*(1+a2)*x(n);
n=2;
y(n)=a1*y(n-1)+0.5*(1+a2)*x(n)-a1*x(n-1);
for n=3:length_t
    y(n)=a1*y(n-1)-a2*y(n-2)+0.5*(1+a2)*x(n)-a1*x(n-1)+0.5*(1+a2)*x(n-2);
end
figure;
subplot(2,1,1);plot(x);
title('x[n]');xlabel('n');
subplot(2,1,2);plot(y);
title('y[n]');xlabel('n');

% HW1-3
F0=1250;
dt=0.0001;
t=0:dt:0.02-dt;
length_t=length(t);
% input frequency = 2*F0 + F0
x=sin(2*pi*2*F0*t)+sin(2*pi*F0*t);
y=zeros(1,length_t);
n=1;
y(n)=0.5*(1+a2)*x(n);
n=2;
y(n)=a1*y(n-1)+0.5*(1+a2)*x(n)-a1*x(n-1);
for n=3:length_t
    y(n)=a1*y(n-1)-a2*y(n-2)+0.5*(1+a2)*x(n)-a1*x(n-1)+0.5*(1+a2)*x(n-2);
end
figure;
subplot(2,1,1);plot(x);
title('x[n]');xlabel('n');
subplot(2,1,2);plot(y);
title('y[n]');xlabel('n');
