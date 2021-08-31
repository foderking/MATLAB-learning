function [solution] = two_d_transient_with_symmetry(n, Tinit, Tsurr, cnt, M)
%TWO_D_TRANSIENT_WITH_SYMMETRY Solves transient heat conduction on two dimensions.
%Tinit: initial temperature of the surface
%M: alpha * dt / dx**2
%Tsurr: the temperature around the borders
%n: the number of unknowns

format compact

alph = 2 + 2/M
bet = 2/M -  2
offset = zeros(n, 1); offset(n) = Tsurr;
disp(' ')

t_n = Tinit * ones(n);
t_n_plus_half = zeros(n);
t_n_plus_1 = zeros(n);

coeff_matrix = tdm(n, -1, alph, -1); coeff_matrix(1,2) = -2
ii= 0 ;

while ii < cnt
    %%     FIRST SWEEP     %%%
    for jj = n:-1:1
        disp('    ')
        fprintf("j =  %d\n=====\n",n+1-jj);

        if jj == n
            c = 2 * t_n(jj-1, :)' - alph * t_n(jj, :)' + offset
        elseif jj == 1
            c = Tsurr + t_n(jj+1, :)' - alph * t_n(jj, :)' + offset
        else
            c = t_n(jj+1, :)' + t_n(jj-1, :)' - alph * t_n(jj, :)' + offset
        end
        disp(' ')
        values = coeff_matrix \  c
        t_n_plus_half(jj,:) = values;
    end
    ii = 1;
    c = 2 * t_n_plus_half(:, ii+1) - 1.6 * t_n_plus_half(:, ii) + flip(offset)
    coeff_matrix \ flip(c)
    % c = 2 * t_n_plus_half
    % fprintf("------------------------\n\n");
    % t_n_plus_half
    % fprintf("------------------------\n\n");

    % fprintf("\n\nTime for another sweep\n\n");
    % % %   SECOND SWEEP    %%
    % for jj = 1:n
    %     disp('    ')
    %     fprintf("i is %d\n=====\n", jj);

    %     if jj == 1
    %         c = 2 * t_n_plus_half(:, jj+1) - alph * t_n_plus_half(:, jj) + offset
    %     elseif jj == n
    %         c = Tsurr + t_n_plus_half(:, jj-1) - alph * t_n_plus_half(:, jj) + flip(offset)
    %     else
    %         c = t_n_plus_half(:, jj+1) + t_n_plus_half(:, jj-1) - alph * t_n_plus_half(:, jj) + flip(offset)
    %     end
    %     disp(' ')
    %     values = coeff_matrix \  flip(c)
    %     t_n_plus_1(jj,:) = values;
    % end
    % fprintf("------------------------\n\n");
    % t_n = t_n_plus_1;
    % t_n_plus_1
    ii = ii + 1;
end


end