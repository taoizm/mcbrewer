function map = greys(n)
    %GREYS Wrapper function for mcbrewer to get a colormap
    % map = GREYS(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Greys',n);
end