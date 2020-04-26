clc;
clear;

format long;




    
%     A = zeros(N,N); % Array to store coefficients for the pulse basis
%     L = 10;          % Length of the box
    B = 2E-6;       % Radius of cross section of cladding + core

    N2=10;
N_samples1 = 50; 

x_nodes=[0];
y_nodes=[0];
    %Testing points' X and Y coordinates
for i=1:N2
    
R =i*B/N2; %Radius of cross section of cladding + core

theta = linspace(0, 2*pi, N_samples1);
x_nodes =[x_nodes, R.*cos(theta)];
y_nodes =[y_nodes, R.*sin(theta)];

end

% scatter(x_nodes,y_nodes);

% E_s = zeros(1,N_samples);
    
%      figure()              % Uncomment to see the position of the testing
%      scatter(xms, yms)     % points graphically.
     
     % Wave characteristics
     
n1 = 1.46; %Inside fiber
n2 = 1.45;%Outside fiber

lambda = 1e-6;      %Wavelength of wave in vacuum
k0 = 2*pi/lambda;   %Free space
k2 = n2*k0;         %Cover (Volume 1) Outside fiber
k1 = n1*k0;         %Inside (Volume 2) Insider fiber




% Domain of computation
% xmin_dom = -5E-6; xmax_dom = 5E-6; ymin_dom = -5E-6; ymax_dom = 5E-6;
% N1=50;
% 
% dx= (xmax_dom - xmin_dom)/N1; 
% 
% dy=dx;
% [X,Y] = meshgrid((xmin_dom:dx:xmax_dom), (ymin_dom:dy:ymax_dom));

% X = [X, x_nodes];
% Y = [Y, y_nodes];

% R = B;
% N_samples = 50;
% theta = linspace(0, 2*pi, N_samples);
% X_rcs = R.*cos(theta);
% Y_rcs = R.*sin(theta);
% E_s = zeros(1,N_samples);

% N = numel(X);
% 
TRI = delaunay(x_nodes,y_nodes);

hold on
triplot(TRI,x_nodes,y_nodes);



