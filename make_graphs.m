function make_graphs()
global simpath;

%% Global analysis

for path={'../dataset1', '../dataset2'}
    simpath=path{1};

    % All benchmark/protocols ROI time under default config
    %make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', 'sim_seconds', [], 'Time spent in ROI for default parameters', 'Seconds [s]');
    
    % All benchmark/protocols bytes writes/reads under default config
    %make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', 'system.mem_ctrls.bytes_written::total', [], 'Bytes written in memory (default param.)', 'Bytes written to memory [B]');
    %make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', 'system.mem_ctrls.bytes_read::total', [], 'Bytes read from memory (default param.)', 'Bytes read to memory [B]');
    
    % Same zoomed
    %make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', 'system.mem_ctrls.bytes_written::total', [1 2], 'Bytes written in memory', 'Bytes written to memory [B]');
    %make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', 'system.mem_ctrls.bytes_read::total', [1 2], 'Bytes read in memory', 'Bytes read to memory [B]');  

    % Network traffic
    events = {'system.ruby.network.msg_byte.Control',...
        'system.ruby.network.msg_byte.Request_Control',...
        'system.ruby.network.msg_byte.Broadcast_Control',...
        'system.ruby.network.msg_byte.Forwarded_Control',...
        'system.ruby.network.msg_byte.Response_Control',...
        'system.ruby.network.msg_byte.Response_Data',...
        'system.ruby.network.msg_byte.Writeback_Data',...
        'system.ruby.network.msg_byte.Data',...
        'system.ruby.network.msg_byte.Writeback_Control'};

    make_1var_graph('cacheline_size', 'variation', '64B', 'benchmark', events, [], 'Coherence traffic in bytes', 'Bytes [B]');
end

% cacheline
%simpath='../dataset2';
%make_1var_graph('cacheline_size', 'benchmark', 'splash2x.fmm', 'protocol', 'sim_seconds', [], 'Time spent in ROI (splash2x.fmm)', 'Seconds [s]');
%make_1var_graph('cacheline_size', 'benchmark', 'swaptions', 'protocol', 'sim_seconds', [], 'Time spent in ROI (swaptions)', 'Seconds [s]');

% L1 assoc and size
%simpath='../dataset1';
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


%% Detailed MI

% % Directory controller
% events = {'system.ruby.Directory_Controller.GETX',...
%     'system.ruby.Directory_Controller.PUTX',...
%     'system.ruby.Directory_Controller.PUTX_NotOwner',...
%     'system.ruby.Directory_Controller.Memory_Data',...
%     'system.ruby.Directory_Controller.Memory_Ack'};
% events = {'system.ruby.Directory_Controller.M.GETX'};
% 
% simpath='../dataset1';
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86', 'bench', events, [], 'MI Directory events for default configuration', 'Amount');
% simpath='../dataset2';
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86', 'bench', events, [], 'MI Directory events for default configuration', 'Amount');


% L1 controller
%events = {'system.ruby.L1Cache_Controller.Data::total'};
%events = {'system.ruby.L1Cache_Controller.Inv::total' };
%events = {'system.ruby.L1Cache_Controller.Fwd_GETX::total'};
%simpath='../dataset2';
%make_vars_graph('cacheline_size', 'variation', '64b', 'X86', 'benchmark', events, [], 'MI L1 events for default configuration', 'Amount');

%simpath='../dataset2';
% events = {'system.ruby.L1Cache_Controller.Data::total',...
%     'system.ruby.L1Cache_Controller.Inv::total',...
%     'system.ruby.L1Cache_Controller.Fwd_GETX::total'};
% make_vars_graph('cacheline_size', 'benchmark', 'splash2x.fmm', 'X86', 'statline', events, [], 'MI L1 events for default configuration', 'Amount');

% Network
% simpath='../dataset2';
% events = {'system.ruby.network.msg_count.Control',...
%     'system.ruby.network.msg_count.Data',...
%     'system.ruby.network.msg_count.Response_Data',...
%     'system.ruby.network.msg_count.Writeback_Control'};
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86', 'benchmark', events, [], 'MI network message count', 'Amount');
% events = {'system.ruby.network.msg_byte.Control',...
%     'system.ruby.network.msg_byte.Data',...
%     'system.ruby.network.msg_byte.Response_Data',...
%     'system.ruby.network.msg_byte.Writeback_Control'};
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86', 'benchmark', events, [], 'MI network message bytes', 'Amount');


