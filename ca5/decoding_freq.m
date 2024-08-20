function message = decoding_freq(mapSet, signal, speed)
    fs = 100;
    t = 0:1/fs:0.99;
    binarizedMessage = [];
    for i=1:fs:size(signal, 2)
        partSignal = signal(i:i+fs-1);
        [maxValue, maxIdx] = max(abs(fftshift(fft(partSignal))));
        maxIdx = fs/2 - maxIdx + 1;
        for j=1:(2^speed)
            if(maxIdx < floor(j*fs/(2^(speed+1)))+1)
                binarizedMessage = [binarizedMessage dec2bin(j-1, speed)];
                break;
            end
        end
    end
    message = [];
    for i=1:5:size(binarizedMessage,2)
        for j=1:size(mapSet,2)
            if(binarizedMessage(i:i+4)==mapSet{2,j})
                message = [message mapSet{1,j}];
            end
        end  
    end
end