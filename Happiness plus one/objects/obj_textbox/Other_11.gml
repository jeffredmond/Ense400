name		    = names[page];
voice		    = voices[page];
portrait_index	= portraits[page]; 


wrapped_text	= StringWrap(text[page], text_max_width); 
str_len			= string_length(wrapped_text); 
name_width		= string_width(name); 
letters			= 0; 