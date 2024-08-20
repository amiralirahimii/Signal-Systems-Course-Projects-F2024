[audio, fs] = audioread('a.wav');
audio = audio';

myAns = p2_2func(audio);

fprintf('Decoded number is: %s', myAns);


