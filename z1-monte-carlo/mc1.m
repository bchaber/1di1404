%% Simple implementation of Monte Carlo integration
% analysis of the convergence rate
tic
[N, QN] = main();
toc
semilogx(N, 4*QN)
xlabel('Liczba punktow N [-]')
ylabel('Przyblizenie liczby pi [-]')
grid on

loglog(N, abs(4*QN - pi))
xlabel('Liczba punktów N [-]')
ylabel('Blad przyblizenia liczby pi [-]')
grid on

function [Ns, Qs] = main()
ks = 1:60;
Ns = ceil(10 .^ (ks./10));
Qs = zeros(size(Ns));
for k=ks
    N = Ns(k);
    xbar = rand(N, 2);

    Q = 0.0;
    for i=1:N
        Q = Q + f(xbar(i,:));
    end
    
    V = 1.0;
    QN = V / N * Q;
    Qs(k) = QN;
end
end

function y = f(x)
    if dot(x, x) > 1.0
        y = 0.0;
    else
        y = 1.0;
    end
end
