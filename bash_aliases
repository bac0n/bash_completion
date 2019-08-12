#
# Expand dots to dot-dot component (~/.bash_aliases).
#
if [ -n "$PS1" ]; then
cd(){
    local d="${@:(-1)}"
    local x='' y='' z=3
    while [[ ! -d $d ]] && [[ ${d:${#x}} =~ (^|/)([.]{3,})(/.*)?$ ]]; do
        x="${d:0:(${#d}-${#BASH_REMATCH[3]})}"
        if [[ ! -d $x ]]; then
            y='..'
            for ((z=3; z <= ${#BASH_REMATCH[2]}; z++)); do
                y+='/..'
            done
            d="${d:0:(${#d}-${#BASH_REMATCH[0]})}${BASH_REMATCH[1]}${y}${BASH_REMATCH[3]}"
        fi
    done
    builtin pushd "$d" > /dev/null && /bin/ls --almost-all --color=auto
}

cd_undo(){
    local d=$(rev <<< ${READLINE_LINE##* })
    local x='' y='' z=0
    if [[ ${READLINE_LINE%% *} = cd ]] && [[ $d =~ (^|/)([.]{2}(/[.]{2})+)(/.*)?$ ]]; then
        y=.
        x=${BASH_REMATCH[2]//\/}
        for ((z=0; z < (${#x} / 2); z++ )); do
            y+=.
        done
        x=${d:0:(${#d} - ${#BASH_REMATCH[0]})}
        READLINE_LINE="cd $(rev <<< ${x}${BASH_REMATCH[1]}${y}${BASH_REMATCH[4]})"
        READLINE_POINT=$((${#READLINE_LINE} - ${#x} - 1))
        READLINE_LINE=${READLINE_LINE%/}
    fi
}
fi

# bind to readline keyseq ESC ESC.
if [[ $(declare -F cd_undo) = cd_undo ]]; then
    bind -r '"\e\e"'
    bind -x '"\e\e"  :cd_undo'
    bind -x '"\e\e\e":cd_undo'
fi

##
