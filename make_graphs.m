function make_graphs()

blist = list_benchmarks('../lelec2990-sim');
map = get_stat_hashmap('../lelec2990-sim/blackscholes/X86_MOESI_CMP_directory/cacheline_size/64b/stats.txt');

disp(blist)
disp(map('sim_seconds'))

end