classdef Scheme
    %SCHEME Enumeration class of color schemes
    %
    %   This product includes color specifications and designs
    %   developed by Cynthia Brewer (http://colorbrewer2.org/).
    %
    %   Scheme Properties:
    %       Type      - Object specifying the scheme type.
    %       NumColors - Number of colors specified by the scheme.
    %
    %   Scheme Methods:
    %       sort        - Overloaded function of the built-in sort.
    %       showCatalog - Diaplays a list of available color schemes,
    %                     their types, and the number of colors in the
    %                     original colormap.
    %       showCredits - Diaplays the acknowledgements or atributions
    %                     for the color schemes used in SCHEME.
    %
    % See also colorbrewer.Type
    
    % Copyright (c) 2023 Kentaro Tao
    
    properties (SetAccess = immutable)
        Type colorbrewer.Type
        NumColors (1,1) double {mustBeNumeric}
        Palette   (:,3) double {mustBeNumeric}
%         IsColorBlindSafe
    end
    
    methods
        function obj = Scheme(type,palette)
            %SCHEME Constructor
            obj.Type = type;
            obj.Palette = palette;
            switch type
                case 'Qualitative'
                    obj.NumColors = size(palette,1);
                otherwise % 'Sequential' | 'Diverging'
                    obj.NumColors = length(type.IndexMapping{end});
            end
        end
        
        function [B,I] = sort(varargin)
            %SORT Overloaded function for the builtin sort
            A = varargin{1};
            varargin{1} = string(A);
            [~,I] = sort(varargin{:});
            B = A(I);
        end
    end

    methods (Access = private, Static)
        function schemes = getSchemeByType(type)
            %GETSCHEMEBYTYPE
            arguments
                type colorbrewer.Type = colorbrewer.Type.empty
            end
            schemes = enumeration('colorbrewer.Scheme');
            if ~isempty(type)
                schemes = schemes(arrayfun(@(s)(s.Type==type),schemes));
            end
        end % getSchemeByType

        function tbl = getCatalog(type)
            %GETCATALOG
            arguments
                type colorbrewer.Type = colorbrewer.Type.empty
            end            
            schemes = colorbrewer.Scheme.getSchemeByType(type);
            % Create a table
            tbl = table(schemes, ...
                arrayfun(@(s)s.Type,schemes), ...
                arrayfun(@(s)s.NumColors,schemes), ...
                'VariableNames',{'Scheme','Type','NumColors'});
        end % getCatalog
    end
    
    methods (Static)
        function showCatalog(opts)
            %SHOWCATALOG
            %   Scheme.showCatalog('Name',Value) displays a list of available
            %   color schemes based on the specified name-value pairs.
            %
            %   Scheme.showCatalog('Type',Value) filters the list according to the
            %   provided scheme type. If not provided, all color schemes are
            %   displayed.Value can be:
            %       'Qualitative' | 'Sequential' | 'Diverging'
            %
            %   Scheme.showCatalog('SortBy',Value) sorts the table by the element
            %   specified by the value. Value can be:
            %       'Scheme' | 'Type' | 'NumColors'
            %
            %   Scheme.showCatalog('Direction',Value) specifies the sorting order.
            %   Value can be:
            %       'ascend' | 'descend'
            arguments
                opts.Type colorbrewer.Type = colorbrewer.Type.empty
                opts.SortBy char...
                    {mustBeMember(opts.SortBy,{'Scheme','Type','NumColors'})} = 'Scheme'
                opts.Direction char ...
                    {mustBeMember(opts.Direction,{'ascend','descend'})} = 'ascend'
            end
            % Get and sort a catalog table
            tbl = colorbrewer.Scheme.getCatalog(opts.Type);
            tbl = sortrows(tbl,opts.SortBy,opts.Direction);
            % Show the table
            disp(' ')
            disp(tbl)
        end % showCatalog
        
        function showCredits
            %SHOWCREDITS Displays the acknowledgements
            disp('This product includes color specifications and designs')
            disp('developed by Cynthia Brewer (<a href="http://colorbrewer2.org/">http://colorbrewer2.org/</a>).')
        end % showCredits
    end
    
    enumeration
        % Type:Qualitative, NumColors:8
        Accent(colorbrewer.Type.Qualitative, ...
            [127 201 127
             190 174 212
             253 192 134
             255 255 153
              56 108 176
             240   2 127
             191  91  23
             102 102 102])
        % Type:Sequential, NumColors:9
        Blues(colorbrewer.Type.Sequential, ...
            [247 251 255
             239 243 255
             222 235 247
             198 219 239
             189 215 231
             158 202 225
             107 174 214
              66 146 198
              49 130 189
              33 113 181
               8  81 156
               8  69 148
               8  48 107])
        % Type:Diverging, NumColors:10
        BrBG(colorbrewer.Type.Diverging, ...
            [ 84  48   5
             140  81  10
             166  97  26
             191 129  45
             216 179 101
             223 194 125
             246 232 195
             245 245 245
             199 234 229
             128 205 193
              90 180 172
              53 151 143
               1 133 113
               1 102  94
               0  60  48])
        % Type:Sequential, NumColors:9
        BuGn(colorbrewer.Type.Sequential, ...
            [247 252 253
             237 248 251
             229 245 249
             204 236 230
             178 226 226
             153 216 201
             102 194 164
              65 174 118
              44 162  95
              35 139  69
               0 109  44
               0  88  36
               0  68  27])
        % Type:Sequential, NumColors:9
        BuPu(colorbrewer.Type.Sequential, ...
            [247 252 253
             237 248 251
             224 236 244
             191 211 230
             179 205 227
             158 188 218
             140 150 198
             140 107 177
             136  86 167
             136  65 157
             129  15 124
             110   1 107
              77   0  75])
        % Type:Qualitative, NumColors:8
        Dark2(colorbrewer.Type.Qualitative, ...
            [ 27 158 119
             217  95   2
             117 112 179
             231  41 138
             102 166  30
             230 171   2
             166 118  29
             102 102 102])
        % Type:Sequential, NumColors:9
        GnBu(colorbrewer.Type.Sequential, ...
            [247 252 240
             240 249 232
             224 243 219
             204 235 197
             186 228 188
             168 221 181
             123 204 196
              78 179 211
              67 162 202
              43 140 190
               8 104 172
               8  88 158
               8  64 129])
        % Type:Sequential, NumColors:9
        Greens(colorbrewer.Type.Sequential, ...
            [247 252 245
             237 248 233
             229 245 224
             199 233 192
             186 228 179
             161 217 155
             116 196 118
              65 171  93
              49 163  84
              35 139  69
               0 109  44
               0  90  50
               0  68  27])
        % Type:Sequential, NumColors:9
        Greys(colorbrewer.Type.Sequential, ...
            [255 255 255
             247 247 247
             240 240 240
             217 217 217
             204 204 204
             189 189 189
             150 150 150
             115 115 115
              99  99  99
              82  82  82
              37  37  37
              37  37  37
               0   0   0])
        % Type:Sequential, NumColors:9
        OrRd(colorbrewer.Type.Sequential, ...
            [255 247 236
             254 240 217
             254 232 200
             253 212 158
             253 204 138
             253 187 132
             252 141  89
             239 101  72
             227  74  51
             215  48  31
             179   0   0
             153   0   0
             127   0   0])
        % Type:Sequential, NumColors:9
        Oranges(colorbrewer.Type.Sequential, ...
            [255 245 235
             254 237 222
             254 230 206
             253 208 162
             253 190 133
             253 174 107
             253 141  60
             241 105  19
             230  85  13
             217  71   1
             166  54   3
             140  45   4
             127  39   4])
        % Type:Diverging, NumColors:10
        PRGn(colorbrewer.Type.Diverging, ...
            [ 64   0  75
             118  42 131
             123  50 148
             153 112 171
             175 141 195
             194 165 207
             231 212 232
             247 247 247
             217 240 211
             166 219 160
             127 191 123
              90 174  97
               0 136  55
              27 120  55
               0  68  27])
        % Type:Qualitative, NumColors:12
        Paired(colorbrewer.Type.Qualitative, ...
            [166 206 227
              31 120 180
             178 223 138
              51 160  44
             251 154 153
             227  26  28
             253 191 111
             255 127   0
             202 178 214
             106  61 154
             255 255 153
             177  89  40])
        % Type:Qualitative, NumColors:9
        Pastel1(colorbrewer.Type.Qualitative, ...
            [251 180 174
             179 205 227
             204 235 197
             222 203 228
             254 217 166
             255 255 204
             229 216 189
             253 218 236
             242 242 242])
        % Type:Qualitative, NumColors:8
        Pastel2(colorbrewer.Type.Qualitative, ...
            [179 226 205
             253 205 172
             203 213 232
             244 202 228
             230 245 201
             255 242 174
             241 226 204
             204 204 204])
        % Type:Diverging, NumColors:10
        PiYG(colorbrewer.Type.Diverging, ...
            [142   1  82
             197  27 125
             208  28 139
             222 119 174
             233 163 201
             241 182 218
             253 224 239
             247 247 247
             230 245 208
             184 225 134
             161 215 106
             127 188  65
              77 172  38
              77 146  33
              39 100  25])
        % Type:Sequential, NumColors:9
        PuBu(colorbrewer.Type.Sequential, ...
            [255 247 251
             241 238 246
             236 231 242
             208 209 230
             189 201 225
             166 189 219
             116 169 207
              54 144 192
              43 140 190
               5 112 176
               4  90 141
               3  78 123
               2  56  88])
        % Type:Sequential, NumColors:9
        PuBuGn(colorbrewer.Type.Sequential, ...
            [255 247 251
             246 239 247
             236 226 240
             208 209 230
             189 201 225
             166 189 219
             103 169 207
              54 144 192
              28 144 153
               2 129 138
               1 108  89
               1 100  80
               1  70  54])
        % Type:Diverging, NumColors:10
        PuOr(colorbrewer.Type.Diverging, ...
            [127  59   8
             179  88   6
             230  97   1
             224 130  20
             241 163  64
             253 184  99
             254 224 182
             247 247 247
             216 218 235
             178 171 210
             153 142 195
             128 115 172
              94  60 153
              84  39 136
              45   0  75])
        % Type:Sequential, NumColors:9
        PuRd(colorbrewer.Type.Sequential, ...
            [247 244 249
             241 238 246
             231 225 239
             212 185 218
             215 181 216
             201 148 199
             223 101 176
             231  41 138
             221  28 119
             206  18  86
             152   0  67
             145   0  63
             103   0  31])
        % Type:Sequential, NumColors:9
        Purples(colorbrewer.Type.Sequential, ...
            [252 251 253
             242 240 247
             239 237 245
             218 218 235
             203 201 226
             188 189 220
             158 154 200
             128 125 186
             117 107 177
             106  81 163
              84  39 143
              74  20 134
              63   0 125])
        % Type:Diverging, NumColors:10
        RdBu(colorbrewer.Type.Diverging, ...
            [103   0  31
             178  24  43
             202   0  32
             214  96  77
             239 138  98
             244 165 130
             253 219 199
             247 247 247
             209 229 240
             146 197 222
             103 169 207
              67 147 195
               5 113 176
              33 102 172
               5  48  97])
        % Type:Diverging, NumColors:10
        RdGy(colorbrewer.Type.Diverging, ...
            [103   0  31
             178  24  43
             202   0  32
             214  96  77
             239 138  98
             244 165 130
             253 219 199
             255 255 255
             224 224 224
             186 186 186
             153 153 153
             135 135 135
              64  64  64
              77  77  77
              26  26  26])
        % Type:Sequential, NumColors:9
        RdPu(colorbrewer.Type.Sequential, ...
            [255 247 243
             254 235 226
             253 224 221
             252 197 192
             251 180 185
             250 159 181
             247 104 161
             221  52 151
             197  27 138
             174   1 126
             122   1 119
             122   1 119
              73   0 106])
        % Type:Diverging, NumColors:10
        RdYlBu(colorbrewer.Type.Diverging, ...
            [165   0  38
             215  48  39
             215  25  28
             244 109  67
             252 141  89
             253 174  97
             254 224 144
             255 255 191
             224 243 248
             171 217 233
             145 191 219
             116 173 209
              44 123 182
              69 117 180
              49  54 149])
        % Type:Diverging, NumColors:10
        RdYlGn(colorbrewer.Type.Diverging, ...
            [165   0  38
             215  48  39
             215  25  28
             244 109  67
             252 141  89
             253 174  97
             254 224 139
             255 255 191
             217 239 139
             166 217 106
             145 207  96
             102 189  99
              26 150  65
              26 152  80
               0 104  55])
        % Type:Sequential, NumColors:9
        Reds(colorbrewer.Type.Sequential, ...
            [255 245 240
             254 229 217
             254 224 210
             252 187 161
             252 174 145
             252 146 114
             251 106  74
             239  59  44
             222  45  38
             203  24  29
             165  15  21
             153   0  13
             103   0  13])
        % Type:Qualitative, NumColors:9
        Set1(colorbrewer.Type.Qualitative, ...
            [228  26  28
              55 126 184
              77 175  74
             152  78 163
             255 127   0
             255 255  51
             166  86  40
             247 129 191
             153 153 153])
        % Type:Qualitative, NumColors:8
        Set2(colorbrewer.Type.Qualitative, ...
            [102 194 165
             252 141  98
             141 160 203
             231 138 195
             166 216  84
             255 217  47
             229 196 148
             179 179 179])
        % Type:Qualitative, NumColors:12
        Set3(colorbrewer.Type.Qualitative, ...
            [141 211 199
             255 255 179
             190 186 218
             251 128 114
             128 177 211
             253 180  98
             179 222 105
             252 205 229
             217 217 217
             188 128 189
             204 235 197
             255 237 111])
        % Type:Diverging, NumColors:10
        Spectral(colorbrewer.Type.Diverging, ...
            [158   1  66
             213  62  79
             215  25  28
             244 109  67
             252 141  89
             253 174  97
             254 224 139
             255 255 191
             230 245 152
             171 221 164
             153 213 148
             102 194 165
              43 131 186
              50 136 189
              94  79 162])
        % Type:Sequential, NumColors:9
        YlGn(colorbrewer.Type.Sequential, ...
            [255 255 229
             255 255 204
             247 252 185
             217 240 163
             194 230 153
             173 221 142
             120 198 121
              65 171  93
              49 163  84
              35 132  67
               0 104  55
               0  90  50
               0  69  41])
        % Type:Sequential, NumColors:9
        YlGnBu(colorbrewer.Type.Sequential, ...
            [255 255 217
             255 255 204
             237 248 177
             199 233 180
             161 218 180
             127 205 187
              65 182 196
              29 145 192
              44 127 184
              34  94 168
              37  52 148
              12  44 132
               8  29  88])
        % Type:Sequential, NumColors:9
        YlOrBr(colorbrewer.Type.Sequential, ...
            [255 255 229
             255 255 212
             255 247 188
             254 227 145
             254 217 142
             254 196  79
             254 153  41
             236 112  20
             217  95  14
             204  76   2
             153  52   4
             140  45   4
             102  37   6])
        % Type:Sequential, NumColors:9
        YlOrRd(colorbrewer.Type.Sequential, ...
            [255 255 204
             255 255 178
             255 237 160
             254 217 118
             254 204  92
             254 178  76
             253 141  60
             252  78  42
             240  59  32
             227  26  28
             189   0  38
             177   0  38
             128   0  38])
    end
    
end

