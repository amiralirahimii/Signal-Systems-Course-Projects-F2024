function codedPic = coding(message, grayImage, mapSet)
    wordBinaryLength = size(mapSet{2,1}, 2);
    pixelsNeeded = wordBinaryLength * size(message, 2);
    totalPixels = size(grayImage,1) * size(grayImage, 2);
    if(pixelsNeeded > totalPixels)
        codedPic = NaN;
        return;
    end
    binarizedMessage = [];
    for i=1:size(message,2)
        for j=1:size(mapSet,2)
            if(message(1,i)==mapSet{1,j})
                binarizedMessage = [binarizedMessage mapSet{2,j}];
            end
        end
    end
    
    for i=1:size(binarizedMessage, 2)
        [row, col] = ind2sub(size(grayImage), i);
        pixel = grayImage(row,col);
        binPix = dec2bin(pixel, 8);
        binPix(8) = binarizedMessage(1,i);
        grayImage(row,col) = bin2dec(binPix);
    end
    
    codedPic = grayImage;
end