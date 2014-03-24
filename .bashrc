# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -e /usr/bin/vimx ]; then 
	alias vim='/usr/bin/vimx'; # vim with +xterm_clipboard
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [[ $EUID -ne 0 ]]; then
	# non-root only:
	umask 002

	cd() { 
        builtin cd $@; 
        #if [ -f .runenv ]; then
            #. .runenv
        #fi
        ls; 
    }
fi

set -o vi
export PS1="\[\e[33;1m\]\u\[\e[32;1m\]@\[\e[32;1m\]\h \[\e[37;1m\]\w\[\e[32;1m\] $ \[\e[0m\]" 
export PATH=$PATH:./
export GREP_OPTIONS='--color=auto'

#bind '"\t":menu-complete'

stty werase undef
bind '"\C-w": unix-filename-rubout'
bind '"\C-x": unix-filename-rubout'

alias soba='source ~/.bashrc'

alias suvim='sudo vim'
alias sutail='sudo tail'

alias lla='ll -a'
alias lsa='ls -a'

alias cdu='cd ../'
alias cduu='cd ../../'
alias cduuu='cd ../../../'
alias cduuuu='cd ../../../../'

mkcd() { mkdir $1 && cd $1; }

cpu() { cp $@ ../; }
cpuu() { cp $@ ../../; }
cpuuu() { cp $@ ../../../; }
cpuuuu() { cp $@ ../../../../; }

mvu() { mv $@ ../; }
mvuu() { mv $@ ../../; }
mvuuu() { mv $@ ../../../; }
mvuuuu() { mv $@ ../../../../; }

# git related:
alias gpull='git pull'
alias gpush='git push'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

wwwperm() {
	sudo find . -type d -print0 | xargs -0 -n100 sudo chmod ug+rwx,o+rx,o-w
	sudo find . -type f -print0 | xargs -0 -n100 sudo chmod ug+rw,o+r,o-wx
}

alias sudo-emperor-start='sudo initctl start uwsgi'
# there is a problem with restating emperor that vassals 
# remove pid files of new emperor instance (vacuum option)
# you need to stop, wait, and start
#alias sudo-emperor-restart='sudo initctl restart uwsgi'
alias sudo-emperor-stop='sudo initctl stop uwsgi'
alias sudo-emperor-reload='sudo /usr/local/bin/uwsgi --reload /var/run/uwsgi/emperor.pid'
alias sudo-uwsgi-top='sudo /usr/local/bin/uwsgitop'

function sudo-uwsgi-reload() {
	sudo /usr/local/bin/uwsgi --reload "/var/run/uwsgi/$1.pid";
}

function sudo-uwsgi-stop() {
	sudo /usr/local/bin/uwsgi --stop "/var/run/uwsgi/$1.pid";
}

# source local definitions
if [ -f	~/.local_bashrc ]; then
	. ~/.local_bashrc
fi

# find lately modified files
# find $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head
