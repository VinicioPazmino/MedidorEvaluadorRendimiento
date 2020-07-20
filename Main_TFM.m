% Ejemplo para generar BOXPLOT desde un archivo txt
% Juan Carlos San Miguel
% Universidad Autonoma de Madrid
% 2016/10/19

% Editor
% Vinicio Pazmiño
% 2020/05/27

close all
clear
clc;
outconf = 10;
fprintf('Rango de confianza para la eliminación de valores atípicos: [%.2f %.2f]\n\n',outconf,100-outconf)

% Cargar Datos
fileID = fopen('RendimientoAgrupados1.txt');
data = textscan(fileID,'%f %f %f %f %s');
parametro=1; % elegir la columna de datos a graficar (1=CPU, 2=RAM, 3=GPU, 4=VRAM)

% Ejemplo para imprimir un elemento del archivo
%ind = 1;
%fprintf('Entry %d: time=%f, KBytes=%d, resolution=%s\n',ind, data{1}(ind), data{4}(ind), data{5}{ind})

% Encontrar resoluciones únicas y reordenar
res = unique(data{5},'stable')
res_ordered = res

% Recuperar y trazar datos numéricos para cada resolución
figure; 
hold on;
for i = 1:numel(res)    
    timeRes{i} = filter_data(data, res_ordered{i}, parametro);
    fprintf('Resolution %s: %d values\n',res_ordered{i},numel(timeRes{i}));
    labels = bplot(timeRes{i},i,'whisker',outconf);
end

title('Evaluacion de Rendimiento del Simulador')
legend(labels(1:end-1),'Location','northwest'); %legend for plotted data
xlabel('Resoluciones frente a Camaras Usuario (RGB y Semantico)'); %texto para X label
set(gca,'XTick',1:numel(res),'XTickLabel', res_ordered); %texto para cada elemento de X label
ylabel('Uso de la CPU(%)'); %label eje Y

% set(gca,'yscale','log'); % cambiar a escala logarítmica (a veces mejora la visualización)
axis([0.5 numel(res)+0.5 0 100]); % ajustar los límites del eje

% Guardar figura
fileformat = {'epsc','png'};

for i=1:numel(fileformat)
    fprintf('\nSaving boxplot to format %s...',fileformat{i});
    saveas(gca, 'Imagenes\NombreFigura',fileformat{i});
end
fprintf('Done.');