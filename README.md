# 🏠 Dotfiles

My personal Linux dotfiles — shell, terminal, editor, and other CLI tooling setup.

---

## ✨ Features

* Zsh configuration (plugins, completions, aliases, functions)
* Powerlevel10k prompt
* Alacritty terminal config
* Stow-based symlink management

---

## 📁 Structure

```
.
├── .config
│    ├── alacritty
│    ├── lf
│    ├── nvim
│    ├── rofi
│    ├── sway
│    ├── swaylock
│    ├── swaync
│    ├── tmux
│    ├── waybar
│    └── zsh
├── .p10k.zsh
├── .stow-local-ignore
├── .zshrc
└── README.md
```

(Structure may evolve over time.)

---

## 🚀 Installation

> Recommended: use a clean system or backup existing configs first.

### 1. Install dependencies

#### Kali Linux

```bash
sudo apt install git fzf stow alacritty lf neovim rofi sway swaylock swaync tmux waybar zsh
```
#### Arch Linux

```bash
sudo pacman -S git fzf stow alacritty lf neovim rofi sway swaylock swaync tmux waybar zsh
```

(or your distro equivalent)

### 2. Clone the repo

```bash
git clone https://github.com/amanmaurya-406/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Symlink configs

```bash
stow --dotfiles .
```

---

## 📦 Optional Tools

Recommended tools I use:

* `fzf`
* `ripgrep`
* `bat`
* `lsd`
* `zoxide`
* `fd`

---

## ❤️ Credits

Built over time with lots of trial, errors, and terminal restarts.

---

If you use this setup someday — enjoy the speed ⚡
