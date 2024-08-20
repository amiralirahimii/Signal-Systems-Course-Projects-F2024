[file, path] = uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}, 'Choose Black and White Image');
image = imread([path, file]);
if(size(image, 3) ~= 1)
    image = rgb2gray(image);
end
codedLetters = cell(2,32);
letters = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' ...
           'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' ' ' '.' ',' '!' '"' ';'];
numbers = 0:1:31;
binaryNums = dec2bin(numbers, 5);
for i=1:32
    codedLetters{1,i} = letters(i);
    codedLetters{2,i} = binaryNums(i, :);
end

subplot(1,2,1);
imshow(image);
codedImage = coding('signal', image, codedLetters);
subplot(1,2,2);
imshow(codedImage);

message = decoding(codedImage, codedLetters);
fprintf('%s', message);