function map = ylorbr(n)
    %YLORBR Wrapper function for mcbrewer to get a colormap
    % map = YLORBR(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('YlOrBr',n);
end