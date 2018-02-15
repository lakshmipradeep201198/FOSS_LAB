#!/bin/bash

echo "Hello,World"
x=$(logname)
echo "Currently logged user and his logname : $x"
echo "Current shell $SHELL"
echo "Current directory $HOME"
echo "architecture computer details $(arch)"
echo "Current path $PATH"
echo "present working directory $(pwd)"
echo "no.of users $(users)"
