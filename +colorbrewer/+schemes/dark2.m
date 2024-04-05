function map = dark2(n)
    %DARK2 Wrapper function for mcbrewer to get a colormap
    % map = DARK2(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Dark2',n);
end