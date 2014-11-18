#!/bin/sh

export rvmsudo_secure_path=0

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

rvm use ruby-1.9.3-p429
