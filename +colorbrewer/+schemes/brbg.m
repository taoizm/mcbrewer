function map = brbg(n)
    %BRBG Wrapper function for mcbrewer to get a colormap
    % map = BRBG(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('BrBG',n);
end