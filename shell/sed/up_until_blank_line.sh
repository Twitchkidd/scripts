up_until_blank_line() {
    if [ -z $1 ] # if first input is a null string
    then
        return
    else
        # sed 's/^\s*$/moo/' $1
        # grep -n '^\s*$' $1 # -> 4:
        # ohh, but if you just use cut what if it's line 157
        # mmkay, so grep, write in a return if none found,
        # then sed the grep for the colon, then del past the
        # match, then sub out any whitespace
        blank_line=$(grep -n '^\s*$' $1 | sed 's/://')
        line_after=$(($(($blank_line)) + 1)) 
        sed "$line_after,\$d" $1 | sed 's/^\s*$//'
    fi
}
alias uubl="up_until_blank_line"