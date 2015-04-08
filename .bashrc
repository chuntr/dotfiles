export TERM=xterm-color
# set terminal type from broken OS X client
echo $SSH_CLIENT | grep ^172.16.20.222
if (($? == 0)); then
    export TERM=linux;
    echo "Terminal type corrected";
fi

export EDITOR=/usr/bin/vim
export LESS=' -R '
if [ -f "/usr/share/source-highlight/src-hilite-lesspipe.sh" ]; then
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export LOGLEVEL=DEBUG
export SVN_HOME=/svn/it
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

# shell customizations and functions
source $HOME/.bash_prompt
source $HOME/.alias
source $HOME/.svn_functions
