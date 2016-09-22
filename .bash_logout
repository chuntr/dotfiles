# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console, nuke it from orbit. it's the only way to be sure:
# 1. clear the screen to increase privacy
# 2. remove shell history
if [ "$GAME_OVER_MAN" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    [ -x $HOME/.bash_history ] && rm -f $HOME/.bash_history
    [ -x $HOME/.history ] && rm -f $HOME/.history
fi
