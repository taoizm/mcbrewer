function map = gnbu(n)
    %GNBU Wrapper function for mcbrewer to get a colormap
    % map = GNBU(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('GnBu',n);
end