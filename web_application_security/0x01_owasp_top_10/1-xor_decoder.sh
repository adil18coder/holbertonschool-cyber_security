#!/bin/bash

# Arqument olaraq gələn mətndən "{xor}" hissəsini silirik
input=$(echo "$1" | sed 's/{xor}//')

# Base64-dən deşifrə edirik
decoded_base64=$(echo "$input" | base64 -d)

# Hər bir simvolu ASCII '95' (WebSphere standartı) ilə XOR edirik
# Bu hissəni Bash-in daxili imkanları ilə edirik
result=""
for (( i=0; i<${#decoded_base64}; i++ )); do
    char="${decoded_base64:$i:1}"
    # Simvolun ASCII dəyərini tapırıq
    ascii_val=$(printf '%d' "'$char")
    # 95 ilə XOR edirik (XOR operatoru ^)
    xor_val=$(( ascii_val ^ 95 ))
    # Yenidən simvola çeviririk
    result="${result}$(printf "\\$(printf '%03o' "$xor_val")")"
done

echo "$result"
