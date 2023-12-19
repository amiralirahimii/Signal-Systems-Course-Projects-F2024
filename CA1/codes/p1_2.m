t=0:0.01:1;
z1=sin(2*pi*t);
z2=cos(2*pi*t);

x0=[0.5;0.25];
y0=[0.2;-0.8];
s=['sin(2 \pi t)'; 'cos(2 \pi t)'];

figure;

subplot(1,2,1)
plot(t,z1,'--b')
text(x0(1,1), y0(1,1), s(1,:))
title('Sin')
legend('sin')
xlabel('time')
ylabel('amplitude')
grid on

subplot(1,2,2)
plot(t,z2,'r')
text(x0(2,1), y0(2,1), s(2,:))
title('Cos')
legend('cos')
xlabel('time')
ylabel('amplitude')
grid on