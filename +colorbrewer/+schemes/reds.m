function map = reds(n)
    %REDS Wrapper function for mcbrewer to get a colormap
    % map = REDS(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Reds',n);
end