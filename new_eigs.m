clc;

I=eye(num_pts_inside); 
C=inv(B)*(I-A);% C*e=beta_sq*e eigen value problem 
 
nmodes=10;% we have to give the number of modes, ow all the N eigen vals are computed; 
%unnecessary computation since we only need largest real valued eigen values
%and corresponding vectors

% C=sparse(C);
[e, beta_sq] = eigs(C,nmodes,'LR'); %LR --> Largest Real, also uses Arnoldi Method
neff=abs(sqrt(real(beta_sq))/k0); 
neff=diag(neff);

% 
% d=eigs(C,floor(size(C,1)/20),'smallestabs');
% neff=abs(sqrt(d)/k0);
% val_n=[];
% l=1;
% for i=1:size(neff,1)
%     if(neff(i)>n2  && neff(i)<n1)
%         val_n(l)= neff (i);
%         l=l+1;
%         
%     end
% end


% valid_e=[];
% valid_beta_sq=[];
% l=1;
% for i=1:size(beta_sq,1)
%     if(abs(beta_sq(i,i))>k2^2  && abs(beta_sq(i,i))<k1^2)
%         valid_beta_sq(l)= beta_sq (i,i);
%         l=l+1;
%         valid_e = [valid_e e(:,i)];
%     end
% end
%  
