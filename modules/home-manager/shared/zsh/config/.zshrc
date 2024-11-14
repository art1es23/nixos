export TERM="xterm-256color"
export ZSH="$HOME/.config/zsh"

# Add any additional configurations here
export NIX_CONF_DIR=$HOME/.config/nix
export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH

# Environment
export LANG=en_US.UTF-8
export VISUAL="nvim"
export EDITOR="$VISUAL"
export BUN_INSTALL="$HOME/.bun"
export NVM_DIR="$HOME/.nvm"
export AE_DEPLOYMENT_ENV="debug"

export PATH="$PATH:/run/current-system/sw/bin"
export PATH="$PATH:$HOME/.flutter/bin"
export PATH="$PATH:$BUN_INSTALL/bin"
export PATH="$PATH:$HOME/neovim/bin"
export PATH="$PATH:/opt/homebrew/opt/ruby/bin"

# Antigen
source "$ZSH/plugins/antigen.zsh"

antigen bundle git
antigen bundle brew
antigen bundle docker
antigen bundle node
antigen bundle npm
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# antigen bundle <<EOBUNDLES
#     # Bundles from the default repo (robbyrussell's oh-my-zsh)
#
#     asdf
#     git
#     git-commit
#     brew
#     docker
#     npm
#     node
#     rust
#     deno
#     bun
#     heroku
#     ssh
#     ssh-agent
#     nvm
#
#     zsh-users/zsh-syntax-highlighting
#     zsh-users/zsh-autosuggestions
#     zsh-users/zsh-completions
#
#     redis-cli
#
# EOBUNDLES

antigen apply

# Zoxide
eval "$(zoxide init zsh)"

# Atuin
eval "$(atuin init zsh)"

# Theming
eval "$(oh-my-posh init zsh --config $ZSH/themes/tokyonight.omp.toml)"

# Vim mode
set -o vi
bindkey -v

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# BAT
export BAT_THEME=tokyonight_night

# FZF 
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200'  "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"                          "$@" ;;
    ssh)          fzf --preview 'dig {}'                                    "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview"                 "$@" ;;
  esac
}

source <(fzf --zsh)

# Aliases
alias ls="eza --icons=always"

alias v="nvim"

alias gst="lazygit"

alias cnix="nvim ~/nixos"
alias cdnix="cdd ~/nixos"

alias cn="vim ~/.config/nvim"
alias cz="vim ~/.config/zsh"

alias visudo="sudo -E visudo"

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
