# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Alias definitions.

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ---------------
# My own configuration starts here
# ---------------

alias chrome="google-chrome"
alias nettest="ping wschurman.com"
alias mvim="gvim"
alias cdo="cd .."
alias ..="cd .."

alias rspecc="rspec -c"
alias junit="java org.junit.runner.JUnitCore"
alias diffc="colordiff"

# git aliases
alias gfp="git fetch && git pull"
alias gc="git checkout"
alias gcomm="git commit"
alias gb="git branch"
alias gs="git status"
alias gl="git log --pretty=format:\"%h%x09%an%x09%ad%x09%s\""
alias gd="git diff"
alias greb="git rebase -i"
alias gpush="git push origin"

export LFS=~/Programming/lfs
export RSYNC_RSH="ssh"

complete -o default -o nospace -F _git_checkout gc
complete -o default -o nospace -F _git_diff gd
complete -o default -o nospace -F _git_push_origin gpush

alias less="less -R"
alias ssh_mahserver='gnome-terminal --window-with-profile=Rin -x bash -c "ssh -lubuntu davidpmah.com"; exit;'
alias ssh_adpserver="ssh adp@dante.u.washington.edu"
alias duckerberg="107.21.245.143"
alias clipboard="xclip -selection clipboard"
alias shutin120="sudo shutdown -h +120"

# Have dependencies that systems I use should always meet
#   Syntax highlighting from pygmentize for cat-like usage
alias pyg="for i in {1..39}; do echo -n "=+"; done; echo ""; pygmentize -f terminal"
alias ack="ack-grep"
source /usr/share/autojump/autojump.bash



gvim(){ setsid /usr/bin/gvim -f "$@"; }

# Events that should occur on all loads of bash
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

if uname -a | grep gnu; then
  PS1='\W$(__git_ps1 "(%s)") \u\$ ' # Git branch in PS1
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Put extra details that are by the machine into .bashrc_extra
if [ -f ~/.bashrc_extra ]; then
    . ~/.bashrc_extra
fi

