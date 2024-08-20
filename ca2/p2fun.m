function p2fun(image)
    figure
    imshow(image);

    image = imresize(image,[NaN 800]);
    figure
    imshow(image);

    grayimage=mygrayfun(image);
    figure
    imshow(grayimage);

    threshold= 255*graythresh(grayimage);
    binaryimage=~mybinaryfun(grayimage,threshold-4);
    figure
    imshow(binaryimage);

    cleanimage=myremovecom(binaryimage,380);
    figure;
    imshow(cleanimage);
    background=myremovecom(binaryimage,7000);
    figure;
    imshow(background);
    finalimage=logical(cleanimage-background);
%     for i = 1:size(components, 2)
%         rectangle('Position', components(i).BoundingBox, 'EdgeColor', 'g', 'LineWidth', 2)
%     end
    figure;
    imshow(finalimage);

    [label,num]=mysegmentation(finalimage);
    %loading the map set:
    folder='p2\mapSet';
    filelist = dir(folder);
    mapset=cell(2,size(filelist,1)-2);
    for i=3:size(filelist)
        filename=fullfile(folder,filelist(i).name);
        mapset{1,i-2}=imread(filename);
        name=filelist(i).name;
        for j=1:length(name)
            if(name(j)=='.')
                break;
            end
        end
        mapset{2,i-2}=name(1:j-1);
    end
    corrthreshold = 3450;
    result=[];
    for i=1:num
        [row,col]=find(label==i);
        thissegment=finalimage(min(row):max(row),min(col):max(col));
        thissegment=imresize(thissegment,[84 48]);
        corr=zeros(1,size(mapset,2));
        for j=1:size(mapset,2)
            newmat=~bitxor(thissegment,mapset{1,j});
            corr(j)=sum(newmat,'all');
        end
        [corrval,index]=max(corr);
        if(corrval>corrthreshold)
            result=[result mapset{2,index}];
        end
    end
    fprintf('%s',result);
    file = fopen('number_Plate.txt', 'wt');
    fprintf(file,'%s\n',result);
    fclose(file);
end