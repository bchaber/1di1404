%% Simple implementation of Monte Carlo integration
% for calculating an approximation of PI
N = 10000;
xbar = rand(N, 2);

Q = 0.0;
for i=1:N
    Q = Q + f(xbar(i,:));
end

V = 1.0;
QN = V / N * Q;
result = 4 * QN

scatter3(xbar(:,1), xbar(:,2), ...
    sqrt(sum(xbar .^ 2, 2)) <= 1.0, '.')
xlabel('x [-]'), ylabel('y [-]')
zlabel('funkcja przynaleznosci do kola jednostkowego [bool]')

function y = f(x)
    if dot(x, x) > 1.0
        y = 0.0;
    else
        y = 1.0;
    end
end
