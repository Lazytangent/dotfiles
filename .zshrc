# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/antigen.zsh
antigen init ~/.antigenrc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/Documents/mdloader/build:$PATH"

if command -v pyenv 1>/dev/null 2>&1
then
  eval "$(pyenv init -)"
fi

export PIPENV_VENV_IN_PROJECT=1
export PYENV_ROOT=$HOME/.pyenv
export PIPENV_PYTHON=$PYENV_ROOT/shims/python
export PATH="$PYENV_ROOT/shims:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_ITERM2=true

source $ZSH/oh-my-zsh.sh
bindkey -v
set -o vi
export EDITOR='nvim'

alias npmt2='npm t 2> /dev/null'

# Sequelize
sqmg() {
  npx sequelize model:generate --name $1 --attributes $2
}

sqsg() {
  npx sequelize seed:generate --name $1
}

alias sqi='npx sequelize init'
alias sqdbc='npx sequelize db:create'
alias sqdbm='npx sequelize db:migrate'
alias sqdbsa='npx sequelize db:seed:all'
alias sqdbmua='npx sequelize db:migrate:undo:all'
alias sqdbsua='npx sequelize db:seed:undo:all'

# Dotenv Sequelize
alias dsqi='npx dotenv sequelize init'
alias dsqdbc='npx dotenv sequelize db:create'
alias dsqdbm='npx dotenv sequelize db:migrate'
alias dsqdbsa='npx dotenv sequelize db:seed:all'
alias dsqdbmua='npx dotenv sequelize db:migrate:undo:all'
alias dsqdbsua='npx dotenv sequelize db:seed:undo:all'

# Heroku
alias herokubash='heroku run bash'
alias herokusq='heroku run npm run sequelize'

# Create React App
cra() {
  npx create-react-app $1 --use-npm
}

crat() {
  npx create-react-app $1 --template $2 --use-npm
}

crata() {
  npx create-react-app $1 --template @appacademy/react-v17 --use-npm
}

# Git
alias gphm='git push heroku $(git_main_branch)'
alias gfu='git fetch upstream'

# Python Venv and Env
alias python-venv='source venv/bin/activate'
alias python-env='source env/bin/activate'

# Pipenv
alias pipi='pipenv install'
alias pips='pipenv shell'
alias pipr='pipenv run'

# Python Unit tests
alias pyutest='python -m unittest'
alias grevf='green -vv -f'
alias grevv='green -vv'
alias grevq='green -vv -q'
alias grevqf='green -vv -q -f'

# Flask-Migrate
alias fdb='flask db'
alias fdbi='flask db init'
alias fdbr='flask db revision'
alias fdbm='flask db migrate'
alias fdbup='flask db upgrade'
alias fdbdown='flask db downgrade'
alias fdbcurr='flask db current'
alias fdbmerge='flask db merge'

# ZSH Related
mcd() {
  mkdir $1 && cd $1
}

diffy() {
  diff -y $1 $2
}

alias trnom='tree -I node_modules'
alias n='nvim'
alias v='vim'
alias szsh='source .zshrc'
alias rmr='rm -r'
alias ezsh='exec zsh'
alias zipr='zip -r'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/local/bin/activate.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

eval "$(starship init zsh)"
