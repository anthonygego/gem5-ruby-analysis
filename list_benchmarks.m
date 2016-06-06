function blist = list_benchmarks()
global simpath;

d = dir(simpath);
isub = [d(:).isdir]; %# returns logical vector
blist = {d(isub).name}';
blist(ismember(blist,{'.','..', '.git'})) = [];

end