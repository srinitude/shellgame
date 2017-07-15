#!/bin/bash

function print_fail()
{
    echo -en ""$RED"FAIL"$RESET"\n"
}

function print_pass()
{
    echo -en ""$GREEN"PASS"$RESET"\n"
}

function check_output()
{
    diff_output
    print_diff $OUTPUT_DIFF
}

function diff_output()
{
    diff "$YOUR_OUTPUT" "$EXPECTED_OUTPUT" > "$OUTPUT_DIFF"
}

function check_error()
{
    diff_error
    print_diff $ERROR_DIFF
}

function diff_error()
{
    diff "$YOUR_ERROR" "$EXPECTED_ERROR" > "$ERROR_DIFF"
}

function print_diff()
{
    if [ $1 == $OUTPUT_DIFF ]; then
	if [ -s $1 ]; then
	    print_fail
	    echo "The output between your shell and 'sh' differ"
	    cat "$DIFF"
	else
	    print_pass
	fi
    elif [ $1 == $ERROR_DIFF ]; then
	if [ -s $1 ]; then
	    print_fail
	    echo "The errors between your shell and 'sh' differ"
	    cat "$DIFF"
	else
	    print_pass
    else
	echo -n "What are you diffing dude?\n"
    fi
}

function check_for_prohibited_function()
{

}

function clean_up()
{
    > "$YOUR_OUTPUT" && > "$EXPECTED_OUTPUT"
    > "$YOUR_ERROR" && > "$EXPECTED_ERROR"
    > "$OUTPUT_DIFF" && > "$ERROR_DIFF"
    rm -f "$HOME"/.simple_shell_history
    rm -f "$LTRACEOUTPUTFILE"
    rm -f checker_tmp_file_*
}

function stop_shell()
{
    if [ $(pidof "$SHELL" | wc -l) -gt 0]; then
	source "$dir$testname"
    fi
    clean_up
}

function launch_tests()
{
    for dir in $(ls -d "$TESTDIR"/*/)
    do
	for testname in $(ls "$dir" | grep -v "~$")
	do
	    cat "${dir}${testname}" | head -3 | tail -1
	    echo -n "test -> $testname: "
	    source "$dir$testname"
	done
    done
}


source config

clean_up
launch_tests
clean_up
