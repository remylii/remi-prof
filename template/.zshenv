export PATH=/usr/local/sbin:$PATH # for Homebrew
export PATH=/usr/local/bin:$PATH  # for Homebrew
export PATH=/usr/local/share/npm/bin:$PATH # for npm

# php
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH=/usr/local/sbin:$PATH

# go path
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# rbenv
eval 'eval "$(rbenv init -)"'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# postgresSQL
source $HOME/.postgres/local-env

# rust
export PATH="$HOME/.cargo/bin:$PATH"
