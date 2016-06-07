function make_1var_graph(var_folder, for_param, param_val, group_by, stat_line, actual_groups, title, ylabel)
%var_folder: the variance folder to analyse
%for_param: title fixed parameter [protocol,benchmark,variation]
%param_val: value of the fixed parameter
%group_by: parameter to be displayed in x axis
%stat_line : the stat line to analyse
%title : title of the graph to produce
%ylabel : unit of the graph
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
if ~isempty(actual_groups)
    values = values(actual_groups,:);
    if length(actual_groups) == 1
        title = [title ' / ' labels{1}{actual_groups}];
        labels{1} = labels{2};
    else
        % Need to redo the labels
        idx=0;
        newlabels1 = {};
        for g=actual_groups
            idx = idx+1;
            newlabels1{idx} = labels{1}{g};
        end
        labels{1} = newlabels1;
    end
end

make_plot(title, values, labels, ylabel)

end

