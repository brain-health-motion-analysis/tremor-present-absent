#!/bin/zsh
find . -name '*.trc' -exec awk 'NR==1 {print FILENAME ": " $0}' {} \;
