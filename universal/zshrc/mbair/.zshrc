source $HOME/antigen.zsh
antigen init ~/.antigenrc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Pyenv Setup
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/shims:$PATH"

if command -v pyenv 1>/dev/null 2>&1
then
  eval "$(pyenv init -)"
fi

# Pipenv Setup
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_PYTHON=$PYENV_ROOT/shims/python

# Clangd
export PATH="/usr/local/opt/llvm/bin:$PATH"

# nvm Setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_ITERM2=true
source $ZSH/oh-my-zsh.sh

# Vi-Mode in Terminal
bindkey -v
set -o vi
export EDITOR='nvim'

# Docker Plugin Completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Port in Functions
if [ -f ~/.zsh_functions ]; then
  . ~/.zsh_functions
fi

# Port in Aliases
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

eval "$(starship init zsh)"
