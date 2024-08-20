function result = normCorr2D(x, y)
    x=double(x);
    y=double(y);
    a = x.*y;
    a = sum(a);
    numerator = sum(a);
    b = x.*x;
    b = sum(b);
    denumeratorPartX = sum(b);
    c = y.*y;
    c = sum(c);
    denumeratorPartY = sum(c);
    result = numerator/sqrt(denumeratorPartX*denumeratorPartY);
%     bellow appraoch was so slow
%     numerator = 0;
%     denumeratorPartX = 0;
%     denumeratorPartY = 0;
%     for i=1:size(x, 1)
%         for j=1:size(x, 2)
%             numerator = numerator + x(i,j)*y(i,j);
%             denumeratorPartX = denumeratorPartX + x(i,j)^2;
%             denumeratorPartY = denumeratorPartY + y(i,j)^2;
%         end
%     end
end