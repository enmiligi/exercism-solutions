package pangram

import "unicode"

func IsPangram(input string) bool {
	letterThere := [26]bool{}
	for _, r := range input {
		lowerR := unicode.ToLower(r)
		if lowerR >= 'a' && lowerR <= 'z' {
			letterThere[lowerR-'a'] = true
		}
	}
	for _, b := range letterThere {
		if !b {
			return false
		}
	}
	return true
}
