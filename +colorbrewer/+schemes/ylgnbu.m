function map = ylgnbu(n)
    %YLGNBU Wrapper function for mcbrewer to get a colormap
    % map = YLGNBU(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('YlGnBu',n);
end