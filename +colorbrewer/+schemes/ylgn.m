function map = ylgn(n)
    %YLGN Wrapper function for mcbrewer to get a colormap
    % map = YLGN(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('YlGn',n);
end