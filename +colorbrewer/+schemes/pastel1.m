function map = pastel1(n)
    %PASTEL1 Wrapper function for mcbrewer to get a colormap
    % map = PASTEL1(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Pastel1',n);
end