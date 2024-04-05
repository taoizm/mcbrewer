function map = bupu(n)
    %BUPU Wrapper function for mcbrewer to get a colormap
    % map = BUPU(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('BuPu',n);
end