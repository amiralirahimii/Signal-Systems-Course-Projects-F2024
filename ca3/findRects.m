function findRects(PCBImage, ICImage)
    rotatedIC = imrotate(ICImage, 180);
    corrThr = 0.93;
    foundIdx = [];
    for i=1:size(PCBImage,1)-size(ICImage,1)
        for j=1:size(PCBImage,2)-size(ICImage,2)
            takeICSizeOut=PCBImage(i:i+size(ICImage,1)-1,j:j+size(ICImage,2)-1, :);
            corrValueR = normCorr2D(ICImage(:,:,1), takeICSizeOut(:,:,1));
            corrValueG = normCorr2D(ICImage(:,:,2), takeICSizeOut(:,:,2));
            corrValueB = normCorr2D(ICImage(:,:,3), takeICSizeOut(:,:,3));
            corrValue = (corrValueR+corrValueG+corrValueB)/3;
            rotatedCorrValueR = normCorr2D(rotatedIC(:,:,1), takeICSizeOut(:,:,1));
            rotatedCorrValueG = normCorr2D(rotatedIC(:,:,2), takeICSizeOut(:,:,2));
            rotatedCorrValueB = normCorr2D(rotatedIC(:,:,3), takeICSizeOut(:,:,3));
            rotatedCorrValue=(rotatedCorrValueR+rotatedCorrValueG+rotatedCorrValueB)/3;
            if((corrValue > corrThr) || (rotatedCorrValue > corrThr))
                foundIdx = [foundIdx [i; j]];
            end
        end
    end
    subplot(1,2,1);
    imshow(PCBImage);
    subplot(1,2,2);
    imshow(ICImage);
    figure;
    imshow(PCBImage);
    for i=1:size(foundIdx, 2)
        rect = [foundIdx(2,i)
                foundIdx(1,i)
                size(ICImage, 2)
                size(ICImage, 1)];
        rectangle('Position', rect, 'EdgeColor','g','LineWidth',2);
    end
end