% n1 = 1.4593; %Inside fiber
% n2 = 1.45;%Outside fiber
% 
% lambda = 1.646e-6; 
% SAME EFFECT AS OF RADIAL.M SINCE JUST CHANGING THE COEFFICIENT MULTIPLIED
% TO IT IN BOTH CASES WILL BECOME EQUAL SINCE INTEGRAL IS EQUATED TO ONE
clc;
clear;
R=10.352079e-6;
% 
% V=(2*pi*R/lambda)*sqrt(n1^2-n2^2);
V=6.5;
%01 02 11 12 21 31 41
b=[.89769 .475182 .742163 .17921 .54109 .300334 0.027816];
U=V.*sqrt(1-b);
W=V.*sqrt(b);

% A=1;

la=[0:0.0001*R:R];
La=[R:0.0001*R:2*R];
Radial=[];
gangA=[0.056774,0.030918,0.059558,0.045222,0.0516216,0.041622,0.0473135];
A=gangA;
for i = 1:5
if( i==1 || i==2)
Rla = abs((1/besselj(0,U(i)))*(besselj(0,U(i)*la/R)));
RLa = abs((1/besselk(0,W(i)))*(besselk(0,W(i)*La/R)));
elseif ( i==3 || i==4)
Rla = abs((1/besselj(1,U(i)))*(besselj(1,U(i)*la/R)));
RLa = abs((1/besselk(1,W(i)))*(besselk(1,W(i)*La/R)));
else
Rla = abs((1/besselj(2,U(i)))*(besselj(2,U(i)*la/R)));
RLa = abs((1/besselk(2,W(i)))*(besselk(2,W(i)*La/R)));   
   
end
Radial=(1/1)*[Rla RLa];

% gangA(i)= trapz(Radial.^2/max(Radial.^2))*R;
xx=[la La];

plot(xx/R,Radial.^2/(A(i)*max(Radial.^2)));
legend
title('Intensity(after normalizing to same power) vs r/a')
xlabel('r/a')
ylabel('Intensity (Radial^2)')
hold on

Radial=[];
end
