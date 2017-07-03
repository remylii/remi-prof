# environment
export LANG=ja_JP.UTF-8

# color
autoload -Uz colors
colors

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# prompt
PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
%# "

# words
autoload -Uz select-word-style
select-word-style default

zstyle ':zle:*' word-chras " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

## auto
# for zsh-comletions
fpath=(/usr/local/share/zsh-completions $fpath)
# rustup completions
fpath+=~/.zfunc
# autocomplite
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                 /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*:default' menu select=1
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ps
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# vcs
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

#######################
## option
# japanise
setopt print_eight_bit
# full control
setopt no_flow_control
# comment
setopt interactive_comments
# dir_name -> cd dir_name
setopt auto_cd
# auto pushd
setopt auto_pushd
# dupe dir
setopt pushd_ignore_dups
# history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# wild card
setopt extended_glob
# compinit
setopt auto_list
setopt auto_menu

## key bind
bindkey -v

## aliases
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias vi='vim'
alias vim='vim'

# Application
alias slt='open -a /Applications/Sublime\ Text.app'

# sudo
alias sudo='sudo '

# peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# global

# Copy and Paste
if which pbcopy >/dev/null 2>&1 ; then
    # mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| zsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# retter settings
export EDITOR=vim
export RETTER_HOME=`pwd`/my_letter

## OS
case ${OSTYPE} in
    darwin*)
        # mac
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        # Linux
        alias ls='ls -F --color=auto'
        ;;
esac


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
r
