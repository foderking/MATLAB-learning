coeff = tdm(9, -5.05, 12.7005, -4.95);  % TDMA  matrix on the L.H.S
dt = 0.05; % time step
Co = zeros(9, 1);  % Initial concentration

% Coefficients of the linear transformation for the R.H.S
a1 = [1010; 5.05*ones(8, 1)];
a2 = 8.0075 * ones(9, 1);
a3 = ones(9, 1) * 4.95;

c = Co;

for t = dt:dt:2
    ct = a1 .* [1;c(1:8)] - a2.*c + a3.*[c(2:9); 0];  % transforms the RHS
    c = coeff \ ct;
end

disp('Concentration at 2 mins')
disp(c)
plot(c)