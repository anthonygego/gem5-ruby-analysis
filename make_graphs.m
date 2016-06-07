function make_graphs()
global simpath;


%make_1var_graph('l1d_size', 'protocol', 'X86_MOESI_hammer', 'benchmark', 'sim_seconds', 'Time spent in ROI for X86\_MOESI\_hammer', 'Seconds [s]');

%make_1var_graph('l1d_size', 'variation', '64kB', 'protocol', 'sim_seconds', 'Time spent in ROI for normal variation', 'Seconds [s]');

%make_1var_graph('l1d_size', 'benchmark', 'swaptions', 'variation', 'sim_seconds', 'Time spent in ROI for swaptions', 'Seconds [s]');

%make_vars_graph('cacheline_size', 'variation', '64b', 'X86', 'benchmark', {'system.ruby.L1Cache_Controller.Inv::total', 'system.ruby.L1Cache_Controller.Replacement::total'}, 'test', 'Amount');

%make_vars_graph('cacheline_size', 'benchmark', 'swaptions', 'X86', 'statline', {'system.ruby.L1Cache_Controller.Inv::total', 'system.ruby.L1Cache_Controller.Replacement::total'}, 'test', 'Amount');



for path={'../dataset1', '../dataset2'}
    simpath=path{1};

    % All benchmark/protocols ROI time under default config
    %make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', 'sim_seconds', [], 'Time spent in ROI for default parameters', 'Seconds [s]');
    
    % All benchmark/protocols bytes writes/reads under default config
    %make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', 'system.mem_ctrls.bytes_written::total', [], 'Bytes written in memory (default param.)', 'Bytes written to memory [B]');
    %make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', 'system.mem_ctrls.bytes_read::total', [], 'Bytes read from memory (default param.)', 'Bytes read to memory [B]');
    
    % Same zoomed
    % make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', 'system.mem_ctrls.bytes_written::total', [1 2], 'Bytes written in memory', 'Bytes written to memory [B]');
    %make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', 'system.mem_ctrls.bytes_read::total', [1 2], 'Bytes read in memory', 'Bytes read to memory [B]');

    
    
end

simpath='../dataset2';

% swaptions and fmm run time for cacheline variation
%make_1var_graph('cacheline_size', 'benchmark', 'splash2x.fmm', 'protocol', 'sim_seconds', [], 'Time spent in ROI (splash2x.fmm)', 'Seconds [s]');
%make_1var_graph('cacheline_size', 'benchmark', 'swaptions', 'protocol', 'sim_seconds', [], 'Time spent in ROI (swaptions)', 'Seconds [s]');

simpath='../dataset1';

% L1 assoc and size
%make_1var_graph('l1d_size', 'benchmark', 'splash2x.radix', 'protocol', 'sim_seconds', [], 'Time spent in ROI (splash2x.radix) for L1 size variations', 'Seconds [s]');
%make_1var_graph('l1d_assoc', 'benchmark', 'splash2x.radix', 'protocol', 'sim_seconds', [], 'Time spent in ROI (splash2x.radix) for L1 associativity variations', 'Seconds [s]');

% L2 assoc and size
% make_1var_graph('l2_size', 'benchmark', 'splash2x.radix', 'protocol', 'sim_seconds', [2 3 4 5], 'Time spent in ROI (splash2x.radix) for L2 size variations', 'Seconds [s]');
% make_1var_graph('l2_assoc', 'benchmark', 'splash2x.radix', 'protocol', 'sim_seconds', [2 3 4 5], 'Time spent in ROI (splash2x.radix) for L2 associativity variations', 'Seconds [s]');

%Number of dir
%simpath='../dataset1';
%make_1var_graph('num-dirs', 'benchmark', 'splash2x.radix', 'protocol', 'sim_seconds', [3 4 5], 'Time spent in ROI (splash2x.fft) for directory variations', 'Seconds [s]');
%simpath='../dataset2';
%make_1var_graph('num-dirs', 'benchmark', 'splash2x.raytrace', 'protocol', 'sim_seconds', [3 4 5], 'Time spent in ROI (splash2x.raytrace) for directory variations', 'Seconds [s]');


end