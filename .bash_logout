# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console:
# 1. clear the screen to increase privacy
# 2. remove shell history
if [ "$LEAVE_NO_TRACE" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    rm -r $HOME/.bash_history
fi