%% Detailed MESI Two

% Directory
% events = {'system.ruby.Directory_Controller.Fetch',...
%     'system.ruby.Directory_Controller.Data',...
%     'system.ruby.Directory_Controller.Memory_Data',...
%     'system.ruby.Directory_Controller.Memory_Ack'};
%  
% simpath='../dataset1';
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Two_Level', 'bench', events, [], 'Two-level MESI Directory events for default configuration', 'Amount');
% simpath='../dataset2';
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Two_Level', 'bench', events, [], 'Two-level MESI Directory events for default configuration', 'Amount');  


% L1 controller
% events = {{'system.ruby.L1Cache_Controller.Fwd_GETX::total',...
%     'system.ruby.L1Cache_Controller.Fwd_GETS::total',...
%     'system.ruby.L1Cache_Controller.Inv::total'},...
%     {'system.ruby.L1Cache_Controller.Data_all_Acks::total',...
%     'system.ruby.L1Cache_Controller.Data_Exclusive::total'}};
% simpath='../dataset2';
% for k=1:2
%     make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Two_Level', 'benchmark', events{k}, [], 'Two-level MESI L1 events for default configuration', 'Amount');
% end

% L2 controller
% events = {{'system.ruby.L2Cache_Controller.L1_GETS',...
%     'system.ruby.L2Cache_Controller.L1_GETX',...
%     'system.ruby.L2Cache_Controller.L1_PUTX'},...
%     {'system.ruby.L2Cache_Controller.Mem_Data',...
%     'system.ruby.L2Cache_Controller.L2_Replacement',...
%     'system.ruby.L2Cache_Controller.L2_Replacement_clean'},...
%     {'system.ruby.L2Cache_Controller.MEM_Inv'}};
% simpath='../dataset2';
% for k=1:3
%     make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Two_Level', 'benchmark', events{k}, [], 'Two-level MESI L2 events for default configuration', 'Amount');
% end

%  simpath='../dataset2';
%  events = {'system.ruby.L2Cache_Controller.Mem_Data',...
%     'system.ruby.L2Cache_Controller.L2_Replacement',...
%     'system.ruby.L2Cache_Controller.L2_Replacement_clean'};
%  make_vars_graph('l2_assoc', 'benchmark', 'splash2x.fmm', 'X86_MESI_Two_Level', 'statline', events, [], 'Two-level MESI L2 events for default configuration', 'Amount');


% Network
% simpath='../dataset2';
% events = {'system.ruby.network.msg_count.Control',...
%     'system.ruby.network.msg_count.Response_Control',...
%     'system.ruby.network.msg_count.Response_Data',...
%     'system.ruby.network.msg_count.Writeback_Data',...
%     'system.ruby.network.msg_count.Writeback_Control'};
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Two_Level', 'benchmark', events, [], 'Two-level MESI network message count', 'Amount');
% events = {'system.ruby.network.msg_byte.Control',...
%     'system.ruby.network.msg_byte.Response_Control',...
%     'system.ruby.network.msg_byte.Response_Data',...
%     'system.ruby.network.msg_byte.Writeback_Data',...
%     'system.ruby.network.msg_byte.Writeback_Control'};
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Two_Level', 'benchmark', events, [], 'Two-level MESI network message bytes', 'Amount');


%% Detailed MESI Three

%Directory
% events = {'system.ruby.Directory_Controller.Fetch',...
%     'system.ruby.Directory_Controller.Data',...
%     'system.ruby.Directory_Controller.Memory_Data',...
%     'system.ruby.Directory_Controller.Memory_Ack'};
%  
% simpath='../dataset1';
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Three_Level', 'bench', events, [], 'Three-level MESI Directory events for default configuration', 'Amount');
% simpath='../dataset2';
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Three_Level', 'bench', events, [], 'Three-level MESI Directory events for default configuration', 'Amount');  


