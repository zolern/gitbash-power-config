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
alias nc='nc.cmd'
alias nr='nr.cmd'
alias np='n p'
alias nv='nv.cmd'
alias bams='bams.cmd'
#alias d='d.cmd' - wrapped by function, see below
#alias n='n.cmd' - wrapped by function, see below

alias code='code.cmd'
alias code.='code .'
alias ng='npx ng'
alias ngtc='npx ng test --code-coverage'
alias ngt='npx ng test'
alias ngs='npx ng serve'
alias ngb='npx ng build'
alias ngc='rd .cache/ && rd dist/'
alias ngr='rd node_modules && ngc'
alias ngi='ngr && npm install'
alias ngri='ngr && del package-lock.json && npm install -f'

#some commands from Windows Cmd
alias cd..='cd ..'
alias type='cat'
alias cr='printf "\e[3J" && printf "\e[?25h"'
alias cls='clear'
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
        rm -f "$1"
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

# bash wrapper for n.cmd
function n() {
	if [[ ${1,,} = "env" ]]; then
        n.cmd "$@"
		if [ -n "$2" ]; then
			NODE_ENV=$(n.cmd "$@" -p)
		fi
	else
		n.cmd "$@"
	fi
}
