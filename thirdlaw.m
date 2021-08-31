u = input('input Initial velocity: ');

g = 9.81;
t = 0:0.1:10;
disp(u)
y = u.*t -  0.5 * (g.*t.^2);

plot(t, y, 'LineWidth', 1.5)
whitebg
xlabel('Time'), ylabel('Vertical Displacement')