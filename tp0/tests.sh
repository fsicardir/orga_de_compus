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
    input="$2"
    expected_output="$3"
    flags="$4"
    actual=$(echo -n $input | $EXEC $flags)
    result=$(compare "$expected_output" "$actual")
    print_result "$case" "$result"
}

test_case 'basic encoding example' 'hola' 'aG9sYQ=='

test_case 'basic decoding example' 'aG9sYQ==' 'hola' '-d'

test_case 'basic decoding with --decode flag' 'aG9sYQ==' 'hola' '--decode'

test_case 'print version with -V' '' 'v0.1.0' '-V'
test_case 'print version with --version' '' 'v0.1.0' '--version'

help_msg="Usage:
   tp0 -h
   tp0 -V
   tp0 [options]
Options:
   -V, --version Print version and quit.
   -h, --help Print this information.
   -o, --output Path to the output file.
   -i, --input Path to the input file.
   -d, --Decode a base64-encoded file.
Examples:
   tp0 -i input.txt -o output.txt"
test_case 'print help message with -h' '' "$help_msg" '-h'
test_case 'print help message with --help' '' "$help_msg" '--help'

test_case 'encode string that requires no padding' 'any carnal pleasur' 'YW55IGNhcm5hbCBwbGVhc3Vy'

test_case 'decode string with no padding' 'YW55IGNhcm5hbCBwbGVhc3Vy' 'any carnal pleasur' '-d'

test_case 'encode string that requires one padding character' 'any carnal pleasure.' 'YW55IGNhcm5hbCBwbGVhc3VyZS4='

test_case 'decode string with one padding character' 'YW55IGNhcm5hbCBwbGVhc3VyZS4=' 'any carnal pleasure.' '-d'

test_case 'encode string that requires two padding characters' 'any carnal pleasure' 'YW55IGNhcm5hbCBwbGVhc3VyZQ=='

test_case 'decode string with two padding characters' 'YW55IGNhcm5hbCBwbGVhc3VyZQ==' 'any carnal pleasure' '-d'

long_msg="Nos los representantes del pueblo de la Nación Argentina, reunidos en Congreso General Constituyente por voluntad y elección de las provincias que la componen, en cumplimiento de pactos preexistentes, con el objeto de constituir la unión nacional, afianzar la justicia, consolidar la paz interior, proveer a la defensa común, promover el bienestar general, y asegurar los beneficios de la libertad, para nosotros, para nuestra posteridad, y para todos los hombres del mundo que quieran habitar en el suelo argentino: invocando la protección de Dios, fuente de toda razón y justicia: ordenamos, decretamos y establecemos esta Constitución, para la Nación Argentina."
long_msg_encoded="Tm9zIGxvcyByZXByZXNlbnRhbnRlcyBkZWwgcHVlYmxvIGRlIGxhIE5hY2nDs24gQXJnZW50aW5hLCByZXVuaWRvcyBlbiBDb25ncmVzbyBHZW5lcmFsIENvbnN0aXR1eWVudGUgcG9yIHZvbHVudGFkIHkgZWxlY2Npw7NuIGRlIGxhcyBwcm92aW5jaWFzIHF1ZSBsYSBjb21wb25lbiwgZW4gY3VtcGxpbWllbnRvIGRlIHBhY3RvcyBwcmVleGlzdGVudGVzLCBjb24gZWwgb2JqZXRvIGRlIGNvbnN0aXR1aXIgbGEgdW5pw7NuIG5hY2lvbmFsLCBhZmlhbnphciBsYSBqdXN0aWNpYSwgY29uc29saWRhciBsYSBwYXogaW50ZXJpb3IsIHByb3ZlZXIgYSBsYSBkZWZlbnNhIGNvbcO6biwgcHJvbW92ZXIgZWwgYmllbmVzdGFyIGdlbmVyYWwsIHkgYXNlZ3VyYXIgbG9zIGJlbmVmaWNpb3MgZGUgbGEgbGliZXJ0YWQsIHBhcmEgbm9zb3Ryb3MsIHBhcmEgbnVlc3RyYSBwb3N0ZXJpZGFkLCB5IHBhcmEgdG9kb3MgbG9zIGhvbWJyZXMgZGVsIG11bmRvIHF1ZSBxdWllcmFuIGhhYml0YXIgZW4gZWwgc3VlbG8gYXJnZW50aW5vOiBpbnZvY2FuZG8gbGEgcHJvdGVjY2nDs24gZGUgRGlvcywgZnVlbnRlIGRlIHRvZGEgcmF6w7NuIHkganVzdGljaWE6IG9yZGVuYW1vcywgZGVjcmV0YW1vcyB5IGVzdGFibGVjZW1vcyBlc3RhIENvbnN0aXR1Y2nDs24sIHBhcmEgbGEgTmFjacOzbiBBcmdlbnRpbmEu"
test_case 'encode long text' "$long_msg" "$long_msg_encoded"
test_case 'decode long text' "$long_msg_encoded" "$long_msg" '-d'

filename="$(mktemp)"
echo -n "$long_msg" > "$filename"
test_case 'encode text from file using -i' '' "$long_msg_encoded" "-i $filename"
test_case 'encode text from file using --input' '' "$long_msg_encoded" "--input $filename"

echo -n "$long_msg_encoded" > "$filename"
test_case 'decode text from file using -i' '' "$long_msg" "-d -i $filename"
test_case 'decode text from file using --input' '' "$long_msg" "-d --input $filename"

echo -n "$long_msg" | $EXEC -o "$filename"
output=$(<$filename)
result=$(compare "$output" "$long_msg_encoded")
print_result 'encode text to file using -o' "$result"

echo -n "$long_msg" | $EXEC --output "$filename"
output=$(<$filename)
result=$(compare "$output" "$long_msg_encoded")
print_result 'encode text to file using --output' "$result"

echo -n "$long_msg_encoded" | $EXEC -d -o "$filename"
output=$(<$filename)
result=$(compare "$output" "$long_msg")
print_result 'decode text to file using -o' "$result"

echo -n "$long_msg_encoded" | $EXEC -d --output "$filename"
output=$(<$filename)
result=$(compare "$output" "$long_msg")
print_result 'decode text to file using --output' "$result"

rm "$filename"

exit $OUT
