function [Q,R]=rozw_householder(A)
[m,n]=size(A);
norma=zeros(1,n);
Q=eye(m,m);
for i=1:n
    a=A(i:end,i);
    norma(i)=norm(a);
    if norma(1,i)==0
        gamma=1;
    else
        gamma=norma(i)^2+abs(a(1))*norma(i);
    end
    u=a;
    if a(1)>=0
        u(1)=a(1)+norma(i);
    else
        u(1)=a(1)-norma(i);
    end
    H=eye(m,m);
    H(i:end,i:end)=eye(m+1-i,m+1-i)-(1/gamma)*u.*u';
    A=H*A;
    Q=H*Q;
end
R=A;
Q=Q';
end