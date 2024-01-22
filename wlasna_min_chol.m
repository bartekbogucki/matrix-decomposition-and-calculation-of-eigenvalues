function l=wlasna_min_chol(A)
e=0.001; %ustalam tolerancje bledu na poziomie 0.001
[m,n] = size(A);
if m~=n
    error('Macierz nie jest kwadratowa');
end
try 
    chol(A);
catch
    error('Macierz nie jest symetryczna dodatnio określona'); %w innym przypadku macierz jest symetryczna dodatnio okreslona a co za tym idzie rowniez nieosobliwa
end
x=rand(n,1);
err=inf;
l=0;
R=chol(A);
while err>=e
    err=l;
    x=x/norm(x);
    y=R\(R'\x);
    l=(x'*y)/(x'*x);
    err=abs(l-err);
    x=y;
end
l=1/l;
end