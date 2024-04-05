function map = mcbrewer(scheme,N,I)
%MCBREWER MATLAB colormaps based on Cynthia Brewer's color schemes
%
%   MAP = MCBREWER('SCHEME') returns a colormap for the specified SCHEME,
%   with the same number of colors as the current figure. If no figure exists,
%   MCBREWER uses the length of the default colormap, which is 256 by default.
%
%   MAP = MCBREWER('SCHEME',N) returns an N-by-3 matrix containing a colormap.
%   If N is larger than the maximum number of colors in the original colormap,
%   MCBREWER uses linear interpolation to obtain additional color values.
%
%   MAP = MCBREWER('SCHEME',N,I) extracts numel(I)-by-3 subcolormap
%   specified by the color index I from the colormap.
%
%   Calling MCBREWER without input/output arguments displays a list of
%   available color schemes, their types, and the number of colors in the
%   original colormap.
%
%   Each color scheme has a corresponding wrapper function for MCBREWER
%   named after the scheme itself:
%   
%   >> map = scheme(n)
%
%   This works in the same manner as:
%
%   >> map = MCBREWER('Scheme',n)
%
%   This provides a convenient method for setting the colormap of the
%   current figure:
%   
%   >> colormap(scheme)
%
%   By default, these wrapper functions are organized within a namespace
%   '+colorbrewer/+schemes'. To access those functions, type:
%
%   >> map = colorbrewer.schemes.scheme(n)
%
%   or:
%
%   >> import colorbrewer.schemes.*
%   >> map = scheme(n)
%
%   Inputs:
%       scheme - String specifying the color scheme.
%       N      - Scalar specifying the number of colors in the palette and
%                its direction. If N is negative, the colormap is inverted.
%                abs(N) must be in the range of 3 to 256.
%       I      - Scalar or vector specifying the color indices to extract.
%   
%   Outputs:
%       map    - N-by-3 matrix containing N sets of RGB values.
%
% See also colorbrewer.Scheme, colorbrewer.Type, colormap

% This product includes color specifications and designs
% developed by Cynthia Brewer (http://colorbrewer2.org/).
%
% The original product is licensed under the Apache License 2.0
%
%   http://www.apache.org/licenses/LICENSE-2.0
%
% Original copyright notice:
%   Copyright (c) 2002 Cynthia Brewer, Mark Harrower, and 
%   The Pennsylvania State University.
%
% I have made the following modifications and adaptations to the original
% data and implementation for use with MATLAB:
% 
%   1. I have eliminated redundancy in the original color matrices by
%      implementing a color choice rule, called 'IndexMapping', which
%      constructs colormaps without overlap.
%   2. I have created an enumeration class 'Type' to accommodate the
%      specific color choide rules for each scheme type:
%      'Sequential', 'Qualitative', and 'Diverging'.
%   3. I have developed an enumeration class 'Scheme' that stores a set of
%      color schemes and selects colors according to the 'IndexMapping'
%      stored in the 'Type' object.
%   4. I have implemented a linear interpolation method to extend the
%      functionality of 'mcbrewer', enabling it to generate colormaps with
%      up to 256 colors, beyond the limits of the original color schemes.


%   Copyright (c) 2023 Kentaro Tao
%   Released under the MIT license.
%   See https://opensource.org/license/mit/

arguments
    scheme colorbrewer.Scheme = colorbrewer.Scheme.empty
    N double {mustBeValidNumColors(N)} = []
    I double {mustBeValidIndex(N,I)} = []
end

if isempty(scheme)
    colorbrewer.Scheme.showCatalog;
    colorbrewer.Scheme.showCredits;
    return
end

if isempty(N)
   f = get(groot,'CurrentFigure');
   if isempty(f)
      N = size(get(groot,'DefaultFigureColormap'),1);
   else
      N = size(f.Colormap,1);
   end
end

shouldFlip = N < 0;
N = abs(N);

if scheme.Type == "Qualitative" && N > scheme.NumColors
    N = scheme.NumColors;
end

switch scheme.Type
    case "Qualitative"
        map = scheme.Palette(1:N,:);
    otherwise % "Sequential" | "Diverging"
        if N > scheme.NumColors
            % Linear interpolation
            idx = scheme.Type.IndexMapping{end};
            P = length(idx);
            map = interp1(1:P,scheme.Palette(idx,:),linspace(1,P,N),'linear');
        else
            map = scheme.Palette(scheme.Type.IndexMapping{N-2},:);
        end
end

map = map / 255;

% Flip upside down
if shouldFlip
    map = flipud(map);
end

% Extract colors specified by the indices
if ~isempty(I)
    map = map(I,:);
end

end % cbrewer

function mustBeValidNumColors(n)
    if ~isempty(n) && (abs(n) < 3 || 256 < abs(n))
        error('Absolute value of N must be an integer between 3 and 256.')
    end
end

function mustBeValidIndex(n,idx)
    if ~isempty(n) && any(idx<1 | n<idx)
        error('Invalid color index.')
    end
end

% ------------------------------------------------------------------------
% Copyright (c) 2002 Cynthia Brewer, Mark Harrower, and 
% The Pennsylvania State University.
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
% 
%     http://www.apache.org/licenses/LICENSE-2.0
% 
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%
% 1. Redistributions as source code must retain the above copyright notice,
%    this list of conditions and the following disclaimer.
%
% 2. The end-user documentation included with the redistribution, if any,
%    must include the following acknowledgment:
%    "This product includes color specifications and designs 
%    developed by Cynthia Brewer (http://colorbrewer.org/)."
%    Alternately, this acknowledgment may appear in the software itself,
%    if and wherever such third-party acknowledgments normally appear.
%
% 4. The name "ColorBrewer" must not be used to endorse or promote products
%    derived from this software without prior written permission.
%    For written permission, please contact Cynthia Brewer at cbrewer@psu.edu.
%
% 5. Products derived from this software may not be called "ColorBrewer",
%    nor may "ColorBrewer" appear in their name, without prior written
%    permission of Cynthia Brewer.
% ------------------------------------------------------------------------

