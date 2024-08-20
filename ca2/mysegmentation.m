function [label,num]=mysegmentation(image)
    [row,col]=find(image==1);
    nodes=[row';col'];
    objectSet={};
    explored=false(size(image));
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
                if((X+adjRow(j)>0) && X+adjRow(j)<=size(image,1) &&...
                   (Y+adjCol(j)>0) && Y+adjCol(j)<=size(image,2) &&...
                   explored(X+adjRow(j),Y+adjCol(j))==false &&...
                   image(X+adjRow(j),Y+adjCol(j))==1)
                      explored(X+adjRow(j),Y+adjCol(j))=true;
                      myQueue=[myQueue [X+adjRow(j);Y+adjCol(j)]];
                      object=[object [X+adjRow(j);Y+adjCol(j)]];
                end
            end     
        end
        objectSet = [objectSet object];
    end
    %label objects:
    label=zeros(size(image));
    num=0;
    for i=1:size(objectSet, 2)
        num=num+1;
        thisObject=cell2mat(objectSet(i));
        index=sub2ind(size(image),thisObject(1,:),thisObject(2,:));
        label(index)=i;
    end
end