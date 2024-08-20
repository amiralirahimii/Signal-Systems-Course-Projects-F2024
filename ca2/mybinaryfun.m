function binaryimage=mybinaryfun(grayimage,threshold)
    binaryimage=zeros(size(grayimage,1),size(grayimage,2));
    for i=1:size(grayimage,1)
        for j=1:size(grayimage,2)
            if(grayimage(i,j)<threshold)
                binaryimage(i,j)=0;
            else
                binaryimage(i,j)=1;
            end
        end
    end
    binaryimage=logical(binaryimage);
end