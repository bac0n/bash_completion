#
# Expand dots to dot-dot component (~/.bash_aliases).
# 
if [ -n "$PS1" ]; then
cd(){
    local d="${@:(-1)}"
    local x='' y='' z=3
    while [[ ! -d $d ]] && [[ ${d:${#x}} =~ ((^|/)([.]{3,}))(/.*)?$ ]]; do
        x="${d%%${BASH_REMATCH[0]}*}${BASH_REMATCH[1]}"
        if [[ ! -d $x ]]; then
            y='..'
            for ((z = 3; z <= ${#BASH_REMATCH[3]}; z++)); do
                y+='/..'
            done
            d="${d%%${BASH_REMATCH[0]}*}${BASH_REMATCH[2]}${y}${BASH_REMATCH[4]}"
        fi
    done
    builtin pushd "$d" > /dev/null && /bin/ls --almost-all --color=auto
}
fi
