error=[1, .92, .076, 0.0325, .0135, 0.0115];
Nx=32:10:82;
refr_index=[2.5882, 4.3547, 1.4702, 1.4651, 1.4628, 1.4615];

XI = linspace(32,82,20002);
error = interp1(Nx,error,XI,'pchip');



refr_index = interp1(Nx,refr_index,XI,'pchip');


plot(XI,refr_index,'r');
xlabel('N(grid points=N^2)')
ylabel('neff of LP_{01}')
title('neff of LP_{01} vs N')
refline(0,1.4584)