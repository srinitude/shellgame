#!/bin/bash

function print_fail()
{
    echo -en ""$RED"FAIL"$RESET"\n"
}

function print_pass()
{
    echo -en ""$GREEN"PASS"$RESET"\n"
}

function diff_error()
{

}

function diff_output()
{

}

function check_for_prohibited_function()
{

}

function stop_shell()
{

}

function clean_up()
{
    > "$YOUR_OUTPUT" && > "$EXPECTED_OUTPUT" && > "$YOUR_ERROR" && > "$EXPECTED_ERROR" && > "$DIFF"
    rm -f "$HOME"/.simple_shell_history
    rm -f "$LTRACEOUTPUTFILE"
    rm -f checker_tmp_file_*
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
