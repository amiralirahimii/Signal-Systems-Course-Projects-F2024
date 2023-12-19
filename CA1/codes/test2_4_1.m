% test the p2.mat variables
load p2.mat
[a1, b1]=p2_4(x,y);
x1=-1:0.01:1;
y1=a1*x1+b1;

figure
plot(x1,y1,'b','lineWidth',3)
hold on
plot(x,y,'.')
a1
b1