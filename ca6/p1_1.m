% p1_1 generating sent signal
tStart = 0;
tEnd = 1;
fs = 100;
t = tStart : 1/fs : tEnd - 1/fs;
fc = 5;
xSent = cos(2 * pi * fc * t);
figure;
plot(t, xSent);
title("Sent Signal");
grid on;

% p1_2 recieving signal

v = 180 / 3.6;
R = 250000;
beta = 0.3;
alpha = 0.5;
fd = beta * v;
C = 3e8;
P = 2 / C;
td =  P * R;
receivedSignal = alpha * cos(2 * pi * (fc+fd) * (t-td));
figure;
plot(t, receivedSignal);
title("Received Signal");
grid on;

% p1_3 finding values

fourier = fftshift(fft(receivedSignal));
[maxValue, maxIndex] = max(abs(fourier));
foundFd = abs(maxIndex - floor(fs / 2) - 1) - fc; 
foundV = foundFd / beta;
phase = angle(fourier);
foundTd = phase(maxIndex) / (2 * pi * (fd + fc));
foundR = foundTd * C / 2;
fprintf("estimated V(km/h): %f\n", foundV * 3.6);
fprintf("estimated R(km): %f\n", foundR / 1000);
% p1_4 adding noise

noise = randn(1, length(receivedSignal));
noisePower = 0:0.05:2;
vError = zeros(1, length(noisePower));
bestVNoisePower = 0;
rError = zeros(1, length(noisePower));
bestRNoisePower = 0;
threshold = 0.1;

for i = 1 : length(noisePower)
    thisNoisePower = noisePower(i);
    receivedSignal = alpha * cos(2 * pi * (fd + fc)*(t - td)) + thisNoisePower * noise;
    fourier = fftshift(fft(receivedSignal));
    [maxValue, maxIndex] = max(abs(fourier));
    foundFd = abs(maxIndex - floor(fs / 2) - 1) - fc; 
    phase = angle(fourier);
    foundTd = phase(maxIndex) / (2 * pi * (fd + fc));
    foundV = foundFd / beta;
    foundR = foundTd * C / 2;
    if (abs(foundV - v) < threshold * v)
        bestVNoisePower = thisNoisePower;
    end
    if (abs(foundR - R) < threshold * R)
        bestRNoisePower = thisNoisePower;
    end
    vError(i) = abs(foundV - v) * 3.6;
    rError(i) = abs(foundR - R) / 1000;
end

fprintf("last noise standard derivation for v is: %f\n", bestVNoisePower);
fprintf("last noise standard derivation for R is: %f\n", bestRNoisePower);

figure;
plot(noisePower, vError);
hold on
plot(noisePower, rError);
ylabel("error")
xlabel("noise standard derivation")
legend("v error", "R error")