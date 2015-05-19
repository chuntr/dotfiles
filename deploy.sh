#!/bin/bash

for x in `ls`; do
    ln -svf $x ${HOME}/$x
done
