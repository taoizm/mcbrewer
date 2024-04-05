function map = rdylgn(n)
    %RDYLGN Wrapper function for mcbrewer to get a colormap
    % map = RDYLGN(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('RdYlGn',n);
end