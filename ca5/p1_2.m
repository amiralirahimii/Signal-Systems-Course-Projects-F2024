fs = 100;
tstart = 0;
tend = 1;
t = tstart:1/fs:tend-1/fs;
N = length(t);
f = -fs/2:fs/N:fs/2-fs/N;

x1 = cos(30*pi*t + pi/4);
plot(f, x1);
grid on;
title("cos(30*pi*t + pi/4)");

figure;
y = fftshift(fft(x1));
y = y / max(abs(y));
plot(f, abs(y));
grid on;
title("cos(30*pi*t + pi/4)");
xlabel("Frequency");
ylabel("Magnitude");
xlim([-20 20]);

figure;
tol = 1e-6;
y(abs(y) < tol) = 0;
theta = angle(y);
plot(f,theta/pi);
grid on;
title("cos(30*pi*t + pi/4)");
xlabel 'Frequency (Hz)'
ylabel 'Phase / \pi'
xlim([-20 20]);