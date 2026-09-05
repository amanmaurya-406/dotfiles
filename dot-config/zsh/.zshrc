# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



#######################################################
# Shell Parameters
#######################################################

# A list of non-alphanumeric characters considered part of a word by the line editor.
WORDCHARS=${WORDCHARS//-}
WORDCHARS=${WORDCHARS//.}
WORDCHARS=${WORDCHARS//|}
WORDCHARS=${WORDCHARS//\/}



#######################################################
# Time Format
#######################################################

TIMEFMT=$'\033[36mUser:\033[0m    %U
          \033[36mSystem:\033[0m  %S
          \033[36mTotal:\033[0m   %E'



#######################################################
# History Configuration
#######################################################

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTORY_IGNORE='(ls*|cd*|z*|pwd|exit|history*|cd -*|sudo reboot)'
HISTSIZE=10000
SAVEHIST=8000

setopt APPEND_HISTORY         # appends commands rather than overwritting them
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_FIND_NO_DUPS      # prevents any duplicates from being shown to us inside historical search
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS       # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_SAVE_NO_DUPS      # don't save duplicate commands
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt SHARE_HISTORY          # share command history over all the zsh sessions at the same time



#######################################################
# ZSH Basic Options (Shell behaviour)
#######################################################

#setopt CORRECT                # auto correct mistakes
setopt AUTO_CD                # change directory just by typing its name
setopt INTERACTIVE_COMMENTS   # allow comments in interactive shell
setopt MAGIC_EQUAL_SUBST      # enable filename expansion for arguments of the form ‘anything=expression’
setopt NO_NOMATCH             # hide error message if there is no match for the pattern
setopt NOTIFY                 # report the status of background jobs immediately
setopt NUMERIC_GLOB_SORT      # sort file10 after file9, note after file1
setopt PROMPT_SUBST           # enable command substitution in prompt



#######################################################
# Shell integrations
#######################################################

# Initialize zoxide (Smart directory navigation)
eval "$(zoxide init zsh)"

# Initialize fuzzy finder
eval "$(fzf --zsh)"



#######################################################
# Modular config files
#######################################################

# fzf configuration
source "$ZDOTDIR/fzf.zsh"

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Custom keybindings
source "$ZDOTDIR/key-bindings.zsh"

# Plugins and plugin manager
source "$ZDOTDIR/plugins.zsh"

# Prompt/theme
source "$ZDOTDIR/prompt.zsh"

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    source /etc/zsh_command_not_found
fi



#######################################################
# Completion
#######################################################

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d $XDG_CACHE_HOME/zsh/zcompdump
zinit cdreplay -q



#######################################################
# Completion styling
#######################################################

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'



#######################################################
# Archive Extraction
#######################################################

# Usage: ex <file1 ... >
function ex {
  if [ -z "$1" ]; then
      # display usage if no parameters given
      echo "Usage: ex <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    else
      for n in "$@"
      do
        if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2) tar xjf "$1"           ;;
            *.tar.gz)  tar xzf "$1"           ;;
            *.bz2)     bunzip2 "$1"           ;;
            *.rar)     unrar x "$1"           ;;
            *.gz)      gunzip "$1"            ;;
            *.tar)     tar xf "$1"            ;;
            *.tbz2)    tar xjf "$1"           ;;
            *.tgz)     tar xzf "$1"           ;;
            *.zip)     unzip "$1"             ;;
            *.Z)       uncompress "$1"        ;;
            *.7z)      7z x "$1"              ;;
            *.deb)     ar x "$1"              ;;
            *.tar.xz)  tar xf "$1"            ;;
            *.tar.zst) tar -I zstd -xf "$1"   ;;
            *) 
              echo "ex: '$n' - unknown archive method"
              return 1
              ;;
          esac
        else
          echo "'$n' - file does not exist"
          return 1
        fi
      done
  fi
}
