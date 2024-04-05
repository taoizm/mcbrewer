function map = piyg(n)
    %PIYG Wrapper function for mcbrewer to get a colormap
    % map = PIYG(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('PiYG',n);
end