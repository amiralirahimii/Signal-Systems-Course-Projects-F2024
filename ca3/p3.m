[PCBfile, PCBpath] = uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}, 'Choose PCB Image');
PCBImage = imread([PCBpath, PCBfile]);
[ICfile, ICpath] = uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}, 'Choose IC Image');
ICImage = imread([ICpath, ICfile]);

findRects(PCBImage, ICImage)