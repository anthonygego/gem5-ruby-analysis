function make_vars_graph(var_folder, for_param, param_val, proto_val, group_by, stat_lines, title, ylabel)
%var_folder: the variance folder to analyse
%for_param: title fixed parameter [benchmark,variation]
%param_val: value of the fixed parameter
%proto_val: the protocol to analyse
%group_by: parameter to be displayed in x axis
%stat_lines : the stat lines to analyse
%title : title of the graph to produce
%ylabel : unit of the graph
global simpath;

values = [[]];
labels = {{}};

if (strcmp(for_param, 'variation')) 
    % Make a plot of benchmarks/stats lines results for a given protocol and variation
    blist = list_benchmarks();
    slist = stat_lines;
    if(strcmp(group_by,'statline'))
        labels = {slist, blist};
    else
        labels = {blist,slist};
    end
    
    for b=1:length(blist)
        for s=1:length(slist)
            file = [simpath '/' blist{b} '/' proto_val '/' var_folder '/' param_val '/stats.txt'];
            map = get_stat_hashmap(file);

            if(strcmp(group_by,'statline'))
                values(s,b) = get_val(map, slist{s});
            else
                values(b,s) = get_val(map, slist{s});
            end
        end
    end
else
    % Make a plot of variation/stats lines for a given protocol and benchmark
    vlist = list_variations(param_val, proto_val, var_folder);
    slist = stat_lines;
    
    if(strcmp(group_by,'statline'))
        labels = {slist, vlist};
    else
        labels = {vlist, slist};
    end
    
    for v=1:length(vlist)
        for s=1:length(slist)
            file = [simpath '/' param_val '/' proto_val '/' var_folder '/' vlist{v} '/stats.txt'];
            map = get_stat_hashmap(file);
            if(strcmp(group_by,'statline'))
                values(s,v) = get_val(map, slist{s});
            else
                values(v,s) = get_val(map, slist{s});
            end
        end
    end
end

% Make the plot
make_plot(title, values, labels, ylabel)

end

