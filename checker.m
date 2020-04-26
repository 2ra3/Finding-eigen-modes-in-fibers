% l=1;
% for i=1:N
%     if(abs(beta_sq(i,i))>k2^2 )
%         valid_beta_sq(l)= beta_sq (i,i);
%         l=l+1;
%          valid_e = [valid_e e(:,i)];
%     end
% end


% bet = diag(real(beta_sq));
% bet2 = diag(imag(beta_sq));
% 
% bet1 =abs(bet);
% 
% plot(1:N,bet1);
% hold on 
% plot(1:N, bet2);

% neff = sqrt(abs(valid_beta_sq))/k0;

% A = [1 2 3; 4 5 6; 7 8 9]
% B=reshape(transpose(A),1,[])
% C=kron(B,ones(4,1))
% transpose(A)
% A.'
% A(:)
% reshape(A.',1,[])



%check for neff
% val_e=[];
% val_n=[];
% l=1;
% for i=1:size(beta_sq,1)
%     if(real(neff(i,i))>n2  && real(neff(i,i))<n1)
%         val_n(l)= neff (i,i);
%         l=l+1;
%         val_e = [val_e e(:,i)];
%     end
% end


% neff=abs(diag(neff));


% [e, beta_sq] = eigs(C,10);



d=eigs(C,floor(size(C,1)),'smallestabs');
neff=abs(sqrt(d)/k0);
val_n=[];
l=1;
for i=1:size(neff,1)
    if(neff(i)>n2  && neff(i)<n1)
        val_n(l)= neff (i);
        l=l+1;
        
    end
end

