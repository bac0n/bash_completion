#
# Expand dots to dot-dot component (~/.bash_aliases).
#
__cd__(){
    local c=$_ x='' y='' z=3
    (($#>0)) && \
    local d=${@:(-1)} || d=''
    if [[ $d = _ ]]; then
        [[ -d $c ]] && d=$c || d=${c%/*}
    fi
    if [[ $d =~ ^[+]([0-9]+)$ ]] && [ ! -d "$d"* ]; then
        eval printf -v d .%.0s \{1..$((${BASH_REMATCH[1]} + 1))\}
    fi
    while [[ ! -d $d ]] && [[ ${d:${#x}} =~ (^|/)([.]{3,})(/.*)?$ ]]; do
        x=${d:0:(${#d} - ${#BASH_REMATCH[3]})}
        if [[ ! -d $x ]]; then
            y='..'
            for ((z=3; z <= ${#BASH_REMATCH[2]}; z++)); do
                y+='/..'
            done
            d=${d:0:(${#d} - ${#BASH_REMATCH[0]})}${BASH_REMATCH[1]}${y}${BASH_REMATCH[3]}
        fi
    done
    builtin cd "$d" > /dev/null && command ls --almost-all --color=auto
}

cd_undo(){
    if [[ ${READLINE_LINE%% *} != cd ]]; then
        return
    fi
    local d='' x='' y='' z=0
    READLINE_LINE=${READLINE_LINE%/}
    d=$(rev <<< ${READLINE_LINE#* })
    if [[ $d =~ (^|/)([.]{2}(/[.]{2})+)(/.*)?$ ]]; then
        y=.
        x=${BASH_REMATCH[2]//\/}
        for ((z=0; z < (${#x} / 2); z++)); do
            y+=.
        done
        x=${d:0:(${#d} - ${#BASH_REMATCH[0]})}
        READLINE_LINE="cd $(rev <<< ${x}${BASH_REMATCH[1]}${y}${BASH_REMATCH[4]})"
        READLINE_POINT=$((${#READLINE_LINE} - ${#x} - ${#BASH_REMATCH[1]}))
    else
        i=0
        x=$((${#READLINE_LINE} - $READLINE_POINT))
        while [[ ${d:$x} =~ (^|/)([.]{3,})(/.*)?$ ]]; do
            x=$((${#d} - ${#BASH_REMATCH[3]}))
            if (( (${#BASH_REMATCH[2]} + ${#BASH_REMATCH[3]}) == ($READLINE_POINT - 3) )); then
                continue
            fi
            READLINE_POINT=$((${#BASH_REMATCH[0]} - ${#BASH_REMATCH[1]} + 3))
            break
        done
    fi
}

# bind cd undo to readline keyseq ESC ESC.
if [[ $(declare -F cd_undo) = cd_undo ]]; then
    bind -r '"\e\e"'
    bind -x '"\e\e"  :cd_undo'
    bind -x '"\e\e\e":cd_undo'
fi
