clc;
clear;

% V=11.4;
V=8;
b=linspace(0,1,1200);
f1=@(b) (V*(1-b).^0.5)*besselj(4,V*(1-b).^0.5)/besselj(5,V*(1-b).^0.5);
f2=@(b) -(V*(b).^0.5)*besselk(4,V*(b).^0.5)/besselk(5,V*(b).^0.5);
fplot(f1,[0,1],'b')
hold on
fplot(f2,[0,1],'r')
legend
grid on
title('Finding Intersections of Functions')
xlabel('b')
ylabel('f1 and f2')
ylim([-15 15])
set(gcf,'color','white')




% Find the x-cordinates of intersecting points
% f1a=(V*(1-b).^0.5).*besselj(1,V*(1-b).^0.5)/besselj(0,V*(1-b).^0.5);
% f2a=(V*(b).^0.5).*besselk(1,V*(b).^0.5)/besselk(0,V*(b).^0.5);
% Intersections=find(abs(f1a-f2a)<=(0.5));
% X_Values=b(Intersections)