function arr = get_stat_hashmap(filename)
    
    fpieces = regexp(filename, 'stats.txt', 'split');
    
    % Check if default config
    if(exist([fpieces{1} '/default'], 'file'))
        oldpieces = regexp(filename, '/', 'split');
        pieces = [oldpieces{1:end-3} {'cacheline_size', '64b'}];
        filename = [sprintf('%s/',pieces{1:end}) 'stats.txt'];
        display(sprintf('Warning : %s is default', sprintf('%s/', oldpieces{end-2:end})));
    end

    % Check for mat file
    [pathstr,~,~] = fileparts(filename);
    matfile = [pathstr '/stats.mat'];  
    if(exist(matfile, 'file'))
        load(matfile, 'arr');
    else
        % Open the stats file
        fid = fopen(filename);
        arr = containers.Map;

        line = fgetl(fid);
        while ischar(line)

            if (strcmp(line, '---------- Begin Simulation Statistics ----------'))

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
                arr(arr_line{1}) = str2double(arr_line(2:end));
            end

            line = fgetl(fid);
        end

        % Save the mat file
        save(matfile, 'arr');
    end
end