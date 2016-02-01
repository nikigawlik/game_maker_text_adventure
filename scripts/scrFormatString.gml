//scrFormatString(str, widthInPixels)
//returns string with #s

draw_set_font(fntNormal)

var pos, str, lastSpace, lastBreak;
pos = 1
lastBreak = pos
str = argument0 + " "

while(pos <= string_length(str))
{
    if string_char_at(str,pos) == " "
    {
        if string_width(string_copy(str, lastBreak, pos - lastBreak)) > argument1 
        {
            pos = lastSpace
            str = string_insert("#", str, pos+1)
            lastBreak = pos + 1
        }
        else
            lastSpace = pos        
    }
    pos++
}

show_debug_message(str)

return str;
