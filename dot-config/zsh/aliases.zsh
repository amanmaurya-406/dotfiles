#######################################################
# Aliases
#######################################################

# force zsh to show the complete history
alias history='builtin history 0'
alias h='builtin history 0'

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias dir='dir --color=always'
    alias vdir='vdir --color=always'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
    alias diff='diff --color=always'
    alias ip='ip -color=always'
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
    alias ls='lsd -F --color=always --icon=always --group-directories-first'
    alias l='lsd -l --color=always --icon=always --group-directories-first --blocks permission,user,group,size,name'
    alias l.='lsd -lA --color=always --icon=always --group-directories-first | grep " \."'
    alias ll='lsd -l --color=always --icon=always --group-directories-first'
    alias la='lsd -A --color=always --icon=always --group-directories-first'
    alias lla='lsd -lA --color=always --icon=always --group-directories-first --blocks permission,user,group,size,name'
    alias tree='lsd --tree --color=always --icon=always --group-directories-first'
fi

# Some other usefull aliases
alias c='clear'
alias x='exit'
alias fd='fdfind'
alias stow='command stow --dotfiles'
