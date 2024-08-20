function rectmax=findplate(image)
    bluestrip = imread('p3\bluestrip_big.png');
    bluestrip = imresize(bluestrip, [NaN 80]);
    bluestrips = generatebluestrips(bluestrip);
    totalmax=0;
    for i=1:30
        [maxcorrval,rect]=takecorr(bluestrips{1,i},image);
        if(maxcorrval>totalmax)
            totalmax=maxcorrval;
            rectmax=rect;
        end
    end
%     figure
%     imshow(image);
%     rectangle('Position',[rectmax(2) rectmax(1) rectmax(4) rectmax(3)],...
%             'EdgeColor','g','LineWidth',2);

    rectmax = [rectmax(1)-10
            rectmax(2)-10
            rectmax(3)+20
            rectmax(4)*13];
    figure
    imshow(image);
    rectangle('Position',[rectmax(2) rectmax(1) rectmax(4) rectmax(3)],...
        'EdgeColor','g','LineWidth',2);
end

function [maxcorrval, rect] = takecorr(template, image)
    Rcorrval1=normxcorr2(template(:,:,1),image(:,:,1));
    Gcorrval1=normxcorr2(template(:,:,2),image(:,:,2));
    Bcorrval1=normxcorr2(template(:,:,3),image(:,:,3));
    corrval=(Rcorrval1+Gcorrval1+Bcorrval1)/3;
    [maxcorrval,maxindex]=max(abs(corrval(:)));
    [X,Y] = ind2sub(size(corrval),maxindex);
    Xoffset = X - size(template,1);
    Yoffset = Y - size(template,2);
    rect = [Xoffset,Yoffset,size(template,1),size(template,2)];
end

function bluestrips = generatebluestrips(bluestrip)
    bluestrips=cell(1,40);
    for i=1:40
        bluestrips{i}=imresize(bluestrip,[NaN size(bluestrip,2)-2*i+2]);
    end
end