%exclusively for plotting variables and outputs

% num=size(e,1);
% a=zeros(num,1);
% for i=1:num
%     a(i)=(-1)^(i+1);
% end

% X1=X;
% Y1=Y;
% X1(1:25,:) = [];
% Y1(1:25,:)=[];
%%
for i = 1:1
t=i; %mode
f=(kg-beta_sq(t,t))*T*e(:,t);
e1= real(f/max(f));
Z=vec2mat(e1,sqrt(Nobs));
figure()
subplot(2,1,1);
mesh(Xobs,Yobs,Z);
hold on
[K,L,M]=cylinder(R);
testsubject=surf(K,L,M);
set(testsubject,'FaceAlpha',0.01)
subplot(2,1,2);
pcolor(Xobs,Yobs,Z);shading interp
hold on 
plot(x_nodes,y_nodes,'white');
colorbar;
set(gcf,'color','white');

% figure()
% Zrad = Z(ceil(sqrt(Nobs)/2),:);
% Radial_code =  Zrad(ceil(sqrt(Nobs)/2):end);
% plot([1:42],Radial_code);
end
%%

% c=real(e(:,2));
% scatter3(Xp,Yp,real(e(:,2)),5,c);
% colorbar;
% set(gcf,'color','white');


% 
% % scatter(X(:),Y(:));
% 
% xx=linspace(0,2,ceil(sqrt(N)/2)+1);
% % for i = 1:5
% e1= abs(e(:,1));
% 
% Z=vec2mat(e1,sqrt(N));
% Z=Z/max(max(Z));
%  Zrad = Z(ceil(sqrt(N)/2),:);
% Radial_code =  Zrad(ceil(sqrt(N)/2):end);
% figure()
% % mesh(X,Y,Z);
% plot(xx,Radial_code);

% plot(X,Y,Z);


% end


% figure();
% plot(X(pts_in), Y(pts_in), 'r+')
% hold on;
% plot(X(~pts_in), Y(~pts_in), 'bo')
% plot(x_nodes,y_nodes);

