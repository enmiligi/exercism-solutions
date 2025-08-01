module main

fn collatz(number int) !int {
	if number < 1 {
		return error('number must be greater than 0')
	}
	mut num := number
	mut steps := 0
	for num > 1 {
		if num & 1 == 0 {
			num = num / 2
		} else {
			num = 3 * num + 1
		}
		steps += 1
	}
	return steps
}
