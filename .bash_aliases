alias d-prod='cd /svn/it/scripts/exports/prod && svn update'
alias d-qast='cd /svn/it/scripts/exports/qast && svn update'
alias d-trunk='cd /svn/it/scripts/exports/trunk && svn update'
alias ls='ls --color=auto --group-directories-first'
alias l='ls -la'
alias grep='grep --color=auto'
alias env='env | sort'
alias exdiff='svn diff | grep "^\-\|\+" | grep -v \@\@'
alias python='python -tt'
alias tidyxml='tidy -utf8 -xml -i --indent-spaces 4 -w 255 -q -m'
alias tools='cd /svn/it/scripts/exports/trunk'
alias work='cd /usr/local/release'

if [[ $HOSTNAME =~ \.qast ]]; then
    alias externals='cd /usr/local/release/svn/configs/externals/trunk; svn up'
    alias manifest='cd /usr/local/release/svn/configs/manifest/dgb/st; svn up'
    alias vhost='cd /usr/local/release/svn/configs/vhosts/branches/releases/st_release; svn up'
elif [[ $HOSTNAME =~ \.(sea|ash) ]]; then
    alias externals='cd /usr/local/release/svn/configs/externals/branches/releases/prod; svn up'
    alias manifest='cd /usr/local/release/svn/configs/manifest/dgb/prod; svn up'
    alias vhost='cd /usr/local/release/svn/configs/vhosts/branches/releases/prod_release; svn up'
fi

function xq {
    xpath -e "//name[text()=\"${3}\"]/..//*" /etc/bfg/envs/${1}/${2}/config.xml 2>/dev/null
}

