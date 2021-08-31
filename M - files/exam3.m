t_nplus_one = zeros(8, 1);
t_nplus_half = zeros(8, 1);
t_n = [400;400;300;250;400;300;300;300];
c_a = [-4 1; 2 -4];
c_b = c_a; c_c = c_a;
c_d = [4 -0.5; -1 4];

cc = tdm(4, 1, -4, 1);
xx = 0;
err  = 0.05;

disp('Guessed values: ')
disp(t_n)


while  any(abs(t_n - t_nplus_half)) > err
    %===========
    % FIRST HALF
    % ==========

    t_nplus_half = t_n;
    % First set 
    tr = [-1000; -500] - t_n(3:4); % Transformation
    t_n(1:2) = c_a \ tr;
    % Second set
    tr = -t_n(1:2) - t_n(5:6) - [500;0];
    t_n(3:4) = c_b \ tr;
    % Third set
    tr = -t_n(3:4) - t_n(7:8) - [500;0];
    t_n(5:6) = c_c \ tr;
    % Fourth set
    tr = t_n(5:6) + [850; 600];
    t_n(7:8) = c_d \ tr;


    %============
    % SECOND HALF
    % ===========

    % First set
    tr = [-1000;-500*ones(2,1); -850] - [ones(3,1); 0.5] .* t_n(2:2:8);
    t_nplus_one(1:2:7) = cc \ tr;
    % second set
    tr = [-500; zeros(2,1);-600] - [2*ones(3,1);1] .* t_n(1:2:7);
    t_nplus_one(2:2:8) = cc \ tr;

    if xx == 0
        disp('For first iteration:')
        disp('tn+0.5: ')
        disp(t_n)
        disp('tn+1: ')
        disp(t_nplus_one)
    end
    xx = xx + 1;
end


disp(['Converged after ',num2str(xx), ' iterations'])
disp('===============')
disp('tn+0.5: ')
disp(t_n)
disp('tn+1: ')
disp(t_nplus_one)

