function solution  = tdm(n, a, b, c)
%Generates symettric matrix to be used to TDMA calculations
% a: subdiagonal, b: diagonal, c: superdiagonal.
%   Detailed explanation goes here
% bla bla bla
% z = rand(n);
% a = triu(z, -1) - triu(z, 2);
% b = rand(1, n);
% TDMA(a, b)

solution = diag(b * ones(1, n)) + diag(c * ones(1, n-1), 1) + diag(a * ones(1, n-1), -1);
end

