# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Port in Antigen
source $HOME/antigen.zsh
antigen init ~/.antigenrc

# iTerm Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# MDLoader
export PATH="$HOME/Documents/mdloader/build:$PATH"

# Rbenv Setup
eval "$(rbenv init -)"

# Pyenv Setup
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
if command -v pyenv 1>/dev/null 2>&1
then
  eval "$(pyenv init -)"
fi

# Clangd
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Go Setup
export PATH="$HOME/go/bin:$PATH"

# Pipenv Setup
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_PYTHON=$PYENV_ROOT/shims/python

# nvm Setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_ITERM2=true
source $ZSH/oh-my-zsh.sh

# Doom Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

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

# Autoenv plugin
source /usr/local/bin/activate.sh  # commented out by conda initialize

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

# Starship setup
eval "$(starship init zsh)"