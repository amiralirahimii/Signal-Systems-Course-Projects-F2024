[file, path] = uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}, 'Choose an Image');
image = imread([path, file]);
imshow(image);
p2fun(image);
