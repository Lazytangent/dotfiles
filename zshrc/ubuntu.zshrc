source $HOME/antigen.zsh
antigen init ~/.antigenrc
export TERM=xterm-256color

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export PATH="$HOME/Applications/Picom/picom/build/src:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

bindkey -v
export EDITOR='nvim'

# Ubuntu specific aliases
alias spotify='flatpak run com.spotify.Client'
alias screen='sh ~/.screenlayout/default.sh; feh --bg-fill Pictures/Big\ Sur\ Aerial.heic'
alias killpicom='pkill picom'
alias pcm='picom -b --experimental-backends &'

if [ -f ~/.zsh_functions ]
then
  . ~/.zsh_functions
fi

if [ -f ~/.zsh_aliases ]
then
  . ~/.zsh_aliases
fi

# source /usr/local/bin/activate.sh
