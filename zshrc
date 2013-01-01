# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/mah/.rvm/gems/ruby-1.9.3-p286/bin:/home/mah/.rvm/gems/ruby-1.9.3-p286@global/bin:/home/mah/.rvm/rubies/ruby-1.9.3-p286/bin:/home/mah/.rvm/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games


# ---------------
# My own configuration starts here
# ---------------

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias chrome="google-chrome"
alias nettest="ping wschurman.com"
alias mvim="gvim"
alias ~="cd ~"
alias cdo="cd .."
alias ..="cd .."

alias rspecc="rspec -c"
alias junit="java org.junit.runner.JUnitCore"
alias diffc="colordiff"
alias cdo="cd .."
alias cdl="cd $1; ls"

# git aliases
alias gfp="git fetch && git pull"
alias gc="git checkout"
alias gcomm="git commit"
alias gb="git branch"
alias gs="git status"
alias gl="git log --graph --pretty=format:\"%h%x09%an%x09%ad%x09%s\""
alias gd="git diff"
alias greb="git rebase -i"
alias gpush="git push origin"

alias clipboard="xclip -selection clipboard"
alias meminfo="watch -n0.1 cat /proc/meminfo"

alias "rmrf"="rm -rfi"
alias "getip"="curl ifconfig.me"

# Command not found recommendation
if [[ -x /usr/lib/command-not-found ]] ; then
	function command_not_found_handler() {
		/usr/lib/command-not-found --no-failure-msg -- $1
	}

fi

source /usr/share/autojump/autojump.zsh
source ~/.zshrc_extra
