function [solution] = trans1d_rect(time, n, delx, delt, alph, tin, tlef, tri, dis)
    %TRANS1D_RECT Solves heat equation in rectangular with transient condition at symmetry.
    %   n: no of unknowns, time: time
    %   delx: change in x
    %   delt: change in t
    %   alph: alpha
    %   tin: initial temperature of the rectangular slab
    %   tlef: temperature of the slab at the left, 
    %   tri: temperature of the slab at the right.
    t = 0;
    M = alph * delt / delx^2
    
    tt = ones(n, 1);
    ti =  zeros(n, 1);
    ti(1) = M * tlef;
    ti(n) = tri * M;
    
    A = tdm(n, -M, 2*M+1, -M);
    
    C = tin * tt + ti;
    
    while t < time
        c = A \ C
        
        if dis  == 'h'
            h = heatmap(c, 'GridVisible', 'off');
            h.Colormap = jet;
            caxis([tin, tlef]);
        end

        if dis == 's'
            surf(meshgrid(c));
            shading interp;
            zlim([tin max([tri tlef])]);
        end

        pause(0.001);
        C = c .* tt + ti;
        t = t + delt
    end
    
% solution = C;
end
    