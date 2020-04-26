% n1 = 1.4593; %Inside fiber
% n2 = 1.45;%Outside fiber
% 
% lambda = 1.646e-6; 
R=10.352079e-6;
% 
% V=(2*pi*R/lambda)*sqrt(n1^2-n2^2);
% V=6.5;
% %01 02 11 12 21 31 41
% b=[.89769 .475182 .742163 .17921 .54109 .300334 0.027816];
% U=V.*sqrt(1-b);
% W=V.*sqrt(b);
% 
% A=1;


xa=linspace(0,2,32);
xx=[la La];
k=1;

for i=1:6
if(i==1 || i==6 ||i==3||i==5)
e1= abs(e(:,i));

Z=vec2mat(e1,sqrt(N));
 Zrad = Z(ceil(sqrt(N)/2),:);
Radial_code =  Zrad(ceil(sqrt(N)/2):end);

% la=[0:0.0001*R:R];
% La=[R:0.0001*R:2*R];
%  Radial_code=[];
% 
% Rla = abs((A/besselj(0,U(1)))*(besselj(0,U(1)*la/R)));
% RLa = abs((A/besselk(0,W(1)))*(besselk(0,W(1)*La/R)));
% Radial_code=[Rla RLa];

% gangA_code(5) = trapz(Radial_code.*Radial_code);
hold on
plot(xa,150.7705*Radial_code.*Radial_code/gangA_code(k),'o');
legend
title('Intensity before normalising to same power vs r/a')
xlabel('r/a')
ylabel('Intensity (Radial^2)')

k=k+1;
end

end