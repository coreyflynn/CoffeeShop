function fish_prompt --description 'Write out the prompt'
        set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
   set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
   set -l prompt_symbol ''
   printf "%sCoffee Shop %s[%s%s%s]: " (set_color $fish_color_error) (set_color normal) (set_color $fish_color_cwd) $pwd (set_color normal)
end
