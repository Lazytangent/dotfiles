# Set Antigen for plugins
source $HOME/antigen.zsh
antigen init ~/.antigenrc

# Pyenv Setup
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1
then
  eval "$(pyenv init -)"
fi

# Pipenv Setup
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_PYTHON=$PYENV_ROOT/shims/python

# nvm Setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# M1 Python Setup
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-L/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/Applications/Emacs.app/Contents/MacOS:$PATH"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

eval "$(starship init zsh)"
