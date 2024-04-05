function map = pastel2(n)
    %PASTEL2 Wrapper function for mcbrewer to get a colormap
    % map = PASTEL2(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Pastel2',n);
end