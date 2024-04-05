function map = set1(n)
    %SET1 Wrapper function for mcbrewer to get a colormap
    % map = SET1(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Set1',n);
end