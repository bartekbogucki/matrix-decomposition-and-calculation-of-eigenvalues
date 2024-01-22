function l=wlasna_min_householder(A)
e=0.001; %ustalam tolerancje bledu na poziomie 0.001
[m,n] = size(A);
if m~=n
    error('Macierz nie jest kwadratowa');
end
x=rand(n,1);
err=inf;
l=0;
[Q,R]=rozw_householder(A);
while err>=e
    err=l;
    x=x/norm(x);
    y=Q'*(R\x);
    l=(x'*y)/(x'*x);
    err=abs(l-err);
    x=y;
end
l=1/l;
if isnan(l)
    error('Macierz jest osobliwa');
end
end