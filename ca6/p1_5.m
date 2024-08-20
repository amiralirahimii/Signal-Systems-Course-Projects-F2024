t_start = 0;
t_end = 1;
fc = 5;
fs = 100;
C = 3e8;
P = 2 / C;
beta = 0.3;

t = t_start: 1/fs: t_end-1/fs;
alpha1 = 0.5;
R1 = 250e3;
v1 = 180 / 3.6;
fd1 = beta * v1;
td1 = P * R1;

alpha2 = 0.6;
R2 = 200e3;
v2 = 216 / 3.6;
fd2 = beta * v2;
td2 = P * R2;

x_received = alpha1 * cos(2 * pi * (fd1 + fc) * (t - td1)) + alpha2 * cos(2 * pi * (fd2 + fc) * (t - td2));
figure;
plot(t, x_received);
title("Received wave")
grid on

fourier = fftshift(fft(x_received));
[pks, locs] = findpeaks(abs(fourier));
[pks, idx] = sort(pks, 'descend');
locs = locs(idx);
fds = zeros(1, 2);
tds = zeros(1, 2);
phase = angle(fourier);

for i = 1:2
    fds(i) = abs(locs(2*i) - fs/2 - 1) - fc;
    tds(i) = abs(phase(locs(2*i))) / (2 * pi * (fds(i) + fc));
end
vs = zeros(1, 2);
Rs = zeros(1, 2);
for i = 1:2
    vs(i) = fds(i) / beta;
    Rs(i) = tds(i) / P;
end
fprintf("R(1) = %f(km), v(1) = %f(km/h)\n", Rs(1) / 1000, vs(1) * 3.6);
fprintf("R(2) = %f(km), v(2) = %f(km/h)\n", Rs(2) / 1000, vs(2) * 3.6);