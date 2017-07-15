#!/bin/bash

USER_REPO="$1"_simple_shell

# Change working directory to user root
cd

# Clone your simple shell repo
git clone https://github.com/"$1"/simple_shell $USER_REPO

# Create your executable
gcc -Wall -Werror -Wextra -pedantic $USER_REPO/*.c -o hsh

# Move executable, README, man page, and AUTHORS into the test suite
cp man_1_simple_shell man_1_simple_shell_copy
cp README.md SHELL-README.md
cp AUTHORS SHELL-AUTHORS
mv hsh SHELL-README.md man_1_simple_shell_copy SHELL-AUTHORS shellgame

# Remove unneeded source code
rm -rf $USER_REPO

# Change your working directory to the test suite
cd shellgame

# Run the test suite
./shellgame.bash
