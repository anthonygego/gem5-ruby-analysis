function make_graphs()
global simpath;
simpath='../lelec2990-sim';

make_1var_graph('l1d_size', 'protocol', 'X86', 'benchmark', 'sim_seconds', 'Time spent in ROI', 'Seconds [s]');

end