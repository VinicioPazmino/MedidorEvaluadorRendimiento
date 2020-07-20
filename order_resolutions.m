function result = order_resolutions(resolutions)
% Ordenar los elementos de una celda 

% Editor
% Vinicio Pazmiño
% 2020/05/27

strLengths = cellfun(@(x)length(x),resolutions)';
strLengths = strLengths-min(strLengths);

result=cell(1);
for i=0:numel(strLengths)
    for j=1:numel(strLengths)
        if strLengths(j) == 0
            result(end+1) = resolutions(j);
        end
    end
    strLengths = strLengths - 1;
end
result = result(2:end);
end
