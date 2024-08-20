function message = decoding(codedImage, mapSet)
    endChar = ';';
    endCharBin = '00000';
    for i=1:size(mapSet,2)
        if(mapSet{1,i} == endChar)
            endCharBin = mapSet{2,i};
        end
    end
    
    binarizedMessage = [];
    stop = false;
    for j=1:size(codedImage, 2)
        if(stop == true)
            break;
        end
        for i=1:size(codedImage, 1)
            pixel = codedImage(i, j);
            binPix = dec2bin(pixel, 8);
            binarizedMessage = [binarizedMessage, binPix(8)];
            if(mod(size(binarizedMessage,2), 5) == 0)
                sz = size(binarizedMessage,2);
                if(binarizedMessage(1,sz-4:sz) == endCharBin)
                    stop = true;
                    break;
                end
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