module main

import math { sqrt }
import maps { filter }

fn sieve(limit int) []int {
	mut numbers := map[int]bool{}
	for i in 2 .. limit + 1 {
		numbers[i] = true
	}
	max := int(sqrt(limit))
	for i in 2 .. (max + 1) {
		if numbers[i] {
			for j := i * 2; j <= limit; j += i {
				numbers[j] = false
			}
		}
	}
	return filter(numbers, fn (key int, val bool) bool {
		return val
	}).keys()
}
