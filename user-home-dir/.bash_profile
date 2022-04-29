#!/bin/sh

test -f ~/.bash_prompt && . ~/.bash_prompt

#some useful aliases for .cmd files
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
#d.cmd is wrapped by function, see below

alias code='code.cmd'
alias code.='code .'
alias ngtc='ng test --code-coverage'
alias ngt='ng test'
alias ngs='ng serve'
alias ngb='ng build'
alias ngc='rd .cache/ && rd dist/'
alias ngr='rd node_modules && ngc'
alias ngi='ngr && npm install'
alias ngri='ngr && del package-lock.json && npm install -f'

#some commands from Windows Cmd
alias cd..='cd ..'
alias type='cat'
alias cls='clear && printf "\e[3J"'
alias dir='ls -algosAH --group-directories-first'
alias ren='mv'
alias md='mkdir'

# 'rd' alias
function rd {
    if [ -n "$1" ]; then
        rm -rf "$1"
    else
        echo "No dir to delete"
    fi
}

# 'del' alias
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
