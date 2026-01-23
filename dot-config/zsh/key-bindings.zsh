copy-to-system-clipboard() { print -rn -- "$BUFFER" | wl-copy }
paste-from-system-clipboard() { LBUFFER+=$(wl-paste) }
change-cmd() {
    zle beginning-of-line
    zle kill-word
}

zle -N copy-to-system-clipboard
zle -N paste-from-system-clipboard
zle -N change-cmd


#######################################################
# ZSH Keybindings
#######################################################

# bindkey -v                                        # vim-style key bindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^Y' copy-to-system-clipboard             # ctrl + Y
bindkey '^P' paste-from-system-clipboard          # ctrl + P
bindkey '^X' change-cmd                           # ctrl + X
bindkey '^D' backward-kill-line                   # ctrl + S
bindkey '^F' kill-line                            # ctrl + D
bindkey '^B' backward-word                        # ctrl + B
bindkey '^W' forward-word                         # ctrl + W
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[b' backward-kill-word                  # alt + B
bindkey '^[w' kill-word                           # alt + W
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action
