fileName = 'voice.wav';
[x,fq]=audioread(fileName);

fprintf('the frequence is %d', fq);

plot(x);
xlabel('1/48000s');
%sound(x, fq);

audiowrite('x.wav',x,fq);

%p4_3(x,0.5,fq);

p4_4(x,0.7,fq);