# gem5 Ruby analyser

This MATLAB tool produces bar plots from gem5 statistics for several workloads, Ruby protocols, and system variations.

## Folder structure
The following folder structure is supposed :

```
 <REPO_PATH>/
     + <benchmark1>/
         + <protocol1>/
             + <variation_type1>/
	             + <variation1>
	             + <variation2>
	             ...
	         + <variation_type2>/
	             ...
	     + <protocol2>/
	         ...
```

where `<benchmarkX>` corresponds to the workload to run by gem5, `<protocolX>` corresponds 
to the Ruby protocol used for the simulation, `<variation_typeX>` to the parameter to vary 
and finally `<variationX>` to the parameter value for that given simulation. Each leaf folder
contains the output files of the simulation and more especially the `stats.txt` file.

## Plot one stat for several protocols/benchmarks/quantitative variations

Use `make_1var_graph(var_folder, for_param, param_val, group_by, stat_line, actual_groups, title, ylabel)`

where :
* `var_folder`: the variance folder to analyse
* `for_param`: title fixed parameter [protocol,benchmark,variation]
* `param_val`: value of the fixed parameter (folder name)
* `group_by`: parameter to be displayed in x axis
* `stat_line`: the stat line to analyse
* `actual_groups`: array of indices of groups to be actually displayed in x axis
* `title`: title of the graph to produce
* `ylabel`: unit of the graph

*To sum several several statistics, pass a cell of strings as `stat_line` argument.*

## Plot several stat lines for a protocol and several benchmarks/quantitative variations

Use `make_vars_graph(var_folder, for_param, param_val, proto_val, group_by, stat_lines, actual_groups, title, ylabel)`

where:
* `var_folder`: the variance folder to analyse
* `for_param`: title fixed parameter [benchmark,variation]
* `param_val`: value of the fixed parameter
* `proto_val`: the protocol to analyse
* `group_by`: parameter to be displayed in x axis
* `stat_lines`: the stat lines to analyse
* `actual_groups`: array of indices of groups to be actually displayed in x axis
* `title`: title of the graph to produce
* `ylabel`: unit of the graph

## Examples
Several examples are shown in script `make_graphs.m`
