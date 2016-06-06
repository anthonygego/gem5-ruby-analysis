function vlist = list_protocols(benchmark)
global simpath;

d = dir([simpath '/' benchmark]);
isub = [d(:).isdir]; %# returns logical vector
vlist = {d(isub).name}';
vlist(ismember(vlist,{'.','..', '.git', 'KVM'})) = [];

end