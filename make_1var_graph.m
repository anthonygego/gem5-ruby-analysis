function make_1var_graph(var_folder, for_param, param_val, group_by, stat_line, title, ylabel)
global simpath;

maps = {{}};
labels = {{}};

if (strcmp(for_param, 'protocol')) 
    blist = list_benchmarks();
    vlist = list_variations(blist{1}, param_val, var_folder);
    if(strcmp(group_by,'variation'))
        labels = {vlist, blist};
    else
        labels = {blist,vlist};
    end
    
    for b=1:length(blist)
        for v=1:length(vlist)
            file = [simpath '/' blist{b} '/' param_val '/' var_folder '/' vlist{v} '/stats.txt'];
            map = get_stat_hashmap(file);
            if(strcmp(group_by,'variation'))
                maps{v}{b} = map;
            else
                maps{b}{v} = map;
            end
        end
    end
    % Make the plot
    make_plot(title, maps, labels, ylabel, stat_line)
    
elseif (strcmp(for_param, 'variation'))
else
    
end

end

