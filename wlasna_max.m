function l=wlasna_max(A)
e=0.001; %ustalam tolerancje bledu na poziomie 0.001
[m,n] = size(A);
if m~=n
    disp('macierz A nie jest kwadratowa');
    return
end
x=rand(n,1);
err=inf;
l=0;
while err>=e
    err=l;
    x=x/norm(x);
    y=A*x;
    l=(x'*y)/(x'*x);
    err=abs(l-err);
    x=y;
end
end