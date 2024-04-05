function map = pubu(n)
    %PUBU Wrapper function for mcbrewer to get a colormap
    % map = PUBU(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('PuBu',n);
end