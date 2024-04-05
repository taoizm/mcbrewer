function map = purd(n)
    %PURD Wrapper function for mcbrewer to get a colormap
    % map = PURD(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('PuRd',n);
end