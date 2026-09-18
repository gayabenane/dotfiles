# Remove the welcome greeting

function fish_greeting
    #set_color -o cyan
    #cal

    #set_color normal
    stormy
    fastfetch -l none -s title:os:datetime:Kernel:Uptime:Memory:Disk:Media:Battery:colors
end

set -g fish_greeting
# Point GPG to the current terminal
set -x GPG_TTY (tty)
#zoxide init 
zoxide init fish --cmd cd | source

fzf --fish | source

# Aliases work the same as in zsh

# Setting environment variables (like PATH) is different!
# -g means global, -x means export
fish_add_path /usr/local/bin

set -gx EDITOR vim
set -gx XDG_CONFIG_HOME "$HOME/.config"

direnv hook fish | source

function fish_user_key_bindings
    fish_vi_key_bindings
    if type -q fzf_key_bindings:
        fzf_key_bindings
    end
end

function y --description "Run Yazi and cd to the working directory on EXIT"
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"

    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end

    command rm -f -- "$tmp"
end

function add_expense
    echo (date "+%Y-%m-%d")" * "$argv[1]"\n    Expenses: "$argv[2]"\n    Assets:Checking" >>~/accounting/2026.journal
end
#starship init fish| source
#fish_add_path /opt/homebrew/bin /usr/local/bin
#
function weather
    begin
        #  1. Define your default cities here
        set -l target_cities $argv
        if test (count $target_cities) -eq 0
            set target_cities dijon larbaa-nath-irathen chanaz le-bettex paris marseille mamoudzou
        end
        # Updated headers with emojis for better styling
        echo "📍|ICON|CONDITION|🌡️ TEMP | FEELS LIKE|💧|🌧️|🌬️"
        echo "----|----|---------|---|---|---|---|---"

        for city in $target_cities
            echo (curl -s "wttr.in/$city?format=%l|%c|%C|%t|%f|%h|%p|%w&lang=fr")
        end
    end | column -t -s '|' \
        | perl -pe 's/([-+]?\d+)°C/ $t=$1; $c = $t>=35?196 : $t>=30?208 : $t>=25?214 : $t>=20?226 : $t>=15?118 : $t>=10?46 : $t>=5?43 : $t>=0?51 : $t>=-5?33 : 21; "\e[38;5;${c}m$&\e[0m" /ge' \
        | perl -pe 's/(\d+)km\/h/ $w=$1; $c = $w>=40?196 : $w>=25?208 : $w>=15?226 : 0; $c ? "\e[38;5;${c}m$&\e[0m" : $& /ge'
    #end | column -t -s '|' | perl -pe 's/([-+]?\d+)°C/ $1 >= 30 ? "\e[31m$&\e[0m" : ($1 >= 15 ? "\e[32m$&\e[0m" : ($1 >= 5 ? "\e[33m$&\e[0m" : "\e[36m$&\e[0m")) /ge'

end

function weather_table
    # 1. Default cities
    set -l target_cities $argv
    if test (count $target_cities) -eq 0
        set target_cities dijon larbaa-nath-irathen chanaz le-bettex marseille paris
        #Geneva Grenoble Annecy
    end

    begin
        # 2. Updated headers to include Min, Max, and Sun
        echo "CITY|ICON|CONDITION|🌡️ NOW|🥶 MIN|🔥 MAX|☀️ SUN|🌬️ WIND"
        echo "----|----|---------|------|------|------|------|-------"

        for city in $target_cities
            # Step A: Get the current snapshot (for the emojis and current temp)
            set -l current (curl -s "wttr.in/$city?format=%l|%c|%C|%t")

            # Step B: Get the JSON (for min, max, and sun hours)
            set -l daily (curl -s "wttr.in/$city?format=j1" | jq -r '"\(.weather[0].mintempC)°C|\(.weather[0].maxtempC)°C|\(.weather[0].sunHour)h"')

            # Step C: Get the wind (just to put it at the end of the line)
            set -l wind (curl -s "wttr.in/$city?format=%w")

            # Stitch them all together with pipes!
            echo "$current|$daily|$wind"

        end
    end | column -t -s '|' \
        | perl -pe 's/([-+]?\d+)°C/ $t=$1; $c = $t>=35?196 : $t>=30?208 : $t>=25?214 : $t>=20?226 : $t>=15?118 : $t>=10?46 : $t>=5?43 : $t>=0?51 : $t>=-5?33 : 21; "\e[38;5;${c}m$&\e[0m" /ge' \
        | perl -pe 's/(\d+)km\/h/ $w=$1; $c = $w>=40?196 : $w>=25?208 : $w>=15?226 : 0; $c ? "\e[38;5;${c}m$&\e[0m" : $& /ge'

end

function forecast
    # Use the city you type, or default to Geneva if you type nothing
    set -l city $argv[1]
    if test -z "$city"
        set city Geneva
    end

    # 1. Print the compact, emoji-based current weather
    echo (curl -s "wttr.in/$city?format=📍+%l:+%c+%C+|+🌡️+%t+(Feels+%f)+|+🌬️+%w\n")

    # 2. Fetch the 1-day forecast, but use awk to DELETE the giant ASCII art
    # This tells awk: "Wait until you see the top-left corner of the table (┌), then print everything after it."
    #curl -s "wttr.in/$city?1q" | awk '/┌/{flag=1} flag'
end

function forecast2
    set -l city $argv[1]
    if test -z "$city"
        set city Geneva
    end

    # 1. Print the compact one-liner
    echo (curl -s "wttr.in/$city?format=📍+%l:+%c+%C+|+🌡️+%t+(Feels+%f)+|+🌬️+%w\n")

end
function forecast3
    set -l city $argv[1]
    if test -z "$city"
        set city Geneva
    end

    # 1. Print your compact, one-line summary
    echo (curl -s "wttr.in/$city?format=📍+%l:+%c+%C+|+🌡️+%t+(Feels+%f)+|+🌬️+%w\n")

    # 2. Fetch the 1-day forecast, but start printing at line 8 (skipping the giant art)
    curl -s "wttr.in/$city?1q" | tail -n +8
end
