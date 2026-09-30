function displaycolorbar(obj,mymap,colorbar_limits,number_of_ticks,unit,color)
    colormap(obj,mymap);
    clim(obj,colorbar_limits);
    C = colorbar(obj,"eastoutside");
    tx = linspace(colorbar_limits(1),colorbar_limits(2),number_of_ticks);
    for i = 1:length(tx)-1
    qx{i} = num2str(tx(i));
    end
    qx{end+1} =['$',unit,'$'];
    set(C,'ytick', tx ,'yticklabel',qx,'fontname','times new roman','fontsize',20,'yColor',color)
    C.Label.Interpreter = 'latex';
    C.TickLabelInterpreter = 'latex';
    C.TickDirection ='out';
end