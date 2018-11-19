#!/bin/bash

SALT_HOME=${HOME}/salt/base/common/configs/homes/files/chunter/

function copy_to_salt {
    cp -r ${1} ${SALT_HOME}
}


copy_to_salt .bash-git-prompt/
copy_to_salt bin
copy_to_salt .ssh
copy_to_salt .aliases
copy_to_salt .bash_logout
copy_to_salt .bash_profile
copy_to_salt .bashrc
copy_to_salt .git-completion.bash
copy_to_salt .log_parse_functions
copy_to_salt .pylintrc
copy_to_salt .svn_functions
copy_to_salt .vimrc
copy_to_salt .work_aliases
