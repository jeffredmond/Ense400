spkr			= spkrs[page]; 
name		    = names[page];
voice		    = voices[page];
portrait_index	= portraits[page]; 

name_width		=string_width(name); 
text_max_width	= box_width - (x_buffer) - name_width; 
if(is_string(text[page])){
wrapped_text	= StringWrap(text[page], text_max_width); 
str_len			= string_length(wrapped_text); 
}
name_width		= string_width(name); 
letters			= 0; 