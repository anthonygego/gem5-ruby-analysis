function make_graphs()

map = get_stat_hashmap('../lelec2990-sim/blackscholes/X86_MOESI_CMP_directory/cacheline_size/64b/stats.txt');

disp(map('sim_seconds'))

%list_benchmarks()
end



function blist = list_benchmarks()

d = dir('.');
isub = [d(:).isdir]; %# returns logical vector
blist = {d(isub).name}';
blist(ismember(blist,{'.','..', '.git'})) = [];

end
