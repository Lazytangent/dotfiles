source $HOME/antigen.zsh
antigen init ~/.antigenrc

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bindkey -v
set -o vi
export EDITOR='nvim'

if [ -f ~/.zsh_functions ]; then
  . ~/.zsh_functions
fi

if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

eval "$(starship init zsh)"
