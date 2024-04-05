function map = accent(n)
    %ACCENT Wrapper function for mcbrewer to get a colormap
    % map = ACCENT(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Accent',n);
end