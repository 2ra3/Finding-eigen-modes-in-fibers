% n1 = 1.4593; %Inside fiber
% n2 = 1.45;%Outside fiber
% 
% lambda = 1.646e-6; 
% R=10.352079e-6;
% 
% V=(2*pi*R/lambda)*sqrt(n1^2-n2^2);
R=10e-6;
V=8;


%01 02 11 12 21 31 41
% b=[.89769 .475182 .742163 .17921 .54109 .300334 0.027816]; V=6.5;
% normA=[1.7815,0.434209,0.41496,0.173519,0.1969882,1.02177,0.123724];
%%

%LP 01 11 21 31 41 51 02 12 22 03 
b=[0.929 ,.8182, .6818, .5068, .3068, .0824, .6304, .4091, .1682, .1320 ];
%%
U=V.*sqrt(1-b);
W=V.*sqrt(b);

% A=1;

la=[0:0.0001*R:R];
La=[R:0.0001*R:2*R];
Radial=[];
normA=[2.418719,0.61612,0.249951,0.159430,0.10823,0.079432,0.588422,0.2290903,0.1363757,0.2860381];

A=sqrt(normA);
k=0;
for i = 1:10
    if ( i==7)
        k=k-6;
    elseif(i==10)
        k=k-3;
    end
    Rla = abs((1/besselj(k,U(i)))*(besselj(k,U(i)*la/R)));
    RLa = abs((1/besselk(k,W(i)))*(besselk(k,W(i)*La/R)));
    k=k+1;

    Radial=(1/A(i))*[Rla RLa];

% normA(i)= trapz(Radial.^2)*R;
xx=[la La];
hold on
if(i==1 || i==7 || i==2 || i==3|| i==9)
plot(xx/R,Radial.*Radial*2.9/18.71,'--');
end
legend
title('Intensity after normalising to same power vs r/a')
xlabel('r/a')
ylabel('Intensity (Radial^2)')
Radial=[];
set(gcf,'color','white');
end
