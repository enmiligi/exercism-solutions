module main

// reverse_string returns a given string in reverse order
fn reverse_string(str string) string {
	runes := str.runes()
	mut arr := []rune{cap: runes.len}
	for i := str.len - 1; i >= 0; i-- {
		arr << runes[i]
	}
	return arr.string()
}