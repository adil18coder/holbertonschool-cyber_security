#!/bin/bash

# "{xor}" prefiksini silirik
input=$(echo "$1" | sed 's/{xor}//')

# Perl istifadə edərək null byte problemini həll edirik və 95 ilə XOR edirik
echo "$input" | base64 -d | perl -pe 's/(.)/chr(ord($1) ^ 95)/ge'
