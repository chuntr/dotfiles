#!/bin/bash
#
# deploy all dotfiles by symlink to checkout dir

for file in `ls -A -I .git -I README.md`; do
    ln -i -s $( pwd )/${file} ${HOME}/${file};
done;
