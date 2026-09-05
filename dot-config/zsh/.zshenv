# ~/.config/zsh/.zshenv

# -------------- XDG BASE DIRECTORIES ---------------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# -------------------- EDITOR -----------------------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# --------------------- PAGER -----------------------
if command -v nvim >/dev/null 2>&1; then
    export MANPAGER='nvim +Man!'
elif command -v bat >/dev/null 2>&1; then
    export MANPAGER='bat -l man -p'
fi

# --------------------- GPG -------------------------
export GPG_TTY=$(tty)

# ---------------- TERMINAL TYPE --------------------
export TERM="xterm-256color"
