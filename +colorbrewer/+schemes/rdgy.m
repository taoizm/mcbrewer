function map = rdgy(n)
    %RDGY Wrapper function for mcbrewer to get a colormap
    % map = RDGY(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('RdGy',n);
end