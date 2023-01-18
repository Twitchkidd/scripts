up_until_blank_line() {
    if [ -z $1 ] # if first input is a null string
    then
        return
    else
        blank_line=$(grep -n '^\s*$' $1 | sed 's/://')
        line_after=$(($(($blank_line)) + 1)) 
        sed "$line_after,\$d" $1 | sed 's/^\s*$//'
    fi
}
alias uubl="up_until_blank_line"