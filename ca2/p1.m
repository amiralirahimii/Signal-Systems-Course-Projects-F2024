[file, path] = uigetfile({'*.jpg;*.bmp;*.png;*.tif'}, 'Choose an Image');
image = imread([path, file]);
% figure
% imshow(image);

image = imresize(image,[300 500]);
% figure
% imshow(image);

grayimage=mygrayfun(image);
% figure
% imshow(grayimage);

threshold= 255*graythresh(grayimage);
binaryimage=~mybinaryfun(grayimage,threshold);
% figure
% imshow(binaryimage);

cleanimage=myremovecom(binaryimage,400);
% figure;
% imshow(cleanimage);

background=myremovecom(binaryimage,2300);
% figure;
% imshow(background);

finalimage=logical(cleanimage-background);
% figure;
% imshow(finalimage);

[label,num]=mysegmentation(finalimage);
figure;
imshow(finalimage);
for i = 1:num
    [row,col]=find(label==i);
    thissegment=finalimage(min(row):max(row),min(col):max(col));
    rectangle('Position', [min(col),min(row),max(col)-min(col),max(row)-min(row)], 'EdgeColor', 'g', 'LineWidth', 2);
end

%loading the map set:
folder='p1\MapSet';
filelist = dir(folder);
mapset=cell(2,size(filelist,1)-2);
for i=3:size(filelist)
    filename=fullfile(folder,filelist(i).name);
    mapset{1,i-2}=imread(filename);
    mapset{2,i-2}=filelist(i).name(1);
end
corrthreshold = 750;
result=[];
for i=1:num
    [row,col]=find(label==i);
    thissegment=finalimage(min(row):max(row),min(col):max(col));
    thissegment=imresize(thissegment,[42 24]);
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