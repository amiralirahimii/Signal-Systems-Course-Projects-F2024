% test one another test case with noise
t=-1:0.01:1;
x2=cos(2*pi*t);
a2=5;
b2=-3;
noise=randn(size(t));
y2=a2*x2+b2+noise;
[findA2, findB2]=p2_4(x2,y2);
findA2
findB2