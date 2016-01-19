# things i just can't deal without:
alias ls='ls --color=auto --group-directories-first'
alias l='ls -la'
alias grep='grep --color=auto'
alias env='env | sort'
alias exdiff='svn diff | grep "^\-\|\+" | grep -v \@\@'
alias python='python -tt'

# sort ps output for java processes into something readable
alias jgrep="grep java | sed -e 's| \-|\n\-|g' "

# better/faster svn diff (doesn't show all the bs, good for verifying multiple one-line changes):
alias exdiff='svn diff | grep "^\-\|\+" | grep -v \@\@'

# quick tidy for xml
alias tidyxml='tidy -utf8 -xml -i --indent-spaces 4 -w 255 -q -m'
