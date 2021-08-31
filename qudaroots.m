function x = quadroots(a, b, c)

if a == 0 && b == 0 && c == 0
    disp(' ')
    disp('Solution indeterminate !!')
elseif a == 0 && b ==0
    disp(' ')
    disp('There is no solution')
elseif a == 0
    disp(' ')
    disp('Only one root: equation is linear')
    disp('              x               ')
    x1 = -c / b;
    x2 = NaN;
elseif b^2 < 4 * a * c
    disp(' ')
    disp('  x1, x2 are complex roots  ')
    disp('             x1                     x2                  ')
    x1 = (-b + sqrt(b^2 - 4 * a * c) )  / (2 * a);
    x2 = (-b + sqrt(b^2 + 4 * a * c) )  / (2 * a);
elseif b^2 == 4 * a * c
    x1 = -b / (2 * a);
    x2 = x1;
    disp('Equal roots')
    