if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_prompt
       if fish_is_root_user
          set_color normal
           string join '' (set_color blue) (prompt_pwd) (set_color normal) ' Λ '
       end
       set_color normal
       string join '' (set_color blue) (prompt_pwd) (set_color normal) ' λ '
    end
    set -U fish_greeting
end

alias cmatrix "cmatrix -b -C green"

set PATH /usr/local/bin $PATH /sbin/ /usr/sbin/
set -x PATH ~/.npm-packages/bin $PATH
# Created by `pipx` on 2025-10-06 21:45:20
set PATH $PATH /home/jovo/.local/bin
