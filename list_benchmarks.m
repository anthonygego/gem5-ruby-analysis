function blist = list_benchmarks(folder)

d = dir(folder);
isub = [d(:).isdir]; %# returns logical vector
blist = {d(isub).name}';
blist(ismember(blist,{'.','..', '.git'})) = [];

end