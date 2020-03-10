%% Better implementation of Monte Carlo integration
% with error estimation
tic
[N, QN, Es] = main();
toc
pis = pi * ones(size(N));

subplot(211)
semilogx(N, 4*(QN + 5*Es)), hold on
semilogx(N, pis, 'k-.');
semilogx(N, 4*(QN));
semilogx(N, 4*(QN - 5*Es)), hold off
xlabel('Liczba punktów N [-]')
ylabel('Przybli¿enie liczby pi [-]')
grid on
legend('górna granica', 'dok³adna warto¶æ', ...
       'przybli¿ona warto¶æ', 'dolna granica')

subplot(212)
loglog(N, Es/max(Es), ...
       N, 1./sqrt(N) * sqrt(min(N)), 'k-.')
xlabel('Liczba punktów N [-]')
ylabel('Znormalizowana estymacja b³êdu [-]')
legend('Estymacja', 'Teoria')
grid on

function [Ns, Qs, Es] = main()
ks = 1:50;
Ns = ceil(10 .^ (ks./10 + 1));
Qs = zeros(size(Ns));
Es = zeros(size(Ns));
for k=ks
    N = Ns(k);
    xbar = rand(N, 2);
    f  = @(x) sum(x .^ 2, 2) <= 1.0;
    Qi = f(xbar);
    var = (1 / (N-1)) * sum((Qi - mean(Qi)).^2);
    V = 1.0;
    QN = V / N * sum(Qi);
    Es(k) = V*sqrt(var/N);
    Qs(k) = QN;
end
end