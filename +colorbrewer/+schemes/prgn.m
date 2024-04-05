function map = prgn(n)
    %PRGN Wrapper function for mcbrewer to get a colormap
    % map = PRGN(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('PRGn',n);
end