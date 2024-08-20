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

signal3x = coding_amp(codedLetters, 'signal', 3);
t1 = 0:1/fs:(size(signal3x, 2)-1)/fs;
plot(t1,signal3x);
title('speed = 3');
signal2x = coding_amp(codedLetters, 'signal', 2);
t2 = 0:1/fs:(size(signal2x, 2)-1)/fs;
figure;
plot(t2,signal2x);
title('speed = 2');
signal1x = coding_amp(codedLetters, 'signal', 1);
t3 = 0:1/fs:(size(signal1x, 2)-1)/fs;
figure;
plot(t3,signal1x);
title('speed = 1');

message1 = decoding_amp(codedLetters, signal3x, 3);
message2 = decoding_amp(codedLetters, signal2x, 2);
message3 = decoding_amp(codedLetters, signal1x, 1);
fprintf('decoded message for speed 3: %s \n', message1);
fprintf('decoded message for speed 2: %s \n', message2);
fprintf('decoded message for speed 1: %s \n', message3);
