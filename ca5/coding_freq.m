function coded = coding_freq(mapSet, message, speed)
    fs = 100;
    
    binarizedMessage = [];
    for i=1:size(message,2)
        for j=1:size(mapSet,2)
            if(message(1,i)==mapSet{1,j})
                binarizedMessage = [binarizedMessage mapSet{2,j}];
            end
        end
    end
    signal = [];
    t = 0:1/fs:0.99;
    for i=1:speed:size(binarizedMessage, 2)
        this = binarizedMessage(i:i+speed-1);
        freq = floor(fs/(2^(speed+2))) + floor(bin2dec(this)*(fs/(2^(speed+1)))) + 1;
        appendSignal = sin(2*pi*freq*t);
        signal = [signal appendSignal];
    end
    coded = signal;
end