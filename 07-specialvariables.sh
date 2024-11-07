#!/bin/bash

echo "All variables passed to the script: $@"

echo "Number of variables passed : $#"

echo "Script name is : $0"

echo "Present current working directory is : $PWD"

echo "Home directory of the current user is: $HOME"

echo "PID of the script executing now : $$"

sleep 100$

echo "PID of the last background command: $!"
