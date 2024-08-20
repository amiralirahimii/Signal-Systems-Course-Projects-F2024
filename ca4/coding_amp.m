function signal = coding_amp(mapSet, message, speed)
    binarizedMessage = [];
    for i=1:size(message,2)
        for j=1:size(mapSet,2)
            if(message(1,i)==mapSet{1,j})
                binarizedMessage = [binarizedMessage mapSet{2,j}];
            end
        end
    end
    signal = [];
    fs = 100;
    t = 0:1/fs:0.99;
    for i=1:speed:size(binarizedMessage, 2)
        this = binarizedMessage(i:i+speed-1);
        appendSignal = 1/(2^speed-1)*sin(2*pi*t) * bin2dec(this);
        signal = [signal appendSignal];
    end
end