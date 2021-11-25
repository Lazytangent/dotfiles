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

# tmuxp completion
eval "$(_TMUXP_COMPLETE=source_zsh tmuxp)"

# Docker Plugin Completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Port in Completions
fpath+=${ZDOTDIR:-~}/.zsh_completions
fpath+="/opt/homebrew/share/zsh/site-functions/"

# Port in Aliases
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

# Port in Functions
if [ -f ~/.zsh_functions ]; then
  source ~/.zsh_functions
fi

if command -v pyenv 1>/dev/null 2>&1
then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

eval "$(rbenv init -)"
eval "$(exenv init -)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
