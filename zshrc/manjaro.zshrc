# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/antigen.zsh
antigen init ~/.antigenrc
export TERM=xterm-256color

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/Applications/Picom/picom/build/src:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

# Export TMUX Autostart
export ZSH_TMUX_AUTOSTART_ONCE=true

source $ZSH/oh-my-zsh.sh

bindkey -v
export EDITOR='nvim'

if [ -f ~/.zsh_functions ]; then
  . ~/.zsh_functions
fi

if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

# Ubuntu specific aliases
alias spotify='flatpak run com.spotify.Client'
alias screen='sh ~/.screenlayout/default.sh; feh --bg-fill Pictures/Big\ Sur\ Aerial.heic'
alias killpicom='pkill picom'
alias pcm='picom -b --experimental-backends &'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/Applications/dart-sass:$PATH"

eval "$(starship init zsh)"
