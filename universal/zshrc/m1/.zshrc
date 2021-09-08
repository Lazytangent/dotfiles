# Set Antigen for plugins
source $HOME/antigen.zsh
antigen init ~/.antigenrc

# MacOS iTerm Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# MDLoader for Drop CTRL
export PATH="$HOME/Documents/mdloader/build:$PATH"

# Pyenv Setup
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1
then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Pipenv Setup
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_PYTHON=$PYENV_ROOT/shims/python

# Clangd Language Server
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# TexLab Language Server
export PATH="$HOME/Documents/Packages/texlab/target/release:$PATH"

# nvm Setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# M1 Python Setup
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-L/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export RUBY_CFLAGS="-w"

# Go
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/Applications/Emacs.app/Contents/MacOS:$PATH"

# Rust Analyzer
export PATH="$HOME/.local/bin:$PATH"

# Jabba
[ -s "/Users/petermai/.jabba/jabba.sh" ] && source "/Users/petermai/.jabba/jabba.sh"

# JDTLS
export JDTLS_HOME="/Users/petermai/Documents/LSP/jdtls"

# Zathura
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

# FZF
export FZF_DEFAULT_COMMAND='fd --type f'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

# Lite-XL
export PATH="/Applications/lite-xl.app/Contents/MacOS:$PATH"

# Goneovim
export PATH="/Applications/goneovim.app/Contents/MacOS:$PATH"

# Uivonim
export PATH="/Applications/uivonim.app/Contents/MacOS:$PATH"

# Vi-Mode in Terminal
bindkey -v
set -o vi
export EDITOR='nvim'

# Docker Plugin Completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Port in Completions
fpath+=${ZDOTDIR:-~}/.zsh_completions

# Port in Functions
if [ -f ~/.zsh_functions ]; then
  . ~/.zsh_functions
fi

# Port in Aliases
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
