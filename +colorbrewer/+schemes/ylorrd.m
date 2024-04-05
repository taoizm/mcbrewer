function map = ylorrd(n)
    %YLORRD Wrapper function for mcbrewer to get a colormap
    % map = YLORRD(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('YlOrRd',n);
end