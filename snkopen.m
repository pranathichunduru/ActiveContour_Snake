% new A matrix for open snake 

% function to create penta diagnol matrix for open snake implementation 

function Ainv = snkopen(m,alpha ,beta,gamma)

% total no of control points - m
% alpha and beta values 
% gamma -step size value

A=[]; A1=[];A2=[];

A1= (diag(2*ones(1,m),0)+...
    diag((-1)*ones(1,m-1),1)+...
    diag((-1)*ones(1,m-1),-1)+...
    diag(-1,-m+1)+...
    diag(-1,m-1));

A2= (diag(6*ones(1,m),0)+...
    diag((-4)*ones(1,m-1),1)+...
    diag((1)*ones(1,m-2),2)+...
    diag((-4)*ones(1,m-1),-1)+...
    diag((1)*ones(1,m-2),-2)+...
    diag(1*ones(1,2),-m+2)+...
    diag(1*ones(1,2),m-2)+...
    diag(-4,-m+1)+...
    diag(-4,m-1));

% deleting corners for end points in open snake

A1(1,m)= 0;
A1(m,1)= 0;
A1(1,1) = 1;
A1(m,m)= 1;

A2(1,m)=0;
A2(1,m-1)=0;
A2(2,m)=0;
A2(m,1)=0;
A2(m,2)=0;
A2(m-1,1)=0;

A2(1,1:3)= [1 -2 1];
A2(2,1:4) = [-2 4 -4 1];
A2(m-1,m-1:m) = [4 -2];
A2(m,m-1:m) = [-2 1];

A = alpha*A1 +beta*A2;

Ainv=inv(A + gamma.* eye(m));

end


