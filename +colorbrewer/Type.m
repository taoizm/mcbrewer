classdef Type
    %TYPE Enumeration class of scheme types
    %
    %   This product includes color specifications and designs
    %   developed by Cynthia Brewer (http://colorbrewer2.org/).
    %
    %   Type Properties:
    %       IndexMapping - Cell array containing indices to extract exactly
    %                      the same colors as the online ColorBrewer schemes.
    %
    %   Type Methods:
    %       sort - Overloaded function of the built-in sort function.
    %
    %   Type Enumerations:
    %       Qualitative - Suited to representing nominal or categorical data.
    %       Sequential  - Suited to ordered data progressing from low to high.
    %       Diverging   - Effective when the class break in the middle of the 
    %                     sequence is meaningfully related to the mapped data.
    
    % Copyright (c) 2023 Kentaro Tao
    
    properties (SetAccess = immutable)
        IndexMapping cell
    end
    
    methods
        function obj = Type(map)
            %TYPE Constructor
            obj.IndexMapping = map;
        end
        
        function [B,I] = sort(varargin)
            %SORT Overloaded function of the builtin sort
            A = varargin{1};
            varargin{1} = string(A);
            [~,I] = sort(varargin{:});
            B = A(I);
        end
    end
    
    enumeration
        Qualitative({ ...
            })

        Sequential({ ...
            [3 6 9]
            [2 5 7 10] 
            [2 5 7 9 11]
            [2 4 6 7 9 11] 
            [2 4 6 7 8 10 12]
            [1 3 4 6 7 8 10 12]
            [1 3 4 6 7 8 10 11 13]
            })

        Diverging({ ...
            [5 8 11]
            [3 6 10 13]
            [3 6 8 10 13]
            [2 5 7 9 11 14]
            [2 5 7 8 9 11 14]
            [2 4 6 7 9 10 12 14]
            [2 4 6 7 8 9 10 12 14]
            [1 2 4 6 7 9 10 12 14 15]
            [1 2 4 6 7 8 9 10 12 14 15]
            })
    end
end

