myAudio = [];
myNums = '43218765';
for i=1:size(myNums, 2)
    myAudio = generateTon(myNums(i), myAudio);
    myAudio = generateToff(myAudio);
end
sound(myAudio, 8000);
audiowrite('y.wav', myAudio, 8000);

% testing written p2_2 function
[audio, fs] = audioread('y.wav');
audio = audio';
myAns = p2_2func(audio);
fprintf('Decoded number is: %s', myAns);