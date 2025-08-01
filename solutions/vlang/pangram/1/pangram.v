module main

fn is_pangram(phrase string) bool {
	runes := phrase.to_lower().runes()
	for c in `a`..`z` {
		if c !in runes {
			return false
		}
	}
	return true
}