% L0 controller
% events = {{'system.ruby.L0Cache_Controller.L0_Replacement::total',...
%     'system.ruby.L0Cache_Controller.Data_Exclusive::total',...
%     'system.ruby.L0Cache_Controller.Data::total'},...
%     {'system.ruby.L0Cache_Controller.Inv::total'}};
% 
% simpath='../dataset2';
% for k=1:2
%     make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Three_Level', 'benchmark', events{k}, [], 'Three-level MESI MESI L0 events for default configuration', 'Amount');
% end

% L1 controller
% events = {{'system.ruby.L1Cache_Controller.Fwd_GETX::total',...
%     'system.ruby.L1Cache_Controller.Fwd_GETS::total',...
%     'system.ruby.L1Cache_Controller.Inv::total'},...
%     {'system.ruby.L1Cache_Controller.Data_all_Acks::total',...
%     'system.ruby.L1Cache_Controller.Data_Exclusive::total'}};
% simpath='../dataset2';
% for k=1:2
%     make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Three_Level', 'benchmark', events{k}, [], 'Three-level MESI L1 events for default configuration', 'Amount');
% end

% L2 controller
% events = {{'system.ruby.L2Cache_Controller.L1_GETS',...
%     'system.ruby.L2Cache_Controller.L1_GETX',...
%     'system.ruby.L2Cache_Controller.L1_PUTX'},...
%     {'system.ruby.L2Cache_Controller.Mem_Data',...
%     'system.ruby.L2Cache_Controller.L2_Replacement',...
%     'system.ruby.L2Cache_Controller.L2_Replacement_clean'},...
%     {'system.ruby.L2Cache_Controller.MEM_Inv'}};
% simpath='../dataset2';
% for k=1:3
%     make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Three_Level', 'benchmark', events{k}, [], 'Three-level MESI L2 events for default configuration', 'Amount');
% end

% Network
% simpath='../dataset2';
% events = {'system.ruby.network.msg_count.Control',...
%     'system.ruby.network.msg_count.Response_Control',...
%     'system.ruby.network.msg_count.Response_Data',...
%     'system.ruby.network.msg_count.Writeback_Data',...
%     'system.ruby.network.msg_count.Writeback_Control'};
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Three_Level', 'benchmark', events, [], 'Three-level MESI network message count', 'Amount');
% events = {'system.ruby.network.msg_byte.Control',...
%     'system.ruby.network.msg_byte.Response_Control',...
%     'system.ruby.network.msg_byte.Response_Data',...
%     'system.ruby.network.msg_byte.Writeback_Data',...
%     'system.ruby.network.msg_byte.Writeback_Control'};
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MESI_Three_Level', 'benchmark', events, [], 'Three-level MESI network message bytes', 'Amount');

%% MOESI CMP

% Directory
% events = {'system.ruby.Directory_Controller.GETX',...
%     'system.ruby.Directory_Controller.GETS',...
%     'system.ruby.Directory_Controller.PUTX',...
%     'system.ruby.Directory_Controller.PUTO_SHARERS',...
%     'system.ruby.Directory_Controller.Memory_Data',...
%     'system.ruby.Directory_Controller.Memory_Ack',...
%     };
% 
%  
% simpath='../dataset1';
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_CMP_directory', 'bench', events, [], 'Two-level MOESI Directory events for default configuration', 'Amount');
% simpath='../dataset2';
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_CMP_directory', 'bench', events, [], 'Two-level MOESI Directory events for default configuration', 'Amount');  


% L1 controller
% events = {{'system.ruby.L1Cache_Controller.Fwd_GETX::total',...
%     'system.ruby.L1Cache_Controller.Fwd_GETS::total',...
%     'system.ruby.L1Cache_Controller.Inv::total'},...
%     {'system.ruby.L1Cache_Controller.Data::total',...
%     'system.ruby.L1Cache_Controller.Exclusive_Data::total'}};
% simpath='../dataset2';
% for k=1:2
%     make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_CMP_directory', 'benchmark', events{k}, [], 'Two-level MOESI L1 events for default configuration', 'Amount');
% end
%  events = {'system.ruby.L1Cache_Controller.MM.Fwd_GETS::total'};
%  make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_CMP_directory', 'benchmark', events, [], 'Two-level MOESI L1 events for default configuration', 'Amount');

