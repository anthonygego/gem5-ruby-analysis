function make_graphs()

% blist = list_benchmarks('../lelec2990-sim');
% maps{1}{1} = get_stat_hashmap('../lelec2990-sim/swaptions/X86/cacheline_size/64b/stats.txt');
% maps{1}{2} = get_stat_hashmap('../lelec2990-sim/swaptions/X86_MESI_Two_Level/cacheline_size/64b/stats.txt');
% maps{2}{1} = get_stat_hashmap('../lelec2990-sim/swaptions/X86_MESI_Three_Level/cacheline_size/64b/stats.txt');
% maps{2}{2} = get_stat_hashmap('../lelec2990-sim/swaptions/X86_MOESI_hammer/cacheline_size/64b/stats.txt');
% 
% make_plot(maps, {{'prot1', 'prot2'},{'var1','var2'}}, 'sim_seconds');

maps{1}{1} = get_stat_hashmap('../lelec2990-sim/swaptions/X86/cacheline_size/64b/stats.txt');
maps{1}{2} = get_stat_hashmap('../lelec2990-sim/swaptions/X86_MESI_Two_Level/cacheline_size/64b/stats.txt');
maps{1}{3} = get_stat_hashmap('../lelec2990-sim/swaptions/X86_MESI_Three_Level/cacheline_size/64b/stats.txt');
maps{1}{4} = get_stat_hashmap('../lelec2990-sim/swaptions/X86_MOESI_hammer/cacheline_size/64b/stats.txt');

make_plot(maps, {{'mi', 'mesi2','mesi3','moesih'}}, 'sim_seconds');

end