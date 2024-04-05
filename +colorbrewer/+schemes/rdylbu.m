function map = rdylbu(n)
    %RDYLBU Wrapper function for mcbrewer to get a colormap
    % map = RDYLBU(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('RdYlBu',n);
end