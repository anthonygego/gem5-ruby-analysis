function val = get_val(map, key)

if iscell(key)
    disp('warn: multiple keys access : summing');
    val = 0;
    for idx=1:length(key)
        val = val + actual_get_val(map, key{idx});
    end
else
    val = actual_get_val(map, key);
end

end

function val = actual_get_val(map, key)

if isKey(map, key)
    val = map(key);
else
    disp(['warn: ' key ' is not present']);
    val = 0;
end

end

