#!/bin/sh

test -f ~/.bash_prompt && . ~/.bash_prompt

# alias d='d.cmd' # implemented in its own function (see below)
alias cd..='cd ..'
alias df='df.cmd'
alias ef='ef.cmd'
alias fe='fe.cmd'
alias g='g.cmd'
alias idf='idf.cmd'
alias kb='kb.cmd'
alias msb='msb.cmd'
alias n='n.cmd'
alias nc='nc.cmd'
alias nr='nr.cmd'
alias cls='clear && printf "\e[3J"'
alias dir='ls -algosAH --group-directories-first'
alias code='code.cmd'
alias code.='code .'
alias ngtc='ng test --code-coverage'
alias ngt='ng test'
alias ngs='ng serve'
alias ngb='ng build'
alias ngc='rd .cache/ && rd dist/'
alias ren='mv'
alias md='mkdir'

# delete directory alias
function rd {
    if [ -n "$1" ]; then
        rm -rf "$1"
    else
        echo "No dir to delete"
    fi
}

# delete file alias
function del {
    if [ -n "$1" ]; then
        rm "$1"
    else
        echo "No file to delete"
    fi
}

# bash wrapper for d.cmd
function d() {
	DOUTPUT=$(d.cmd -p "$@")
	if [[ $? = "99" ]]; then
		windir=`echo "$DOUTPUT" | sed 's/ *$//g'`
		linuxdir="$(cygpath -u "$windir")"
		cd "$linuxdir"
	else
		echo "$DOUTPUT"
	fi
}
