function [solution] = gauss(A, B)
%GAUSS: Implementation of the Gauss Elimination method.
%   A is a (n x n) vector containing the coefficients of x.
%   B is a (1 x n) vector containg the solutions to the equations.
% Complexity = O(n4)

M = [A, B'];  % Augmented matrix
n = length(B);
x = zeros(1, n);
% Goes throught each pivot
for i = 1: n-1
    % Goes through each equation under pivot
    for j = i+1 : n
        elim = -M(j,i) / M(i,i);
        for k = i: n+1
            M(j, k) = M(j, k) + M(i, k) * elim;
        end
    end
end

% Get x through backward substitution
x(n) = M(n, n+1) / M(n, n);
for i = n: -1:  1
    coeff = M(i,i+1:n);
    xn = x(i+1:n);
    x(i) = (M(i, n+1) - sum(xn .* coeff)) / M(i, i);
end

solution = x;
end