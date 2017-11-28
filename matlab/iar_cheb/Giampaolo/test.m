close all
clear all
clc

n=4;
global A0 A1 a b
a=-1;
b=0;
%A0=rand(n); A1=rand(n); 
A0=[  3  -6   0 4  ;
     -3   4  -8 19 ;
      1 -16 -13 0  ;
    -14  -9   2 9  ]/10;

A1=[  8   2  -13 -3  ;
     -11  9   12  5 ;
      5   2  -16 -13  ;
      7   4   -4   0]/10;



I=eye(n);

nep.MMeval=@(l)  -l^2*I + A0 + A1*exp(-l);
nep.Mdd=@(j)                            ...
                (j==0)*(A0 + A1) +      ...
                (j==1)*(-A1) +          ...
                (j==2)*(-2*I+A1) +      ...
                (j>2)*((-1)^j*A1);
nep.M0solver=@(x) nep.MMeval(0)\x;
nep.err=@(lambda,v) norm(nep.MMeval(lambda)*v);
nep.n=n;


%v=zeros(n,1);   v(1)=1;
v=ones(n,1);    v=v/norm(v);
m=20;

global LL comp_y0

% notice that there is a factor (b-a)/4 in front of LL
LL = @(k) L(k)*(b-a)/4;
comp_y0=@(x,y) compute_y0(x,y);

[ V, H ] = InfArn( nep, v, m ); 
norm(V'*V-eye(m+1))
V=V(1:n,:);
[ err, conv_eig_IAR ] = iar_error_hist( nep, V, H, '-k' );


% matrix needed to the expansion
function Lmat=L(k)
    if k==1
        Lmat=2;
    else
        Lmat=diag([2, 1./(2:k)])+diag(-1./(1:(k-2)),-2);
    end
end

% function for compuing y0 for this specific DEP
function y0=compute_y0(x,y)
    tt=1;
    
    global A0 A1 a
    % Chebyshev polynomials of the first kind
    T=@(n,x) cos(n*acos(x));
    
    % Chebyshev polynomials of the second kind
    %U=@(n,x) sin((n+1)*acos(x))/sin(acos(x));
    U=@(n,x) n+1; % observe that U(n,1)=n+1 and we evaluate U only in 1 in this code
    
    n=length(A0);
    N=size(x,2);
    
    y0=zeros(n,1);
    for i=1:N-1
        y0=y0+(2*i/a)*U(i-1,1)*x(:,i+1);
    end
    
    for i=1:N+1
        y0=y0+A0*T(i,1)*y(:,i);
    end
    
    for i=1:N+1
        y0=y0+A1*T(i-1,1+2*tt/a)*y(:,i);
    end
    y0=-(A0+A1)\y0;
    
end


