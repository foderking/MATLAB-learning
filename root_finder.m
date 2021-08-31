% %%t = 0:0.1:30; k = 1; R = 0:0.2:2;
% 
% w1 = sqrt(k - R.^2 / 4);
% %y = exp(-R' / 2 * t) .* ( sin(w1' .* t) .* ones( size(R') ) ); 
% 
% plot(t, y, 'LineWidth', 1.5)
% whitebg

W = 100; T = 1000; EI = 10e4; L = 10; x = 0:0.1:L; 

a = sqrt( T / EI );

y = W / T^2 * EI  * ( cosh( a * (L / 2 - x) ) / cosh(a * L / 2) - 1 ) + W / (2 * T) * x .* (L - x);

plot(x, y, 'LineWidth', 1.5)
axis( [min(x) max(x) min(y) max(y)] )