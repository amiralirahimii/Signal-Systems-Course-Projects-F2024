function customer_calling(number, baje)
    %loading the map set:
    folder='mapSet';
    filelist = dir(folder);
    mapSet=cell(2,size(filelist,1)-2);
    fs = 0;
    for i=3:size(filelist)
        filename=fullfile(folder,filelist(i).name);
        [mapSet{1,i-2}, fs] = audioread(filename);
        name=filelist(i).name;
        for j=1:length(name)
            if(name(j)=='.')
                break;
            end
        end
        mapSet{2,i-2}=name(1:j-1);
    end
    
    if(number > 99 || number < 1)
        fprintf('invalid number');
        return;
    end
    
    if(baje > 9 || baje < 1)
        fprintf('invalid number');
        return;
    end
    
    voice = [];
    for i=1:size(mapSet, 2)
        if(strcmp(mapSet{2,i}, 'shomareye'))
            voice = [voice mapSet{1,i}'];
        end
    end
    
    yekan = mod(number, 10);
    dahgan = floor(number/10)*10;
    if(dahgan ~= 0)
        for i=1:size(mapSet, 2)
            if(strcmp(mapSet{2,i}, string(dahgan)))
                voice = [voice mapSet{1,i}'];
            end
        end
        for i=1:size(mapSet, 2)
            if(strcmp(mapSet{2,i}, 'o'))
                voice = [voice mapSet{1,i}'];
            end
        end
    end
    for i=1:size(mapSet, 2)
        if(strcmp(mapSet{2,i}, string(yekan)))
            voice = [voice mapSet{1,i}'];
        end
    end
    for i=1:size(mapSet, 2)
        if(strcmp(mapSet{2,i}, 'bebajeye'))
            voice = [voice mapSet{1,i}'];
        end
    end
    
    for i=1:size(mapSet, 2)
        if(strcmp(mapSet{2,i}, string(baje)))
            voice = [voice mapSet{1,i}'];
        end
    end
    
    sound(voice , fs);
end