x = 1:3000;
y = randn(1,3000);
histfit(y);
mean = sum(y)/length(y);
variance = sum(y.*y)/length(y) - mean^2;
fprintf('calculated mean on randn function is: %f \n', mean);
fprintf('calculated variance on randn function is: %f \n', variance);