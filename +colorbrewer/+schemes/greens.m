function map = greens(n)
    %GREENS Wrapper function for mcbrewer to get a colormap
    % map = GREENS(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Greens',n);
end