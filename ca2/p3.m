[file, path] = uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}, 'Choose an Image');
image = imread([path, file]);
image=imresize(image,[NaN 800]);
platebox = findplate(image);
if(platebox(2)+platebox(4)>size(image,2))
    image = image(platebox(1):platebox(1)+platebox(3),...
        platebox(2):size(image,2),:);
else
    image = image(platebox(1):platebox(1)+platebox(3),...
        platebox(2):platebox(2)+platebox(4),:);
end
%You can see any of wanted midprocess results by uncommenting p2fun
%comments
p2fun(image);