module main

// reverse_string returns a given string in reverse order
fn reverse_string(str string) string {
	mut arr := []byte{cap: str.len}
	for i := str.len - 1; i >= 0; i-- {
		arr << str[i]
	}
	return arr.bytestr()
}