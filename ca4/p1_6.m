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
noisePower = 1.5;
signal3x = coding_amp(codedLetters, 'signal', 3);
noise3 = noisePower*randn(size(signal3x));
signal3x = signal3x + noise3;
signal2x = coding_amp(codedLetters, 'signal', 2);
noise2 = noisePower*randn(size(signal2x));
signal2x = signal2x + noise2;
signal1x = coding_amp(codedLetters, 'signal', 1);
noise1 = noisePower*randn(size(signal1x));
signal1x = signal1x + noise1;

t1 = 0:1/fs:(size(signal3x, 2)-1)/fs;
% plot(t1,signal3x);
% title('speed = 3');
message1 = decoding_amp(codedLetters, signal3x, 3);
message2 = decoding_amp(codedLetters, signal2x, 2);
message3 = decoding_amp(codedLetters, signal1x, 1);
fprintf('noise power is: %f \n', noisePower); 
fprintf('decoded message for speed 3: %s \n', message1);
fprintf('decoded message for speed 2: %s \n', message2);
fprintf('decoded message for speed 1: %s \n', message3);