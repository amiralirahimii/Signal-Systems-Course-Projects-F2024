predictedLabels = TrainedModel.predictFcn(diabetestraining);
lastColoumn = table2array(diabetestraining(:, 7));

sameNumber = 0;
for i=1:size(lastColoumn, 1)
    if(lastColoumn(i, 1) == predictedLabels(i, 1))
        sameNumber = sameNumber + 1;
    end
end

successPercentage = sameNumber / size(lastColoumn, 1);
fprintf("success percentage is : %f %% \n" , 100*successPercentage);

predictedLabels = TrainedModel.predictFcn(diabetesvalidation);
lastColoumn = table2array(diabetesvalidation(:, 7));

sameNumber = 0;
for i=1:size(lastColoumn, 1)
    if(lastColoumn(i, 1) == predictedLabels(i, 1))
        sameNumber = sameNumber + 1;
    end
end

successPercentage = sameNumber / size(lastColoumn, 1);
fprintf("success percentage for the validation dataSet is : %f %%" , 100*successPercentage);