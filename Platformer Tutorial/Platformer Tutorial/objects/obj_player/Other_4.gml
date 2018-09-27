/// @desc auto save 

// overwrite old save

if(file_exists(SAVEFILE)) file_delete(SAVEFILE);

// make the new save

var file; 

file = file_text_open_write(SAVEFILE); 
file_text_write_real(file, room); 
file_text_close(file); 