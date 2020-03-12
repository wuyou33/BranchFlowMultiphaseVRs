function [Name,Bus,Phase,kV,kvar,numphases,connection] = importCapacitors(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [NAME,BUS,PHASE,KV,KVAR,NUMPHASES,CONNECTION] = IMPORTFILE(FILENAME)
%   Reads data from text file FILENAME for the default selection.
%
%   [NAME,BUS,PHASE,KV,KVAR,NUMPHASES,CONNECTION] = IMPORTFILE(FILENAME,
%   STARTROW, ENDROW) Reads data from rows STARTROW through ENDROW of text
%   file FILENAME.
%
% Example:
%   [Name,Bus,Phase,kV,kvar,numphases,connection] = importfile('Capacitors.CSV',4, 13);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/04/21 10:04:01

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 4;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: text (%s)
%	column2: text (%s)
%   column3: text (%s)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%f%f%f%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow(1)-1, 'WhiteSpace', '', 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    textscan(fileID, '%[^\n\r]', startRow(block)-1, 'WhiteSpace', '', 'ReturnOnError', false);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'ReturnOnError', false);
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
Bus = dataArray{:, 2};
Phase = dataArray{:, 3};
kV = dataArray{:, 4};
kvar = dataArray{:, 5};
numphases = dataArray{:, 6};
connection = dataArray{:, 7};


