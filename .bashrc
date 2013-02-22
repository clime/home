# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -e /usr/bin/vimx ]; then 
	alias vim='/usr/bin/vimx'; # vim with +xterm_clipboard
fi

if [[ $EUID -ne 0 ]]; then
	# non-root onlY:
	umask 002

	cd() { builtin cd $@; ls; }
fi
	
set -o vi
export PS1="\[\e[33;1m\]\u\[\e[32;1m\]@\[\e[32;1m\]\h \[\e[37;1m\]\w\[\e[32;1m\] $ \[\e[0m\]" 
export PATH=$PATH:./

bind '"\t":menu-complete'

stty werase undef
bind '"\C-w": unix-filename-rubout'

alias bshr='source ~/.bashrc'
alias svim='sudo vim'

alias lla='ll -a'
alias lsa='ls -a'

alias cdwww='cd /srv/www/'

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
	sudo find . .[^.]* -type d -print0 | xargs -0 sudo chmod 775
	sudo find . .[^.]* -type f -print0 | xargs -0 sudo chmod 664
}

# source local definitions
if [ -f	~/.local_bashrc ]; then
	. ~/.local_bashrc
fi

