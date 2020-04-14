#!/usr/bin/env bash

verbose=0

# Accepts one argument: message, a message
# string; and prints the given message iff the
# verbose flag has been set.
function error () {
  local emsg=$1

  echo -e "ERROR ERROR ERROR: $emsg" >&2
  exit 1
}

# Accepts one argument: message, a message
# string; and prints the given message
function notice () {
  local msg=$1

  echo -e "Notice: $msg" >&2
}

# Accepts one argument, $cmd, a bash command
# string, executes the command and returns an
# error message if it fails.
function execute () {
  local cmd=$1
  if [[ $verbose == 1 ]]
  then
    echo -e "Notice: $cmd" >&2
  fi
  eval $cmd
  [ $? == 0 ] || error "An error occured while trying to execute the following command: \"$cmd\"."
}

