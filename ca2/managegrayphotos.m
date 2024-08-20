%this file is NOT important and is made to generate mapsets and different images 
%that are needed
%%%%%%%%%%%%%%%%%%%%%%%%%%

% folder='p3\b';
% filelist = dir(folder);
% mapset=cell(2,size(filelist,1)-2);
% for i=3:size(filelist)
%     filename=fullfile(folder,filelist(i).name);
%     mapset{1,i-2}=imread(filename);
%     mapset{2,i-2}=filelist(i).name;
% end

image=imread('p3\bluestrips\bluestrip.png');
func3(image);

% func1(mapset);

function func1(mapset)
    for i=1:size(mapset,2)
    image = mapset{1,i};
    threshold= 255*graythresh(image);
    binaryimage=mybinaryfun(image,threshold);
    imwrite(binaryimage, mapset{2,i});
    end
end

function func2(mapset)
    for i=1:size(mapset,2)
        image = mapset{1,i};
        image = imresize(image, [84 48]);
        imwrite(image, mapset{2,i});
    end
end

function func3(image)
    for i=1:30
        newimage=imresize(image,[size(image,1)-i,NaN]);
        imwrite(newimage,sprintf('p3\bluestrips\bluestrip%d.png',i));
    end
end