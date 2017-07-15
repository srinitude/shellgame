#!/bin/bash

USER_REPO="$1"_simple_shell

# Change working directory to user root
cd

# Clone your simple shell repo
git clone https://github.com/"$1"/simple_shell $USER_REPO

# Create your executable
gcc -Wall -Werror -Wextra -pedantic $USER_REPO/*.c -o hsh

# Remove unneeded source code
rm -rf $USER_REPO

# Move executable, README, man page, and AUTHORS into the test suite
mv hsh README.md man_1_simple_shell AUTHORS shellgame

# Change your working directory to the test suite
cd shellgame

# Run the test suite
./shellgame.bash
