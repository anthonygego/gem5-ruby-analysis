function plt = make_plot(the_title, map_list, legend_list, thelabel, compstr)

num_groups=length(map_list);
len=length(map_list{1});

% Prepare value vector
values = zeros(num_groups,len);
for g=1:num_groups
    for k=1:len
        map = map_list{g}{k};
        values(g,k) = map(compstr);
    end
end

% Compute interesting axis values
p = values';
dvalues = p(:)';
meanval=mean(dvalues);
stddev=std(dvalues);


% Draw graph
bar(values);
if num_groups > 1
    axis_len=num_groups;
else
    axis_len=len;
end
axis([0.5 axis_len+0.5 max(0,meanval-3*stddev) meanval+3*stddev]);
xticklabel_rotate(1:axis_len,45,legend_list{1},'interpreter','none')

if num_groups > 1
    legend(legend_list{2})
end

title(the_title);
ylabel(thelabel);

plt=gca;

end

