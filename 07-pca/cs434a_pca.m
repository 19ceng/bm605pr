% PCA demo
clear all; close all; clc
% Asama 1: data
X = [[1 2]; [2 3]; [3 2]; [4 4]; [5 4]; [6 7]; [7 6]; [9 7]]

% Asama 2: mu
mu = mean(X)

% Asama 3: dc remove
Z = X - repmat(mu, size(X,1),1)

% Asama 4: scatter
S = (size(X,1) - 1) * cov(Z) 

% Asama 5: eig
[V, D] = eig(S);

V
lambda = diag(D)
[t, i] = sort(diag(D), 'descend');
e = V(:, i(1))

% Asama 6: project
Y = e' * Z'

% Asama 7: plot
x = X(:,1); y = X(:,2);
plot(x, y, '*')
axis([0 max(x) 0 max(y)])
grid on
xlabel('x'),    ylabel('y'),    title('data')