function map = pubugn(n)
    %PUBUGN Wrapper function for mcbrewer to get a colormap
    % map = PUBUGN(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('PuBuGn',n);
end