% L2 controller
% events = {{'system.ruby.L2Cache_Controller.L1_GETS',...
%     'system.ruby.L2Cache_Controller.L1_GETX',...
%     'system.ruby.L2Cache_Controller.L1_PUTX',...
%     'system.ruby.L2Cache_Controller.L1_PUTO',...
%     'system.ruby.L2Cache_Controller.L1_PUTS_only'},...
%     {'system.ruby.L2Cache_Controller.Data',...
%     'system.ruby.L2Cache_Controller.L2_Replacement'}};
% simpath='../dataset2';
% for k=1:2
%     make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_CMP_directory', 'benchmark', events{k}, [], 'Two-level MOESI L2 events for default configuration', 'Amount');
% end

% Network
% simpath='../dataset2';
% events = {'system.ruby.network.msg_count.Request_Control',...
%     'system.ruby.network.msg_count.Forwarded_Control',...
%     'system.ruby.network.msg_count.Response_Control',...
%     'system.ruby.network.msg_count.Response_Data',...
%     'system.ruby.network.msg_count.Writeback_Data',...
%     'system.ruby.network.msg_count.Writeback_Control'};
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_CMP_directory', 'benchmark', events, [], 'Two-level MOESI network message count', 'Amount');
% 
% events = {'system.ruby.network.msg_byte.Request_Control',...
%     'system.ruby.network.msg_byte.Forwarded_Control',...
%     'system.ruby.network.msg_byte.Response_Control',...
%     'system.ruby.network.msg_byte.Response_Data',...
%     'system.ruby.network.msg_byte.Writeback_Data',...
%     'system.ruby.network.msg_byte.Writeback_Control'};
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_CMP_directory', 'benchmark', events, [], 'Two-level MOESI network message bytes', 'Amount');

%% MOESI Hammer

% Directory
% events = {'system.ruby.Directory_Controller.GETX',...
%     'system.ruby.Directory_Controller.GETS',...
%     'system.ruby.Directory_Controller.PUT',...
%     'system.ruby.Directory_Controller.Memory_Data',...
%     'system.ruby.Directory_Controller.Memory_Ack',...
%     };
% 
%  
% simpath='../dataset1';
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_hammer', 'bench', events, [], 'MOESI Hammer Directory events for default configuration', 'Amount');
% simpath='../dataset2';
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_hammer', 'bench', events, [], 'MOESI Hammer MOESI Directory events for default configuration', 'Amount');  

%L1 controller
% events = {{'system.ruby.L1Cache_Controller.Other_GETX::total',...
%     'system.ruby.L1Cache_Controller.Other_GETS::total'},...
%     {'system.ruby.L1Cache_Controller.Shared_Data::total',...
%     'system.ruby.L1Cache_Controller.Exclusive_Data::total',...
%     'system.ruby.L1Cache_Controller.Writeback_Ack::total',...
%     'system.ruby.L1Cache_Controller.L2_Replacement::total'}};
% simpath='../dataset2';
% for k=1:2
%     make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_hammer', 'benchmark', events{k}, [], 'Two-level MOESI L1 events for default configuration', 'Amount');
% end

% Network
% simpath='../dataset2';
% events = {'system.ruby.network.msg_count.Request_Control',...
%     'system.ruby.network.msg_count.Broadcast_Control',...
%     'system.ruby.network.msg_count.Response_Control',...
%     'system.ruby.network.msg_count.Response_Data',...
%     'system.ruby.network.msg_count.Writeback_Data',...
%     'system.ruby.network.msg_count.Writeback_Control'};
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_hammer', 'benchmark', events, [], 'Two-level MOESI network message count', 'Amount');
% 
% events = {'system.ruby.network.msg_byte.Request_Control',...
%     'system.ruby.network.msg_byte.Broadcast_Control',...
%     'system.ruby.network.msg_byte.Response_Control',...
%     'system.ruby.network.msg_byte.Response_Data',...
%     'system.ruby.network.msg_byte.Writeback_Data',...
%     'system.ruby.network.msg_byte.Writeback_Control'};
% make_vars_graph('cacheline_size', 'variation', '64b', 'X86_MOESI_hammer', 'benchmark', events, [], 'Two-level MOESI network message bytes', 'Amount');
     
end