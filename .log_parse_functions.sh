#!/bin/bash

# $1 - site name/seach term
# $2 - filename
alias blog="grep $1 local3.2016-01-21 | tail -20 | sed -re 's/(.*)( \"Mozilla.*)/\1/' | grep httperror"
