function map = rdpu(n)
    %RDPU Wrapper function for mcbrewer to get a colormap
    % map = RDPU(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('RdPu',n);
end