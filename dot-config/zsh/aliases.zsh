#######################################################
# Aliases
####################################################### 

# force zsh to show the complete history
alias history='builtin history 0'
alias h='builtin history 0'

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
fi

# Alias for neovim
if [[ -x "$(command -v nvim)" ]]; then
    alias vi='nvim'
    alias vim='nvim'
    alias svi='sudo nvim'
    alias vis='nvim "+set si"'
elif [[ -x "$(command -v vim)" ]]; then
	alias vi='vim'
	alias svi='sudo vim'
	alias vis='vim "+set si"'
fi

# Alias for lsd
if [[ -x "$(command -v lsd)" ]]; then
    alias ls='lsd -F --color=auto --group-directories-first'
    alias l='ls -l --blocks permission,user,group,size,name'
    alias ll='ls -l'
    alias la='ls -A'
    alias lla='ls -lA --blocks permission,user,group,size,name'
    alias tree='ls --tree'
fi

# Some other usefull aliases
alias c='clear'
alias q='exit'
alias fd='fdfind'
alias stow='command stow --dotfiles'
