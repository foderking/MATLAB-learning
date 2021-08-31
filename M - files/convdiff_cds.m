function [solution] = convdiff_cds(n, pe, delx, Co, Cn)
%CONVDIFF_CDS solves convection diffusion problems
%using central difference for both parts
%   Where 'n' is the size of the vector, pe is pellet number, 
%   delx is the change in x
%   Co and Cn are the boundary points respectively.

pe_l = pe * delx;
alph = pe_l - 2;
bet = pe_l + 2;

A = tdm(n, -bet, 4, alph)
B = zeros(n, 1);
B(1) = bet * Co;
B(n) = -alph * Cn;
B

solution = A \ B;

end

