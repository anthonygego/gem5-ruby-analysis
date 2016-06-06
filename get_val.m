function val = get_val(map, key)

if isKey(map, key)
    val = map(key);
else
    val = 0;
end

end

