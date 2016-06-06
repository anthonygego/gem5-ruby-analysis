function plt = make_plot(the_title, values, legend_list, thelabel)

num_groups=length(values(:,1));
len=length(values);

% Compute interesting axis values
p = values';
dvalues = p(:)';
meanval=mean(dvalues);
stddev=std(dvalues);

% Draw graph
%close all;
figure();
bar(values);
if num_groups > 1
    axis_len=num_groups;
else
    axis_len=len;
end
axis([0.5 axis_len+0.5 max(0,meanval-3*stddev) meanval+3*stddev]);
xticklabel_rotate(1:axis_len,70,filter_legend(legend_list{1}),'interpreter','none')

if num_groups > 1
    legend(strrep(filter_legend(legend_list{2}), '_', '\_'));
end

title(the_title);
ylabel(thelabel);

plt=gca;
end

function out_strs = filter_legend(strs)

out_strs = strrep(strs, '::total', '');
out_strs = strrep(out_strs, 'system.', '');
out_strs = strrep(out_strs, 'ruby.', '');
out_strs = strrep(out_strs, '_Controller', '');
end

