clear;clc
% Let us consider the following arbitrarily selected matrix:
A = magic(3);
% Let us evaluate its inverse as follows:
AI = inv(A);
% Let us check that it is an inverse:
IPredicted = A * AI;
% This is the exact unitary matrix:
IM = eye(3);
% The is the difference between the exact and predict unitary
% matrix:
%% This is an example to illustrate how easy it is to create a document in the PUBLISH environment.
%
%%
% $x^2+e^{\pi i}$
% 
% $$e^{\pi i} + 1 = 0$$
% 
difference = IPredicted - IM;
for m = 1:3
    for n = 1:3
        if difference(m,n) < eps
            IPredicted(m,n) = IM(m,n);
        end
    end
end
IPredicted;
IPredicted == IM;
