#!/bin/zsh

for file in **/*.trc(N); do
  sed -i '' "1s/.*/$(basename "$file")/" "$file"
done