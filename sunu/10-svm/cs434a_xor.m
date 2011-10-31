% SVM Demo: XOR
clear all; close all; clc
warning off all;

% Asama 1: data
c1 = [[+1 -1]; [-1 +1]];      z1 = +1 * ones(length(c1), 1);
c2 = [[+1 +1]; [-1 -1]];      z2 = -1 * ones(length(c2), 1);

X = [c1; c2]
z = [z1; z2]

% Asama 2: alpha
N = length(X);

% (X * X') -> K = Phi(X)' * Phi(X)
K = kernel(X', 'poly', [2 1])       % kernel:poly, derece:2, ofset:1
H = K .* (z * z') + 0.001 * eye(N)

disp('Sonrasi ...?');
return
f = - ones(N, 1)
A = -eye(N)
a = zeros(N, 1)

B = [[z']; [zeros(N-1, N)]]
b = zeros(N, 1)

alpha = quadprog(H, f, A, a, B, b);

sv = alpha( abs(alpha) > 0.001 )    % '0' dana farkli olanlar "support vector"

% Asama 3: w
w = ( (alpha .* z)' * X )'

% Asama 4: w0
% can solve for w0 using any ?i > 0 and ?i [zi (w' xi + w0) ? 1] = 0
% w0 = 1/zi - w' xi

t = find(alpha > 0);            % ?i > 0
i = t(1);                       % ilkini sectim!
w0 = 1/z(i) - w' * X(i, :)'
