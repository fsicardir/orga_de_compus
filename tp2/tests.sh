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
EXPECTED_TEST_1="miss
miss
miss
miss
255 miss
254 miss
248 miss
96 miss
100"

test_case 'Test case 1' '-b128 -c16 -w1 ./assets/prueba1.mem' "$EXPECTED_TEST_1"

EXPECTED_TEST_2="miss
miss
miss
miss
miss
123 hit
234 hit
33 hit
44 hit
55 hit
50"

test_case 'Test case 2' '-b128 -c16 -w1 ./assets/prueba2.mem' "$EXPECTED_TEST_2"

EXPECTED_TEST_3="miss
miss
miss
miss
255 hit
254 hit
248 hit
96 hit
50"

test_case 'Test case 3' '-b32 -c4 -w4 ./assets/prueba1.mem' "$EXPECTED_TEST_3"

EXPECTED_TEST_4="miss
miss
miss
miss
miss
123 miss
234 miss
33 miss
44 miss
55 miss
100"

test_case 'Test case 4' '-b32 -c4 -w4 ./assets/prueba2.mem' "$EXPECTED_TEST_4"

test_case 'Show version with -V flag' '-V' 'v0.1.0'
test_case 'Show version with --version flag' '--version' 'v0.1.0'

EXPECTED_USAGE="Usage:
   tp2 -h
   tp2 -V
   tp2 [options] archivo
Options:
   -h, --help	Imprime ayuda.
   -V, --version	Versión del programa.
   -o, --output	Archivo de salida.
   -w, --ways	Cantidad de vías.
   -c, --cachesize	Tamaño del caché en kilobytes.
   -b, --blocksize	Tamaño del bloque en bytes.
Examples:
   tp2 -w 4 -c 8 -b 16 assets/prueba1.mem"

test_case 'Show help with -h flag' '-h' "$EXPECTED_USAGE"
test_case 'Show help with --help flag' '--help' "$EXPECTED_USAGE"

test_case_error 'Error not providing ways' "-b128 -c16" "Error: missing mandatory option."

test_case_error 'Error not providing cache size' "-w1 -b16" "Error: missing mandatory option."

test_case_error 'Error not providing block size' "-w1 -c16" "Error: missing mandatory option."

test_case_error 'Error when block size is not a power of two' '-b19 -c16 -w1 ./assets/prueba1.mem' "Error: cache and block sizes should be powers of two."

test_case_error 'Error when cache size is not a power of two' '-b128 -c17 -w1 ./assets/prueba1.mem' "Error: cache and block sizes should be powers of two."

test_case_error 'Error opening file to write' "-b128 -c16 -w1 -o /tmp ./assets/prueba1.mem" "Error: could not write to file '/tmp'."

test_case_error 'Error not providing input file' '-b128 -c16 -w1' "Error: expected file after options."

INT_MAX=$(grep "define INT_MAX" /usr/include/limits.h | cut -f2)
test_case_error 'Error when option is not a number' '-b128 -c16 -wasd ./assets/prueba1.mem' "Error: arguments should be numbers between 1 and $INT_MAX."

test_case_error "Error when argument is greater than $INT_MAX" "-b128 -c16 -w$(($INT_MAX + 5)) ./assets/prueba1.mem" "Error: arguments should be numbers between 1 and $INT_MAX."

exit $OUT
