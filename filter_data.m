function result = filter_data(data, label, parametroRendimiento)
% Editor
% Vinicio Pazmiño
% 2020/05/27
% Seleccionar los elementos de determinado parametro 
% parametroRendimiento = 1 (Columna 1 de txt = usoCPU)
% parametroRendimiento = 2 (Columna 2 de txt = Ram)
% label = los datos que tengan la misma etiquete (resoluciones de 320x240)
%         segun la columna 5 del txt
    result=[];
    for i=1:numel(data{5})
        
        if strcmp(data{5}{i},label)
            result = [result data{parametroRendimiento}(i)];
        end
    end    
end