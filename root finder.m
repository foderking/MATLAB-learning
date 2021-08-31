no = input('Type in a number whose root you want to find');
guess = no * 0.5;

acc = input('Type in the accuracy');
x = no;
for i = 1:acc
    x = 0.5 * (x + a / x);
    disp(x);
end

