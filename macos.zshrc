# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_ITERM2=true

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  brew
  django
  cask
  zsh-interactive-cd
  osx
  autojump
  tmux
  vi-mode
)

source $ZSH/oh-my-zsh.sh

bindkey -v

export EDITOR='vim'

mcd() {
  mkdir $1 && cd $1
}

sqmg() {
  npx sequelize model:generate --name $1 --attributes $2
}

sqsg() {
  npx sequelize seed:generate --name $1
}

alias npmt2='npm t 2> /dev/null'
alias sqi='npx sequelize init'
alias sqdbc='npx sequelize db:create'
alias sqdbm='npx sequelize db:migrate'
alias sqdbsa='npx sequelize db:seed:all'
alias sqdbmua='npx sequelize db:migrate:undo:all'
alias sqdbsua='npx sequelize db:seed:undo:all'

alias dsqi='npx dotenv sequelize init'
alias dsqdbc='npx dotenv sequelize db:create'
alias dsqdbm='npx dotenv sequelize db:migrate'
alias dsqdbsa='npx dotenv sequelize db:seed:all'
alias dsqdbmua='npx dotenv sequelize db:migrate:undo:all'
alias dsqdbsua='npx dotenv sequelize db:seed:undo:all'

cra() {
  npx create-react-app $1 --use-npm
}

crat() {
  npx create-react-app $1 --template $2 --use-npm
}

crata() {
  npx create-react-app $1 --template @appacademy/react-v17 --use-npm
}

diffy() {
  diff -y $1 $2
}

alias gphm='git push heroku $(git_main_branch)'
alias gfu='git fetch upstream'
alias python-venv='source venv/bin/activate'
alias python-env='source env/bin/activate'
alias trnom='tree -I node_modules'
# alias gcm='git commit -m'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/local/bin/activate.sh
