function result = p2_2func(audio)
    fs = 8000;
    Ton = 0.1;
    TonLen = fs* Ton;
    Toff = 0.1;
    ToffLen = fs*Toff;
    nums = ['0' '1' '2' '3' '4' '5' '6' '7' '8' '9' '*' '#'];
    myAns = [];
    for i=1:TonLen+ToffLen:size(audio, 2)
        ithTon = audio(i:i+TonLen-1);
        maxCorr = 0;
        maxIdx = 1;
        for j=1:size(nums, 2)
            empty = [];
            if(corr2(ithTon, generateTon(nums(j), empty))>maxCorr)
                maxCorr = corr2(ithTon, generateTon(nums(j), empty));
                maxIdx = j;
            end
        end
        myAns = [myAns nums(maxIdx)];
    end
    result = myAns;
end
