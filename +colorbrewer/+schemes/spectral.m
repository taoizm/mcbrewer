function map = spectral(n)
    %SPECTRAL Wrapper function for mcbrewer to get a colormap
    % map = SPECTRAL(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Spectral',n);
end