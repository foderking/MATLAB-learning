function [x1, x2] = quadroots(a, b, c)

if a == 0 && b == 0 && c == 0
    disp('Indeterminate !!')
    return;
elseif a == 0 && b ==0
    disp('No solution !!')
    return;
elseif a == 0
    disp('Linear:')
    x1 = -c / b;
    disp(["X" x1])
    return;
    
elseif b^2 == 4 * a * c
    disp('Equal roots')
    x1 = -b / (2 * a);
    x2 = x1;
else
    x1 = (-b + sqrt(b^2 - 4 * a * c)) / (2 * a);
    x2 = (-b + sqrt(b^2 + 4 * a * c)) / (2 * a);
end
disp(['' 10])
disp([ "X1" num2str(x1); "X2" num2str(x2)]);
end
