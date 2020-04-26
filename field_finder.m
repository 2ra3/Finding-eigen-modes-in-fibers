clc;
% Domain of computation
xmin_dom = -2*R; xmax_dom = 2*R; ymin_dom = xmin_dom; ymax_dom = xmax_dom;

N1=71; %grid number

dx= (xmax_dom - xmin_dom)/N1; 

dy=dx;
[Xobs,Yobs] = meshgrid((xmin_dom:dx:xmax_dom), (ymin_dom:dy:ymax_dom));

Nobs = numel(Xobs);

T=zeros(Nobs,num_pts_inside);

for i = 1:Nobs
    for j = 1:num_pts_inside
        if(Xobs(i)~=Xp(j) && Yobs(i)~=Yp(j))
            T(i,j) = -0.25j*(2*pi/k2)*a*besselj(1,k2*a)*besselh(0,2, k2*sqrt((Xobs(i)-Xp(j))^2+(Yobs(i)-Yp(j))^2));
        else
            T(i,j) = -0.25j*(2/k2^2)*(pi*k2*a*besselh(1,2, k2*a)-2j);
        end
    end
end


