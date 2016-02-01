var out;
out = ""
for(i = 0; i < ds_list_size(items); i++)
{
    out += ds_list_find_value(items, i) 
    if i != ds_list_size(items) - 1
        out += ", "
}

return out;
