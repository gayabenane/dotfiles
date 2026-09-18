alias ls "eza --icons=always"
alias ll "eza -lh --icons=always"
alias la "eza -lah --icons=always"
alias tree "eza --tree --icons=always"

abbr -a vim nvim
abbr -a v nvim
abbr -a gs git status

abbr -a .. "cd .."
abbr -a ... "cd ../.."
abbr -a .... "cd ../../.."
abbr -a - "cd -"
abbr -a dus "du -h -d 1 | sort -rh"

function last_history_item
    echo $history[1]
end

abbr -a !! --position anywhere --function last_history_item

abbr -a zj zellij
abbr -a cat bat

abbr -a fconf "nvim $HOME/.config/fish/config.fish"
