#!/bin/sh                                                                                                                                                                                                                      
cd ~/.config/kitty                                                                                                                                                                                                             
if [ "$(readlink current-theme.conf)" = dark.conf ]; then                                                                                                                                                                      
    ln -sf light.conf current-theme.conf                                                                                                                                                                                       
else                                                                                                                                                                                                                           
    ln -sf dark.conf current-theme.conf                                                                                                                                                                                        
fi
kill -USR1 $(pidof kitty)
