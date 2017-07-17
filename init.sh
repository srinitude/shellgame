#!/bin/bash

USER_REPO="$1"_simple_shell

# Change working directory to user root
cd

# Clone your simple shell repo
git clone https://github.com/"$1"/simple_shell $USER_REPO

# Create your executable
gcc -Wall -Werror -Wextra -pedantic $USER_REPO/*.c -o hsh

# Move executable, README, man page, and AUTHORS into the test suite
cp $USER_REPO/man_1_simple_shell shellgame/man_1_simple_shell_copy
cp $USER_REPO/README.md shellgame/SHELL-README.md
cp $USER_REPO/AUTHORS shellgame/SHELL-AUTHORS
mv hsh shellgame

# Remove unneeded source code
rm -rf $USER_REPO

# Change your working directory to the test suite
cd shellgame

# Run the test suite
./shellgame.bash

# Cleanup
rm man_1_simple_shell_copy SHELL-README.md SHELL-AUTHORS hsh
