function val = get_val(map, key)

if isKey(map, key)
    val = map(key);
else
    disp(['warn: ' key ' is not present']);
    val = 0;
end

end

