codedLetters = cell(2,32);
letters = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' ...
           'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' ' ' '.' ',' '!' '"' ';'];
numbers = 0:1:31;
binaryNums = dec2bin(numbers, 5);
for i=1:32
    codedLetters{1,i} = letters(i);
    codedLetters{2,i} = binaryNums(i, :);
end

fs = 100;
signal1x = coding_freq(codedLetters, 'signal', 1);
t = 0:1/fs:(size(signal1x, 2)-1)/fs;
plot(t, signal1x);
title("speed = 1");
signal5x = coding_freq(codedLetters, 'signal', 5);
t = 0:1/fs:(size(signal5x, 2)-1)/fs;
figure;
plot(t, signal5x);
title("speed = 5");


message1x = decoding_freq(codedLetters, signal1x, 1);
fprintf("decoded message for speed=1 signal is: %s\n", message1x);
message5x = decoding_freq(codedLetters, signal5x, 5);
fprintf("decoded message for speed=5 signal is: %s\n", message5x);

%adding noise with variance 0.0001
noiseSD= 0.01;
signal5x = coding_freq(codedLetters, 'signal', 5);
noise5 = noiseSD*randn(size(signal5x));
signal5x = signal5x + noise5;
signal1x = coding_freq(codedLetters, 'signal', 1);
noise1 = noiseSD*randn(size(signal1x));
signal1x = signal1x + noise1;
message1 = decoding_freq(codedLetters, signal1x, 1);
message5 = decoding_freq(codedLetters, signal5x, 5);
fprintf('noise standard derivation is: %.2f \n', noiseSD); 
fprintf('decoded message for speed 1: %s \n', message1);
fprintf('decoded message for speed 5: %s \n', message5);

%adding noise for part 2-6:

primaryMessage = 'signal';
noiseSDs = 0:0.02:3;
errors = zeros(size(noiseSDs));
lastSD1x = 0;
lastSD5x = 0;
for i=1:length(noiseSDs)
    noiseSD= noiseSDs(i);
    wrongFor1x = 0;
    wrongFor5x = 0;
    for j=1:100
        signal5x = coding_freq(codedLetters, primaryMessage, 5);
        noise5 = noiseSD*randn(size(signal5x));
        signal5x = signal5x + noise5;
        signal1x = coding_freq(codedLetters, primaryMessage, 1);
        noise1 = noiseSD*randn(size(signal1x));
        signal1x = signal1x + noise1;
        message1 = decoding_freq(codedLetters, signal1x, 1);
        message5 = decoding_freq(codedLetters, signal5x, 5);
        if(~strcmp(message1, primaryMessage))
            wrongFor1x = wrongFor1x + 1;
        end
        if(~strcmp(message5, primaryMessage))
            wrongFor5x = wrongFor5x + 1;
        end
    end
    errors(1,i) = wrongFor1x / 100;
    errors(2,i) = wrongFor5x / 100;
    if(errors(1,i) < 0.1)
        lastSD1x = noiseSD;
    end
    if(errors(2,i) < 0.1)
        lastSD5x = noiseSD;
    end
end

figure;
plot(noiseSDs, errors(1, :));
hold on;
plot(noiseSDs, errors(2, :));
legend('speed = 1', 'speed = 5');
title('added noise to signal');
xlabel('noise standard derivation');
ylabel('error');
grid on;

fprintf('last noise that we had less than 10%% error for speed = 1 is: %.2f\n' , lastSD1x);
fprintf('last noise that we had less than 10%% error for speed = 5 is: %.2f\n' , lastSD5x);

