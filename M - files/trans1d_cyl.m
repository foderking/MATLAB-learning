function [outputArg1,outputArg2] = trans1d_cyl(time, n, delx, delt, alph, tin, tout)
    %TRANS1D_RECT Solves heat equation in rectangular with transient condition at symmetry.
    %   n: no of unknowns
    %   delx: change in x
    %   delt: change in t
    %   alph: alpha
    %   tin: initial temperature of the rectangular slab
    %   tout: temperature of the slab at the border
    t = 0;
    M = alph * delt / delx^2
    
    tt = -1 * ones(n, 1);
    ti =  zeros(n, 1);
    ti(n) = tout * M * 7 / 6;
    
    A = tdm(n, M, -2*M-1, M);
    A(1,1) = -4*M - 1;
    
    C = tin * tt - ti;
    
    while t < time
        t = t + delt
        c = A \ C
        h = heatmap(c);
        h.Colormap = parula;
        caxis([tin, tout]);
        pause(0.5);
        C = c .* tt - ti;
    end
    
end