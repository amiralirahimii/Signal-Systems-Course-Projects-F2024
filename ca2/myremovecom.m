function cleanimage=myremovecom(binaryimage,n)
    [row,col]=find(binaryimage==1);
    nodes=[row';col'];
    objectSet={};
    explored=false(size(binaryimage));
    adjRow=[1,1,1,0,0,-1,-1,-1];
    adjCol=[-1,0,1,-1,1,-1,0,1];
    for i=1:size(nodes,2)
        object=[];
        myQueue=[];
        if(explored(nodes(1,i),nodes(2,i))==false)
            explored(nodes(1,i),nodes(2,i))=true;
            object=nodes(:,i);
            myQueue=nodes(:,i);
        else
            continue;
        end
        
        while size(myQueue,2)
            X = myQueue(1,1);
            Y = myQueue(2,1);
            myQueue(:,1)=[];
            
            
            for j=1:size(adjRow,2)
                if((X+adjRow(j)>0) && X+adjRow(j)<=size(binaryimage,1) &&...
                   (Y+adjCol(j)>0) && Y+adjCol(j)<=size(binaryimage,2) &&...
                   explored(X+adjRow(j),Y+adjCol(j))==false &&...
                   binaryimage(X+adjRow(j),Y+adjCol(j))==1)
                      explored(X+adjRow(j),Y+adjCol(j))=true;
                      myQueue=[myQueue [X+adjRow(j);Y+adjCol(j)]];
                      object=[object [X+adjRow(j);Y+adjCol(j)]];
                end
            end     
        end
        objectSet = [objectSet object];
    end
    %remove under n connected components:
    toErase=false(size(binaryimage));
    for i=1:size(objectSet, 2)
        if(size(objectSet{i},2)<n)
            index=sub2ind(size(binaryimage),objectSet{i}(1,:),objectSet{i}(2,:));
            toErase(index)=1;
        end
    end
    cleanimage=logical(binaryimage-toErase);
end