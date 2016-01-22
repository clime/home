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
PS1="\[\e[33;1m\]\u\[\e[32;1m\]@\[\e[32;1m\]\h \[\e[37;1m\]\w\[\e[32;1m\] $ \[\e[0m\]" 
PATH=$PATH:./:/usr/local/bin:~/scripts/
GREP_OPTIONS='--color=auto'

#bind '"\t":menu-complete'

stty werase undef
bind '"\C-w": unix-filename-rubout'
bind '"\C-x": unix-filename-rubout'
bind '"\C-k": history-search-backward'
bind '"\C-j": history-search-forward'

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

export UWSGI_BINPATH='/usr/local/bin/uwsgi'

alias sudo-emperor-start='sudo initctl start uwsgi'
# there is a problem with restating emperor that vassals 
# remove pid files of new emperor instance (vacuum option)
# you need to stop, wait, and start
#alias sudo-emperor-restart='sudo initctl restart uwsgi'
alias sudo-emperor-stop='sudo initctl stop uwsgi'
alias sudo-emperor-reload='sudo $UWSGI_BINPATH --reload /var/run/uwsgi/emperor.pid'
alias sudo-uwsgi-top='sudo /usr/local/bin/uwsgitop'

function sudo-uwsgi-reload() {
	sudo $UWSGI_BINPATH --reload "/var/run/uwsgi/$1.pid";
}

function sudo-uwsgi-stop() {
	sudo $UWSGI_BINPATH --stop "/var/run/uwsgi/$1.pid";
}

export ANSIBLE_KEEP_REMOTE_FILES=1

# find lately modified files
alias latestmods="find $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head"

alias climecz='ssh -p 1022 clime.cz'

alias p2packs='cd /usr/lib/python2.7/site-packages'
export p2packs=/usr/lib/python3.4/site-packages
alias p3packs='cd /usr/lib/python2.7/site-packages'
export p3packs=/usr/lib/python3.4/site-packages

alias sysctl="sudo systemctl"
alias syslog="sudo journalctl -xe -u"

# source local definitions
if [ -f	~/.local_bashrc ]; then
	. ~/.local_bashrc
fi

source scripts/.alias_autocomplete.sh
