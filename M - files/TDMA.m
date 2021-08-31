function [solution] = TDMA(A, B)
% An implementation of TDMA using matlab. Complexity is O(n2)
% 
%   Consider algebraic equation "Ax = B".
% A contains: 
% elements on the diagonal (bi, i = 1 - N)
% sub-diagonal (ai, i = 2 - N)
% super-diagonal (ci, i = 1 - N). 
% 
% B contains the so

a = [0; diag(A, -1)];
b = diag(A);
c = diag(A, 1);
d = B;
n = length(B);
x = zeros(1, n);

betai = ones(1, n);
betai(1) = b(1);

gammai = ones(1, n);
gammai(1) = d(1) / b(1);

for i = 2: n
    betai(i) = b(i) - (a(i) * c(i-1)) / (betai(i-1));
    gammai(i) = (d(i) - a(i) * gammai(i-1)) /  betai(i);
end

x(n) = gammai(n);
for i = n - 1: -1: 1
    x(i) = gammai(i) - (c(i) * x(i+1)) / betai(i);
end

solution = x;
end