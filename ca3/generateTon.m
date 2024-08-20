function y = generateTon(num, prevY)
    rowFreq = [697 770 852 941];
    colFreq = [1209 1336 1477];
    fs = 8000;
    Ts = 1/fs;
    Ton = 0.1;
    t = Ts:Ts:Ton;
    if(num == '0')
        y1 = sin(2*pi*rowFreq(4)*t);
        y2 = sin(2*pi*colFreq(2)*t);
    elseif(num == '1')
        y1 = sin(2*pi*rowFreq(1)*t);
        y2 = sin(2*pi*colFreq(1)*t);
    elseif(num == '2')
        y1 = sin(2*pi*rowFreq(1)*t);
        y2 = sin(2*pi*colFreq(2)*t);
    elseif(num == '3')
        y1 = sin(2*pi*rowFreq(1)*t);
        y2 = sin(2*pi*colFreq(3)*t);
    elseif(num == '4')
        y1 = sin(2*pi*rowFreq(2)*t);
        y2 = sin(2*pi*colFreq(1)*t);
    elseif(num == '5')
        y1 = sin(2*pi*rowFreq(2)*t);
        y2 = sin(2*pi*colFreq(2)*t);
    elseif(num == '6')
        y1 = sin(2*pi*rowFreq(2)*t);
        y2 = sin(2*pi*colFreq(3)*t);
    elseif(num == '7')
        y1 = sin(2*pi*rowFreq(3)*t);
        y2 = sin(2*pi*colFreq(1)*t);
    elseif(num == '8')
        y1 = sin(2*pi*rowFreq(3)*t);
        y2 = sin(2*pi*colFreq(2)*t);
    elseif(num == '9')
        y1 = sin(2*pi*rowFreq(3)*t);
        y2 = sin(2*pi*colFreq(3)*t);
    elseif(num == '*')
        y1 = sin(2*pi*rowFreq(4)*t);
        y2 = sin(2*pi*colFreq(1)*t);
    elseif(num == '#')
        y1 = sin(2*pi*rowFreq(4)*t);
        y2 = sin(2*pi*colFreq(3)*t);
    end
    newY=(y1+y2)/2;
    y = [prevY newY];
end