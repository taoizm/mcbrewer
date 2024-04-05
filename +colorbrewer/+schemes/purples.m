function map = purples(n)
    %PURPLES Wrapper function for mcbrewer to get a colormap
    % map = PURPLES(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Purples',n);
end