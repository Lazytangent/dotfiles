# Source Custom zshenv
source ~/._zshenv

# Set Antigen for plugins
source $HOME/antigen.zsh
antigen init ~/.antigenrc

# MacOS iTerm Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Zathura
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

# FZF
export FZF_DEFAULT_COMMAND='fd --type f'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Vi-Mode in Terminal
bindkey -v
set -o vi
export EDITOR='nvim'

# Docker Plugin Completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle ':completion:*' completer _extensions _complete _approximate

# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'j' vi-up-line-or-history
# bindkey -M menuselect 'k' vi-down-line-history
# bindkey -M menuselect 'l' vi-forward-char

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Port in Completions
fpath+=${ZDOTDIR:-~}/.zsh_completions

# Port in Aliases
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
else
  echo "You're missing the aliases"
fi

# Port in OS Custom Aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Port in Functions
if [ -f ~/.zsh_functions ]; then
  source ~/.zsh_functions
else
  echo "You're missing the functions"
fi

if [ -f ~/.vaultrc ]; then
  source ~/.vaultrc
fi

if command -v pyenv 1>/dev/null 2>&1
then
  eval "$(pyenv init -)"
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# Use Zoxide if it's executable
if command -v z > /dev/null 2>&1; then
  alias cd=z
fi

if command -v exa > /dev/null 2>&1; then
  alias ls=exa
fi
