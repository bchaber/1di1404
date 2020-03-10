%% Better implementation of Monte Carlo integration
% utilizing vector operations
tic
[N, QN] = main();
toc
semilogx(N, 4*QN)
xlabel('Liczba punkt�w N [-]')
ylabel('Przybli�enie liczby pi [-]')
grid on

loglog(N, abs(4*QN - pi))
xlabel('Liczba punkt�w N [-]')
ylabel('B��d przybli�enia liczby pi [-]')
grid on

function [Ns, Qs] = main()
ks = 1:60;
Ns = ceil(10 .^ (ks./10));
Qs = zeros(size(Ns));
for k=ks
    N = Ns(k);
    xbar = rand(N, 2);
    f  = @(x) sum(x .^ 2, 2) <= 1.0;
    Qi = f(xbar);
    V = 1.0;
    QN = V / N * sum(Qi);
    Qs(k) = QN;
end
end