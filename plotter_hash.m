for i = 1:12
e1= abs(e(:,i));

Z=vec2mat(e1,sqrt(N));
Z=Z/max(max(Z));
% figure()
% mesh(X,Y,Z);

% end

figure()
subplot(2,1,1);
mesh(X,Y,Z);
hold on
[K,L,M]=cylinder(R);
testsubject=surf(K,L,M);
set(testsubject,'FaceAlpha',0.01)
subplot(2,1,2);
pcolor(X,Y,Z);shading interp
hold on 
plot(x_nodes,y_nodes,'white');
colorbar;
end