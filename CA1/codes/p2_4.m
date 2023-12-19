function [a, b]=p2_4(x,y)
    coEffMatrix = zeros(2,2);
    constNumMatrix = zeros(2,1);
    for i=1:size(x, 2)
        coEffMatrix(1,1) = coEffMatrix(1,1) + x(i)^2;
        coEffMatrix(1,2) = coEffMatrix(1,2) + x(i);
        coEffMatrix(2,1) = coEffMatrix(2,1) + x(i);
        coEffMatrix(2,2) = coEffMatrix(2,2) + 1;
        constNumMatrix(1,1) = constNumMatrix(1,1) + x(i) * y(i);
        constNumMatrix(2,1) = constNumMatrix(2,1) + y(i);
    end
    determinant = coEffMatrix(1,1)*coEffMatrix(2,2) - coEffMatrix(1,2)*coEffMatrix(2,1);
    invertedMatrix = (1/determinant) * [coEffMatrix(2,2) -1*coEffMatrix(1,2);
                                        -1*coEffMatrix(2,1) coEffMatrix(1,1)];
    result = (invertedMatrix*constNumMatrix);
    a=result(1,1);
    b=result(2,1);
end