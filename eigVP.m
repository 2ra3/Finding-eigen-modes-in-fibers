clc;
clear;

format long;

%To define the circular cross section of the core of the step index fiber
R=10.4; %radius of cross section
N_samples1 = 200;
theta = linspace(0, 2*pi, N_samples1);
x_nodes = R.*cos(theta);
y_nodes = R.*sin(theta); 

     
n1 = 1.47; %Inside fiber
n2 = 1.45;%Outside fiber

lambda = 1.385207;      %Wavelength of wave in vacuum ,working lamb=1.646u
k0 = 2*pi/lambda;   %Free space
k2 = n2*k0;         %Cover (Volume 1) Outside fiber
k1 = n1*k0;         %Inside (Volume 2) Insider fiber

V=(2*pi*R/lambda)*sqrt(n1^2-n2^2); %V number

% Domain of computation
xmin_dom = -1*R; xmax_dom = 1*R; ymin_dom = xmin_dom; ymax_dom = xmax_dom;

N1=71; %grid number

dx= (xmax_dom - xmin_dom)/N1; 

dy=dx;
[X,Y] = meshgrid((xmin_dom:dx:xmax_dom), (ymin_dom:dy:ymax_dom));
N = numel(X);

[pts_in, pts_on] = inpolygon(X, Y, x_nodes, y_nodes);

eps_r = ones(length(X(:,1)), length(X(1,:)));
eps_r(pts_in) = n1^2;
eps_r(~pts_in) = n2^2;

num_pts_inside = numel(X(pts_in));
% % numel(X(pts_on)); 
% 
% %Neat trick to avoid calculating the A matrix in eigen value problem Ae=Be
% 
% chi = eps_r - ones(sqrt(N),sqrt(N)); %define chi in the computational grid
% chi_vec=reshape(transpose(chi),1,[]); %convert chi to a vector 
% chi_mat=kron(chi_vec,ones(N,1)); %repeat the row N1^2 times


B= zeros(num_pts_inside);
% 
a = sqrt(dx*dy)/sqrt(pi);
Xp=X(pts_in);
Yp=Y(pts_in);

kg=k1^2 - k2^2;

% VOLUME INTEGRAL FORMULATION for points inside core
for i = 1:num_pts_inside
    for j = 1:num_pts_inside
        if(i~=j)
            B(i,j) = 0.25j*(2*pi/k2)*a*besselj(1,k2*a)*besselh(0,2, k2*sqrt((Xp(i)-Xp(j))^2+(Yp(i)-Yp(j))^2));
        else
            B(i,j) = 0.25j*(2/k2^2)*(pi*k2*a*besselh(1,2, k2*a)-2j);
        end
    end
end


% A = -k0^2 * (chi_mat.* B); %using chi matrix to build A
A=-kg*B;

figure();                  %plot the grid
plot(X(pts_in), Y(pts_in), 'r+')
hold on;
plot(X(~pts_in), Y(~pts_in), 'bo')
plot(x_nodes,y_nodes);
set(gcf,'color','white')
% plot(X_obs,Y_obs,'g--o');



% for i = 1:N
%     for j = 1:N
%         if(i~=j)
%             A(i,j) = (k0^2)*chi(j).*2*(pi/k0)*a*besselj(1,k0*a)*besselh(0,2, k0*sqrt((X(i)-X(j))^2+(Y(i)-Y(j))^2)); 
%              B(i,j) = (2*pi/k0)*a*besselj(1,k0*a)*besselh(0,2, k0*sqrt((X(i)-X(j))^2+(Y(i)-Y(j))^2));
%         else
%             A(i,j) = 1 - (k0^2)*chi(j).*(2/k0^2)*(pi*k0*a*besselh(1,2, k0*a)-2j);
%             B(i,j) = (2/k0^2)*(pi*k0*a*besselh(1,2, k0*a)-2j);
%         end
%     end
% end


% for i = 1:N
%     for j = 1:N
%         if(i~=j)
%             A(i,j) = -(k0^2)*chi(j).*2*(pi/k2)*a*besselj(1,k2*a)*besselh(0,2, k2*sqrt((X(i)-X(j))^2+(Y(i)-Y(j))^2)); 
%             B(i,j) = -2*(pi/k2)*a*besselj(1,k2*a)*besselh(0,2, k2*sqrt((X(i)-X(j))^2+(Y(i)-Y(j))^2));
%         else
%             A(i,j) = 1 - (k2^2)*(chi(j)-n2^2).*(2/k2^2)*(pi*k2*a*besselh(1,2, k2*a)-2j);
%             B(i,j) = -(2/k2^2)*(pi*k2*a*besselh(1,2, k2*a)-2j);
%         end
%     end
% end

% e = zeros(N,1);

% C=inv(B)*A;
% 
% 
% valid_e = zeros(N,1);
% nmodes=4;
% C=sparse(C);
% [psi,Beta] = eigs(C,nmodes,'LR'); 
% 
% neff = sqrt(abs(Beta))/k0;
% % [e, beta_sq] = eig(C);
% 
% l=1;
% for i=1:N
%     if(abs(beta_sq(i,i))>k2^2  && abs(beta_sq(i,i))<k1^2)
%         valid_beta_sq(l)= beta_sq (i,i);
%         l=l+1;
%          valid_e = [valid_e e(:,i)];
%     end
% end

% load('beta_sq_values.mat'); 
% 
% load('evalues.mat');
% 
% N_samples = 201; 
% dx1 = R/N_samples;
% 
% X_obs = 0:dx1:R-dx1;
% Y_obs= zeros(1,N_samples);


% for p=1:20
% choice = p; %3,6,7,8
% 
% vars= E(:,choice);
% 
% beta_sq = beta_squared(choice);
%  

% 
% 
% 
% 
% 
% A1 = zeros(N_samples);
% 
% for i=1:N_samples
%     for j=1:N
%         if(X_obs(i)~=X(j) && Y_obs(i)~=Y(j))
%             
%             A1(i,j) = ((k0^2)*(eps_r(j)-1) - beta_sq).*2*(pi/k0)*a*besselj(1,k0*a)*besselh(0,2, k0*sqrt((X_obs(i)-X(j))^2+(Y_obs(i)-Y(j))^2));
%         else
%            
%            A1(i,j) = ((k0^2)*(eps_r(j)-1) - beta_sq).*(2/k0^2)*(pi*k0*a*besselh(1,2, k0*a)-2j);
%         end
%     
%     end
%     
% end
% 
% E_s = A1*vars;
% 
% OBS = abs(E_s);
% 
% OBS;
% 
% % X_obs(end)=[];
% %PLOTS 
% 
% figure()
% plot(X_obs,OBS);
% hold on
% scatter(X_obs,OBS);
% 
% end
% 
