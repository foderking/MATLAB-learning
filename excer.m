% % salary = [12000,15000, 18000, 24000, 35000, 50000, 70000]';
% % employees = [3000, 2500, 1500, 1000 400 100 25]';
% % no = sum(logical(salary))

% % M_salary = sum(salary) / no

% % below = sum(employees .* (salary < M_salary) )
% % above = sum(employees .* (salary > M_salary) )

% % E_emp = sum(employees)
% % E_salary = sum(employees .* salary)

% % M_salary = E_salary /  E_emp

% res = [200, 500, 700, 1000 1500]

% electricity = [(res <= 500) * 0.02 .* res; ...
%                (res <= 1000 & res > 500) .* ((res - 500) * 0.05 + 10); ...
%                (res > 1000) .* ((res - 1000) * 0.1 + 35) ...
%                ]

% fee = logical(electricity) * 5

% total = electricity  + fee

% % Fixed point iteration

% xn = 1; x = 0
% while abs(x - xn) > 0.00000001
%     x = xn;
%     xn = 1 / (1 + x^2)
% end

% disp(xn)



syms x y 
f = x^2 * y + y^2 * x - x * y;
fx = diff(f, x);
fy = diff(f, y);
eqns = [fx == 0, fy == 0]
vars = [x y];
[solx, soly] = solve(eqns, vars)