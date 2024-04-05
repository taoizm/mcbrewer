function map = set2(n)
    %SET2 Wrapper function for mcbrewer to get a colormap
    % map = SET2(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Set2',n);
end