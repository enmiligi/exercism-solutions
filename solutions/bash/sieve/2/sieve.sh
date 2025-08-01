#!/usr/bin/env bash

declare -a result sieve

for i in $(seq 2 1 "$1"); do
    sieve[i]=1
done

for i in $(seq 2 1 "$1"); do
    if (( sieve[i] )); then
        result+=("$i")
        
        for n in $(seq $((i * i)) "$i" "$1" ); do
            sieve[n]=0
        done
    fi
done
echo "${result[@]}"