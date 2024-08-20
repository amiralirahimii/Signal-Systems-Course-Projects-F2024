function message = decoding_amp(mapSet, signal, speed)
    fs = 100;
    t = 0:1/fs:0.99;
    genSin = sin(2*pi*t);
    corrValues = [];
    
    for i=1:fs:size(signal, 2)
        partSignal = signal(i:i+fs-1);
        corr = dot(genSin, partSignal);
        corrValues = [corrValues 2/100*corr];
    end
    
    edges = zeros(1, 2^speed-1);
    for i=0:2^speed-2
        edges(i+1) = i + 1/2;
    end
    
    binarizedMessage = [];
    for i=1:size(corrValues, 2)
        corrVal = corrValues(i) * (2^speed - 1);
        findEx = 2^speed-1;
        for j=1:size(edges, 2)
            if(corrVal < edges(j))
                findEx = j-1;
                break;
            end
        end
        binarizedMessage = [binarizedMessage dec2bin(findEx, speed)];
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