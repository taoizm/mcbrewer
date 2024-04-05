function map = set3(n)
    %SET3 Wrapper function for mcbrewer to get a colormap
    % map = SET3(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Set3',n);
end