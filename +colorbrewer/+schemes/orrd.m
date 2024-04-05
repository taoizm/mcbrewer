function map = orrd(n)
    %ORRD Wrapper function for mcbrewer to get a colormap
    % map = ORRD(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('OrRd',n);
end