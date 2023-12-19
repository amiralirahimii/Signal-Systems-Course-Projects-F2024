function p4_3(voice,speed,fq)
    if(speed==2)
        newVoice = zeros(round(size(voice,1)/2),2);
        for i=1:size(newVoice,1)
            newVoice(i)=voice(2*i);
        end
        sound(newVoice,fq);
    elseif(speed==0.5)
        newVoice = zeros(size(voice,1)*2,2);
        for i=1:size(voice,1)
            
            newVoice(2*i-1)=voice(i);
            newVoice(2*i)=(voice(i)+voice(i+1))/2;
        end
        sound(newVoice,fq);
    else
        fprintf('Error In Value Of Speed');
    end
    
end