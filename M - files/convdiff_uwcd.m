function [solution] = convdiff_uwcd(n, pe, delx, Co, Cn)
%CONVDIFF_UWCD solves convection diffusion problems
%using central difference conduction part, upwind difference for convection.
%   Where 'n' is the size of the vector, pe is pellet number, 
%   delx is the change in x
%   Co and Cn are the boundary points respectively.

pe_l = pe * delx;
gamm = pe_l + 1
bet = pe_l + 2

A = tdm(n, -gamm, bet, -1)
B = zeros(n, 1);
B(1) = gamm * Co;
B(n) = Cn;
B
solution = A \ B;
end

