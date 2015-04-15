#!/bin/bash
for file in `ls -A -I .git -I README.md`; do
    cp --remove-destination ${file} ${HOME}/${file};
done;
