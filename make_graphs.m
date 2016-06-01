function testa = make_graphs()

fid = fopen('../lelec2990-sim/blackscholes/X86/cacheline_size/64b/stats.txt');
arr = containers.Map;

line = fgetl(fid);
while ischar(line)
    
    if (strcmp(line, '---------- Begin Simulation Statistics ----------'))
        display('lol');
    elseif (strcmp(line, '---------- End Simulation Statistics   ----------'))
        break;
    end
    
    arr_line = [];
    
    split_line = regexp(line,'\s','split');
    i=0;
    for sp=split_line
        token=sp{1};
        if strcmp(token, '')
        elseif strcmp(token, '|')   
        elseif strcmp(token, '#')
            break;
        elseif (~isempty(strfind(token, '%')))
        else
            i=i+1;
            arr_line{i} = token;
        end
    end
    
    if (~isempty(arr_line))
        %disp(arr_line)
        arr(arr_line{1}) = str2double(arr_line(2:end));
    end
    
    line = fgetl(fid);
end

testa= arr('system.ruby.L1Cache_Controller.IM.Data')

%list_benchmarks()
end

function blist = list_benchmarks()

d = dir('.');
isub = [d(:).isdir]; %# returns logical vector
blist = {d(isub).name}';
blist(ismember(blist,{'.','..', '.git'})) = [];

end
