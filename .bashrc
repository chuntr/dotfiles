# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend

export TERM=xterm-color
# set terminal type from broken OS X client
echo $SSH_CLIENT | grep ^172.16.20.222
if (($? == 0)); then
    export TERM=linux;
    echo "Terminal type corrected";
fi

export EDITOR=`which vim`
export LESS=' -R '
if [ -f "/usr/share/source-highlight/src-hilite-lesspipe.sh" ]; then
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
fi

# OS X - better ls colors
export LSCOLORS=ExFxBxDxCxegedabagacad

# OS X 10.8 and newer come with php-fpm pre-installed,
# to ensure you are using the brew version you need to make
# sure /usr/local/sbin is before /usr/sbin in your PATH:

PATH="/usr/local/sbin:$PATH"

# we also want our (brew) versions of php, etc
if [ -d "/usr/local/bin" ] ; then
    PATH="/usr/local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# BFG specific path
if [ -d "/usr/local/release" ] ; then
    PATH="$PATH:/usr/local/release:"
fi

# BFG specific envs
export LOGLEVEL=DEBUG
export SVN_HOME=/svn/it

# regular-old envs
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"


# shell customizations and functions
if [ -f ~/.bash_prompt ]; then
    source $HOME/.bash_prompt
fi

# custom aliases
if [ -f ~/.aliases ]; then
    source $HOME/.aliases
fi

# custom aliases
if [ -f ~/.work_aliases ]; then
    source $HOME/.work_aliases
fi

# fancy svn output
if [ -f ~/.svn_functions ]; then
    source $HOME/.svn_functions
fi

# fancy log parse aliases
if [ -f ~/.log_parse_functions ]; then
    source $HOME/.log_parse_functions
fi
