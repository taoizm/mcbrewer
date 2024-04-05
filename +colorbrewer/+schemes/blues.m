function map = blues(n)
    %BLUES Wrapper function for mcbrewer to get a colormap
    % map = BLUES(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Blues',n);
end