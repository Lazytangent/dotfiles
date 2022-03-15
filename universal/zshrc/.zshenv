# Pyenv Setup
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"

# Pipenv Setup
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_PYTHON=$PYENV_ROOT/shims/python

# nvm Setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GPG
export GPG_TTY=$(tty)
