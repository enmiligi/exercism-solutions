#!/usr/bin/env bash

result=()
sieve=()

for i in $(seq 2 1 "$1"); do
    if ! [[ ${sieve[*]} =~ (^|[[:space:]])$i($|[[:space:]]) ]]; then
        result+=("$i")
        
        for n in $(seq $(($i * $i)) "$i" "$1" ); do
            sieve+=("$n")
        done
    fi
done
echo "${result[@]}"