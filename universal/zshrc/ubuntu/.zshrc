source $HOME/antigen.zsh
antigen init ~/.antigenrc
export TERM=xterm-256color

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Pipenv
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_PYTHON=$PYENV_ROOT/shims/python

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Go
export PATH="$PATH:/usr/local/go/bin"

bindkey -v
export EDITOR='vim'

if [ -f ~/.zsh_functions ]
then
  . ~/.zsh_functions
fi

if [ -f ~/.zsh_aliases ]
then
  . ~/.zsh_aliases
fi

eval "$(starship init zsh)"
