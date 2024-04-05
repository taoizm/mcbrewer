function map = oranges(n)
    %ORANGES Wrapper function for mcbrewer to get a colormap
    % map = ORANGES(N) returns N-by-3 matrix containing a colormap.
    % See also mcbrewer, colorbrewer.Scheme
    arguments
        n {mustBeScalarOrEmpty} = []
    end
    map = mcbrewer('Oranges',n);
end