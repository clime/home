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
    umask 002

    cd() {
        builtin cd "$@"
        ls --color=auto
    }
fi

set -o vi
PS1="\[\e[33;1m\]\u\[\e[32;1m\]@\[\e[32;1m\]\h \[\e[37;1m\]\w\[\e[32;1m\] $ \[\e[0m\]" 
PATH=$PATH:./:/usr/local/bin:~/scripts

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export HISTSIZE=10000
export HISTFILESIZE=10000
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

stty werase undef
bind '"\C-w": unix-filename-rubout'
bind '"\C-x": unix-filename-rubout'
bind '"\C-k": history-search-backward'
bind '"\C-j": history-search-forward'

alias soba='source ~/.bashrc'

alias suvim='sudo vim'
alias sutail='sudo tail'

alias ll='ls -l'
alias lla='ll -a'
alias lsa='ls -a'
alias ltr='ls -ltr'

alias cdu='cd ../'
alias cduu='cd ../../'
alias cduuu='cd ../../../'
alias cduuuu='cd ../../../../'

mkcd() { mkdir $1 && cd $1; }

cpu() { cp "$@" ../; }
cpuu() { cp "$@" ../../; }
cpuuu() { cp "$@" ../../../; }
cpuuuu() { cp "$@" ../../../../; }

mvu() { mv "$@" ../; }
mvuu() { mv "$@" ../../; }
mvuuu() { mv "$@" ../../../; }
mvuuuu() { mv "$@" ../../../../; }

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

latestmods() { # find lately modified files
    find $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head -n $1;
}

box() {
    builtin cd ~/docker/clime/
    make $1 ${2:+tag="-$2"}
    builtin cd -
}

ix() {
    curl -n -F 'f:1=<-' http://ix.io
}

alias clime.cz='ssh -p 1022 clime.cz'

alias p2packs='cd /usr/lib/python2.7/site-packages'
alias p3packs='cd /usr/lib/python3.7/site-packages'
export p2packs=/usr/lib/python2.7/site-packages
export p3packs=/usr/lib/python3.7/site-packages

alias sysrst="sudo systemctl restart"
alias sysctl="sudo systemctl"
alias syslog="sudo journalctl -xe -u"

alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

source ~/scripts/alias_autocomplete.sh

ix() { curl -n -F 'f:1=<-' http://ix.io; }

alias pscp="rsync -P -e ssh"

# Usage:
#
# attach_to_thread <thread_name> 'gdb cmd'
#
# e.g.
#
# attach_to_thread CMPTO_NET_SERVE 'b SrtConnection.cpp:492'
function attach_to_thread {
    thread_name=$1

    if [ -z "$thread_name" ]; then
        echo "<thread_name> required" 1>&2
        return 1
    fi

    thread_pid=
    while true; do
        thread_pid=$(ps -eL | grep "$thread_name" | awk '{ print $1; }')
        if [ -n "$thread_pid" ]; then
            break
        fi
        echo "Waiting for thread to spawn..."
        sleep 1
    done
    echo "Found thread ${thread_name} with pid ${thread_pid}."

    gdb -ex "$2" -p "$thread_pid"
}

export EDITOR=vim

alias psql='PAGER="vim -" psql'

# source local definitions
if [ -f ~/.local_bashrc ]; then
    . ~/.local_bashrc
fi
