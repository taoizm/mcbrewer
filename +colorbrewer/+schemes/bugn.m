function map = bugn(n)
    %BUGN Wrapper function for mcbrewer to get a colormap
    % map = BUGN(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('BuGn',n);
end