% lambda = 1.646e-6; 
R=10.352079e-6;
% 
% V=(2*pi*R/lambda)*sqrt(n1^2-n2^2);
V=8;
%01 02 11 12 21 31 41
b=[0.929 ,.8182, .6818, .5068, .3068, .0824, .6304, .4091, .1682, .1320 ];
U=V.*sqrt(1-b);
W=V.*sqrt(b);

% A=1;

la=[0:0.0001*R:R];
La=[R:0.0001*R:2*R];
Radial=[];
gangA=[2.418719,0.61612,0.249951,0.159430,0.10823,0.079432,0.588422,0.2290903,0.1363757,0.2860381];
FA=sqrt(gangA);


xa=linspace(0,2,ceil(sqrt(N)/2)+1);
xx=[la La];

e1= abs(f);

Z1=vec2mat(e1,sqrt(Nobs));
 Zrad = Z1(ceil(sqrt(Nobs)/2),:);
Radial_code =  Zrad(ceil(sqrt(N)/2):end);


Rla = abs((1/besselj(0,U(1)))*(besselj(0,U(1)*la/R)));
RLa = abs((1/besselk(0,W(1)))*(besselk(0,W(1)*La/R)));

Radial_th=(1/FA(1))*[Rla RLa];

XI = linspace(0,2,20002);
Radial_code = interp1(xa,Radial_code,XI);

f1=Radial_th/max(Radial_th);
f2=Radial_code/max(Radial_code);
plot(xx/R,f1);
hold on
plot(XI,f2);
xlabel('r/a');
ylabel('Radial Plot (Max value is made 1)');
title('Radial Plot [Absolute] vs r/a of LP_{01} ');
legend({'Theory','Volume Integral O/P'});
set(gcf,'color','white');
figure()
f3=abs(f1-f2);
plot(XI,f3);
xlabel('r/a');
ylabel('Error |T-C|');
title('Error Plot |T-C| vs r/a of LP_{01} ');
set(gcf,'color','white');


