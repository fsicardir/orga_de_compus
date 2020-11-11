#!/usr/bin/env bash

EXEC=$1
OUT=0

compare() {
    expected_output="$1"
    actual="$2"
    result="OK"
    if [ "$expected_output" != "$actual" ]; then
        result="ERROR: expecting \"$expected_output\" but was \"$actual\"."
        OUT=1
    fi
    echo -n "$result"
}

print_result() {
    printf "%s...\t%s\n" "$1" "$2"
}

test_case() {
    case="$1"
    arguments="$2"
    expected_output="$3"
    actual="$($EXEC $arguments)"
    result="$(compare "$expected_output" "$actual")"
    print_result "$case" "$result"
}

OUT_FILE="$(mktemp)"

test_case_output_file() {
    case="$1"
    arguments="$2"
    expected_output="$3"
    $EXEC $arguments
    actual=$(<$OUT_FILE)
    result="$(compare "$expected_output" "$actual")"
    print_result "$case" "$result"
}

test_case_error() {
    case="$1"
    arguments="$2"
    expected_output="$3"
    $EXEC $arguments 2>$OUT_FILE >/dev/null
    actual=$(<$OUT_FILE)
    result="$(compare "$expected_output" "$actual")"
    print_result "$case" "$result"

}

EXPECTED_BASIC="5
10"
test_case 'basic usage: 5, 10' '5 10' "$EXPECTED_BASIC"

EXPECTED_BASIC="1
1437634"
test_case 'basic usage: 1111, 1294' '1111 1294' "$EXPECTED_BASIC"

EXPECTED_BASIC="64
768"
test_case 'basic usage: 256, 192' '256 192' "$EXPECTED_BASIC"

test_case 'only mcm with -m flag' '-m 256 192' '768'
test_case 'only mcm with --multiple flag' '--multiple 256 192' '768'

test_case 'only mcd with -d flag' '-d 256 192' '64'
test_case 'only mcd with --divisor flag' '--divisor 256 192' '64'

test_case 'show version with -V flag' '-V' 'v0.1.0'
test_case 'show version with --version flag' '--version' 'v0.1.0'

EXPECTED_USAGE="Usage:
   common -h
   common -V
   common [options] M N
Options:
   -h, --help Prints usage information.
   -V, --version Prints version information.
   -o, --output Path to output file.
   -d, --divisor Just the divisor.
   -m, --multiple Just the multiple.
Examples:
   common -o - 256 192"
test_case 'show help with -h flag' '-h' "$EXPECTED_USAGE"
test_case 'show help with --help flag' '--help' "$EXPECTED_USAGE"

test_case_output_file 'result in output file with -o flag' "-o $OUT_FILE 256 192" "$EXPECTED_BASIC"

test_case_output_file 'result in output file with --output flag' "--output $OUT_FILE 256 192" "$EXPECTED_BASIC"

test_case 'result in stdout with -o -' "-o - 256 192" "$EXPECTED_BASIC"

test_case 'result in stdout with --output -' "--output - 256 192" "$EXPECTED_BASIC"

test_case_error 'error opening file to write' "-o /tmp 123 456" "Error: could not write to file '/tmp'."

test_case_error 'error not providing arguments' '' "Error: expected two numbers after options."

test_case_error 'error providing only one argument' '123' "Error: expected two numbers after options."

INT_MAX=$(grep "define INT_MAX" /usr/include/limits.h | cut -f2)
test_case_error 'error when argument is not a number' '123 asd' "Error: arguments should be numbers between 2 and $INT_MAX."

test_case_error 'error when argument is negative' '123 "-2"' "Error: arguments should be numbers between 2 and $INT_MAX."

test_case_error 'error when argument is zero' '0 123' "Error: arguments should be numbers between 2 and $INT_MAX."

test_case_error 'error when argument is one' '1 123' "Error: arguments should be numbers between 2 and $INT_MAX."

test_case_error "error when argument is greater than $INT_MAX" "123 $(($INT_MAX + 5))" "Error: arguments should be numbers between 2 and $INT_MAX."

EXPECTED_MAX="1
$(($INT_MAX * 2))"
test_case "can calculate results bigger than $INT_MAX if there is no overflow" "$INT_MAX 2" "$EXPECTED_MAX"

test_case_error "error when calcualtion overflows an unsigned int" "$INT_MAX $(($INT_MAX - 1))" "Error: calculation produces overflow."

rm $OUT_FILE

exit $OUT
