source $HOME/antigen.zsh
antigen init ~/.antigenrc
export TERM=xterm-256color

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

bindkey -v
export EDITOR='nvim'

if [ -f ~/.zsh_functions ]
then
  . ~/.zsh_functions
fi

if [ -f ~/.zsh_aliases ]
then
  . ~/.zsh_aliases
fi

eval "$(starship init zsh)"
