function [findR,corrVal]=p3_3(recievedSignal)
    ts=1e-9;
    T=1e-5;
    tau=1e-6;
    t=0:ts:T;
    index=round(tau/ts);
    c=3e8;

    corrVal=zeros(size(t));
    finalIndex=round(T/ts);
    for i=1:finalIndex-index
        movingSignal=zeros(size(t));
        movingSignal(i:i+index-1)=1;
        corrVal(i)=movingSignal*(recievedSignal');
    end

    [findMaxCorr,findMaxIndex]=max(corrVal);
    findTd=t(findMaxIndex);
    findR=findTd*c/2;
end