function map = paired(n)
    %PAIRED Wrapper function for mcbrewer to get a colormap
    % map = PAIRED(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Paired',n);
end