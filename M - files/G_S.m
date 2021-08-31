function [solution] = G_S(m, a, b, e, ex)
%G_SEIDEL_ Summary of this function goes here
%   Detailed explanation goes here

n = length(m);

e = e * ones(n);
x = 0;

while 1
    mi = m;
    for i = a: b
        for j = a: b
            if m(i, j) ~= ex
                m(i, j) = 0.25 * (m(i-1, j) + m(i+1, j) + m(i, j+1) + m(i, j-1));
            end
        end
    end
    if abs(m - mi) < e 
        x
        solution = m;
        return
    end
    x  = x + 1;
end

end