#!/bin/sh

if [ "$#" -eq 1 ]; then
    [ -n "$DISPLAY" ] && firstx="$DISPLAY" || firstx=":0"
    secondx="$1"
elif [ "$#" -eq 2 ]; then
    firstx="$1"
    secondx="$2"
else
    echo "${0##*/} [<DISPLAY1>] <DISPLAY2>" >&2
    exit 1
fi

clipboard="."

clipupd() {
    local _fx="$1"
    local _sx="$2"
    local _clip="$(xsel --display $_fx -ob)"

    if [ "$_clip" != "$clipboard" ]
    then
        clipboard="$_clip"
        # update clipboard and selection buffer
        echo -n "$clipboard" | xsel --display $_sx -ib
        echo -n "$clipboard" | xsel --display $_sx -ip
        return 0
    fi
    return 1
}

while DISPLAY="$secondx" xset q >/dev/null 2>&1 ; do
    sleep 1
    clipupd "$firstx" "$secondx" || clipupd "$secondx" "$firstx"
done
