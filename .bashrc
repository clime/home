# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -e /usr/bin/vimx ]; then 
	alias vim='/usr/bin/vimx'; # vim with +xterm_clipboard
fi

if [[ $EUID -ne 0 ]]; then
	# non-root only:
	umask 002

	cd() { 
        builtin cd $@; 
        if [ -f .runenv ]; then
            . .runenv
        fi
        ls; 
    }
fi

set -o vi
export PS1="\[\e[33;1m\]\u\[\e[32;1m\]@\[\e[32;1m\]\h \[\e[37;1m\]\w\[\e[32;1m\] $ \[\e[0m\]" 
export PATH=$PATH:./

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
	sudo find . .[^.]* -print0 | xargs -0 sudo chmod u+wr,g+wr,o-w
}

alias sudo-emperor-start='sudo initctl start uwsgi'
alias sudo-emperor-restart='sudo initctl restart uwsgi'
alias sudo-emperor-stop='sudo initctl stop uwsgi'
alias sudo-emperor-reload='sudo /usr/local/bin/uwsgi --reload /var/run/uwsgi/emperor.pid'
alias sudo-uwsgi-stop='sudo /usr/local/bin/uwsgi --stop'
alias sudo-uwsgi-reload='sudo /usr/local/bin/uwsgi --reload'
alias sudo-uwsgi-top='sudo /usr/local/bin/uwsgitop'

# source local definitions
if [ -f	~/.local_bashrc ]; then
	. ~/.local_bashrc
fi

