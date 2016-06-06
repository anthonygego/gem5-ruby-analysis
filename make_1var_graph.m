function make_1var_graph(var_folder, for_param, param_val, group_by, stat_line, title, ylabel)
global simpath;

values = [[]];
labels = {{}};

if (strcmp(for_param, 'protocol')) 
    % Make a plot of benchmarks/quantitive variations results for a given protocol
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
                values(v,b) = get_val(map, stat_line);
            else
                values(b,v) = get_val(map, stat_line);
            end
        end
    end
    
elseif (strcmp(for_param, 'variation'))
    % Make a plot of benchmarks/protocols results for a given quantitative variation
    blist = list_benchmarks();
    plist = list_protocols(blist{1});
    
    strplist = strrep(strrep(strrep(plist, 'X86_', ''), 'X86', 'MI'), '_directory', '');
    if(strcmp(group_by,'benchmark'))
        
        labels = {blist, strplist};
    else
        labels = {strplist, blist};
    end
    
    for b=1:length(blist)
        for p=1:length(plist)
            file = [simpath '/' blist{b} '/' plist{p} '/' var_folder '/' param_val '/stats.txt'];
            map = get_stat_hashmap(file);
            if(strcmp(group_by,'benchmark'))
                values(b,p) = get_val(map, stat_line);
            else
                values(p,b) = get_val(map, stat_line);
            end
        end
    end
    
else
    % Make a plot of protocols/quantitive variations for a given benchmark
    plist = list_protocols(param_val);
    vlist = list_variations(param_val, plist{1}, var_folder);
    
    strplist = strrep(strrep(strrep(plist, 'X86_', ''), 'X86', 'MI'), '_directory', '');
    if(strcmp(group_by,'variation'))
        
        labels = {vlist, strplist};
    else
        labels = {strplist, vlist};
    end
    
    for v=1:length(vlist)
        for p=1:length(plist)
            file = [simpath '/' param_val '/' plist{p} '/' var_folder '/' vlist{v} '/stats.txt'];
            map = get_stat_hashmap(file);
            if(strcmp(group_by,'variation'))
                values(v,p) = get_val(map, stat_line);
            else
                values(p,v) = get_val(map, stat_line);
            end
        end
    end
end

% Make the plot
make_plot(title, values, labels, ylabel)

end

