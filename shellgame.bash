#!/bin/bash

###################################
function print_fail()
{
    echo -en ""$RED"FAIL"$RESET"\n"
}
###################################
function print_pass()
{
    echo -en ""$GREEN"PASS"$RESET"\n"
}
###################################
function print_error()
{

}

# Load the configuration file
source config

