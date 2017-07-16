#!/bin/bash
#
# test that simple_shell properly tracks # of commands
# command="/bin/ls"
# tmp_file="checker_tmp_file_$RANDOM"

# clean up
stop_shell

# create a pseudo random file
# touch "$tmp_file"

# run command
cat test_LFT.txt | "$SHELL" > "$OUTPUTFILE" 2> "$ERROROUTPUTFILE" &
cat test_LFT.txt | sh > "$EXPECTED"

# wait a little bit
""$SLEEP"" "$SLEEPSECONDS"

# compare stdout outputs (simple shell vs. real sh)
check_output

# compare stderr outputs (simple shell vs. real sh)
check_error

# clean up
stop_shell
