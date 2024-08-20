function y = generateToff(prevY)
    fs = 8000;
    Ts = 1/fs;
    Toff = 0.1;
    t = Ts:Ts:Toff;
    newY = zeros(size(t));
    y = [prevY newY];
end