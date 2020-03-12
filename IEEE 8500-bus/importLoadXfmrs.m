function [Name,BusName] =importLoadXfmrs(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [CENTERTAPPEDDISTRIBUTIONTRANSFORMERDEFINITIONS,VARNAME3] =
%   IMPORTFILE(FILENAME) Reads data from text file FILENAME for the default
%   selection.
%
%   [CENTERTAPPEDDISTRIBUTIONTRANSFORMERDEFINITIONS,VARNAME3] =
%   IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [CentertappedDistributiontransformerdefinitions,VarName3] = importfile('LoadXfmrs.csv',2, 1179);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/04/21 10:56:08

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 3;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: text (%s)
%	column3: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%*s%s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
Name = dataArray{:, 1};
BusName = dataArray{:, 2};


