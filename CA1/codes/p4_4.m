function p4_4(voice, speed, fq)
    newVoiceLength =round(length(voice)/speed);
    newVoice = zeros(newVoiceLength, 2);
    newVoice(1) = 1;
    for i=2:newVoiceLength
        newVoice(i)=(voice(floor(i*speed))+voice(ceil(i*speed)))/2;
    end
        sound(newVoice, fq);
end