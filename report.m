function raport(n,k)
A=cell(1,n-1);
h=ones(1,n-1); %wartosci uzyskane moj_cond_householder()
c=ones(1,n-1); %wartosci uzyskane moj_cond_chol()
r=ones(1,n-1); %wartosci uzyskane wbudowaną cond()
t1=ones(1,n-1); %czasy uzyskane moj_cond_householder()
t2=ones(1,n-1); %czasy uzyskane moj_cond_chol()


for i=2:n
    p=rand(1,1);
    A{i-1}=diag(k*ones(i,1),0)+diag(p*ones(i-1,1),1)+diag(p*ones(i-1,1),-1);
    tic
    h(1,i-1)=moj_cond_householder(A{i-1});
    t1(i-1)=toc;
    tic
    c(1,i-1)=moj_cond_chol(A{i-1});
    t2(i-1)=toc;
    r(1,i-1)=cond(A{i-1});
end

Time_householder=sum(t1);
Time_chol=sum(t2);

%wykres wartosci wskaznikow uwarunkowania
figure(1);
x=1:1:n-1;
plot(x, h, 'LineWidth', 2, 'Color', 'red');
hold on;
plot(x, c, 'LineWidth', 2, 'Color', 'blue');
hold on;
plot(x, r, 'LineWidth', 2, 'Color', 'green');
ylabel('Wartości wskaźnikow uwarunkowania', 'FontSize', 10);
title('Porównanie wartości wskaźników uwarunkowania', 'uzyskane z wbudowanej funkcji cond() oraz moj\_cond\_householder() i moj\_cond\_chol()','FontSize', 7);
legend('moj\_cond\_householder()', 'moj\_cond\_chol()', 'cond()', 'Location', 'best','FontSize', 10); 
legend boxoff;
xlim([0 inf]);
ax=gca;
exportgraphics(ax, 'wykres_cond.jpg');
hold off;

%wykres czasów
figure(2);
plot(x, t1, 'LineWidth', 2, 'Color', 'red');
hold on;
plot(x, t2, 'LineWidth', 2, 'Color', 'blue');
ylabel('Czas [s]', 'FontSize', 10);
title('Porównanie czasów rozwiązania każdego z układów równań metodami Householdera i Choleskiego', ['(Przy n=', num2str(n), ' łączny czas dla Householdera: ', num2str(Time_householder), ', a dla Choleskiego: ', num2str(Time_chol), ')'], 'FontSize', 7);
legend('Householder', 'Cholesky', 'Location', 'best','FontSize', 10); 
legend boxoff;
xlim([0 inf]);
ax=gca;
exportgraphics(ax, 'wykres_czas.jpg');
hold off;