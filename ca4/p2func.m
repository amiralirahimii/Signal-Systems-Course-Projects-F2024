function [findR,corrVal]=p2func(sentSignal, recievedSignal)
    ts=1e-9;
    T=1e-5;
    tau=1e-6;
    t=0:ts:T;
    c=3e8;
    
    yConv = conv(sentSignal, recievedSignal);
    [findMaxCorr,findMaxIndex]=max(yConv);
    if(findMaxIndex - 1000 < 1)
        findMaxIndex = 1;
    else
        findMaxIndex = findMaxIndex - 1000;
    end
    findTd=t(findMaxIndex);
    findR=findTd*c/2;
end