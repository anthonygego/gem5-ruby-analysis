function vlist = list_variations(benchmark, protocol, var_dir)
global simpath;

d = dir([simpath '/' benchmark '/' protocol '/' var_dir]);
isub = [d(:).isdir]; %# returns logical vector
vlist = {d(isub).name}';
vlist(ismember(vlist,{'.','..', '.git'})) = [];

end