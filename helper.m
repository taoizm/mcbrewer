% A helper script to set up lines and files necessary for 
% implememting mcbrewer. Users do not need to run this.

%% Output a list of color schemes as enumeration classes
filepath = fullfile(pwd,'+colorbrewer','colorbrewer.csv');

opts = detectImportOptions(filepath);
opts = opts.setvartype([1 6 10],'string');
opts = opts.setvartype([2 7:9],'double');
opts.DataLines = [2 1690];

T = readtable(filepath,opts);

varNames = T.Properties.VariableNames;

for ii=1:length(varNames)
    if any(ismissing(T.(varNames{ii})))
        T.(varNames{ii}) = fillmissing(T.(varNames{ii}),'previous');
    end
end

schemeNames = unique(T.ColorName);

Schemes = struct;

for ii=1:length(schemeNames)
    rows = find(T.ColorName == schemeNames(ii));
    [~,ia,~] = unique(T.ColorLetter(rows));
    rows = rows(ia);
    Schemes(ii).Name = schemeNames(ii);
    Schemes(ii).Type = T.SchemeType(rows(1));
    Schemes(ii).Palette = [T.R(rows) T.G(rows) T.B(rows)];
    Schemes(ii).NumColors = max(T.NumOfColors(rows));
end

for ii=1:length(schemeNames)
    fprintf('%% Type:%s, NumColors:%d\n',Schemes(ii).Type,Schemes(ii).NumColors);
    fprintf('%s(colorbrewer.Type.%s, ...\n',Schemes(ii).Name,Schemes(ii).Type);
    fprintf('    [%3d%4d%4d\n',Schemes(ii).Palette(1,:));
    for jj=2:size(Schemes(ii).Palette,1)-1
        fprintf('    %4d%4d%4d\n',Schemes(ii).Palette(jj,:));
    end
    fprintf('    %4d%4d%4d])\n',Schemes(ii).Palette(end,:));
end

%% Create wrapper functions corresponding to color schemes
basepath = fullfile(pwd,'+colorbrewer','+schemes');

schemeNames = enumeration('colorbrewer.Scheme');

for ii=1:numel(schemeNames)
    name = char(schemeNames(ii));
    
    % Create a function file
    filepath = fullfile(basepath,[lower(name) '.m']);
    fid = fopen(filepath, 'w');
    
    % Write the function code to the file
    fprintf(fid, 'function map = %s(n)\n', lower(name));
    fprintf(fid, '    %%%s Wrapper function for mcbrewer to get a colormap\n', upper(name));
    fprintf(fid, '    %% map = %s(N) returns N-by-3 matrix containing a colormap.\n', upper(name));
    fprintf(fid, '    %% See also mcbrewer, colorbrewer.Scheme\n');
    fprintf(fid, '    arguments\n');
    fprintf(fid, '        n {mustBeScalarOrEmpty} = []\n');
    fprintf(fid, '    end\n');
    fprintf(fid, '    map = mcbrewer(''%s'',n);\n', name);
    fprintf(fid, 'end');
    
    fclose(fid);
end

%%
schemeNames = enumeration('colorbrewer.Scheme');

nSchemes = numel(schemeNames);

h = figure;
h.Color = 'k';
h.WindowState = 'maximized';

t = tiledlayout('flow');

for ii=1:nSchemes
    
    name = char(schemeNames(ii));
    
    nexttile
    ax = gca;
    s = surf(ax,peaks);
    s.EdgeColor = 'none';
    colormap(ax,mcbrewer(name));
    c = colorbar(ax);
    c.Color = 'w';
    c.Ticks = [];
    
    ax.Title.String = name;
    ax.Title.Color = 'w';
    ax.Title.FontName = 'Ricty Diminished';
    ax.TitleFontSizeMultiplier = 2;
    
    axis tight off

end

%%
schemeNames = enumeration('colorbrewer.Scheme');

nSchemes = numel(schemeNames);

h = figure;
h.Color = 'k';
h.WindowState = 'maximized';

t = tiledlayout('flow');

for ii=1:nSchemes
    
    name = char(schemeNames(ii));
    
    nexttile
    ax = gca;
    colormap(ax,mcbrewer(name,colorbrewer.Scheme(name).NumColors));
    c = colorbar(ax);
    c.Color = 'w';
    c.Ticks = [];
    c.Location = 'north';
    
    
    ax.Title.String = name;
    ax.Title.Color = 'w';
    ax.Title.FontName = 'Ricty Diminished';
    ax.TitleFontSizeMultiplier = 2;

    axis off
end

