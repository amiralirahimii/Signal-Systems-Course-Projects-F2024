fs = 20;
tstart = 0;
tend = 1;
t = tstart:1/fs:tend-1/fs;
N = length(t);
f = -fs/2:fs/N:fs/2-fs/N;
x1 = exp(1i*2*pi*5*t) + exp(1i*2*pi*8*t);
y1 = fftshift(fft(x1));
y1 = y1 / max(abs(y1));
subplot(1,2,1);
plot(f, abs(y1));
grid on;
title("5HZ and 8HZ signal");
xlabel("Frequency");
ylabel("Magnitude");
xlim([0 10]);
subplot(1,2,2);
plot(f, angle(y1));
grid on;
title("5HZ and 8HZ signal");
xlabel("Frequency");
ylabel("Angle");
x2 = exp(1i*2*pi*5*t) + exp(1i*2*pi*5.1*t);
y2 = fftshift(fft(x2));
y2 = y2 / max(abs(y2));
figure;
subplot(1,2,1);
plot(f, abs(y2));
grid on;
title("5HZ and 5.1HZ signal");
xlabel("Frequency");
ylabel("Magnitude");
xlim([0 10]);
subplot(1,2,2);
plot(f, angle(y2));
grid on;
title("5HZ and 5.1HZ signal");
xlabel("Frequency");
ylabel("Angle");