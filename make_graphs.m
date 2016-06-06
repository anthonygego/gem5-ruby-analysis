function make_graphs()
global simpath;
simpath='../lelec2990-sim';

%make_1var_graph('l1d_size', 'protocol', 'X86_MOESI_hammer', 'benchmark', 'sim_seconds', 'Time spent in ROI for X86\_MOESI\_hammer', 'Seconds [s]');

%make_1var_graph('l1d_size', 'variation', '64kB', 'protocol', 'sim_seconds', 'Time spent in ROI for normal variation', 'Seconds [s]');

make_1var_graph('l1d_size', 'benchmark', 'swaptions', 'variation', 'sim_seconds', 'Time spent in ROI for swaptions', 'Seconds [s]');
end