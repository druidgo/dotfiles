
#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh

# cmd history
#HISTSIZE=5000   
HISTFILE=~/.zsh_history  # where to save history on disk
setopt appendhistory
setopt sharehistory      # Share history across terminals
setopt incappendhistory  # Immediately append to the history file, not just when a term is killed
# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP


# completions
autoload -Uz compinit
zstyle ':completion:*' menu select

# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist

# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"

zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'zi^M'
bindkey -s '^s' 'ncdu^M'
# bindkey -s '^n' 'nvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'
bindkey -s '^z' 'zi^M'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

# Environment variables set everywhere
export EDITOR="nvim"

# For QT Themes
export QT_QPA_PLATFORMTHEME=qt5ct

