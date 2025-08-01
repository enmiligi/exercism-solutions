package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(text string) FreqMap {
	frequencies := FreqMap{}
	for _, r := range text {
		frequencies[r]++
	}
	return frequencies
}

// ConcurrentFrequency counts the frequency of each rune in the given strings,
// by making use of concurrency.
func ConcurrentFrequency(texts []string) FreqMap {
    var frequencies chan FreqMap = make(chan FreqMap)
	for _, s := range texts {
        go func(s string) {
            frequencies <- Frequency(s)
        }(s)
    }
    result := FreqMap{}
    for range texts {
        freqMap := <- frequencies
        for k, v := range freqMap {
            result[k] += v
        }
    }
    return result
}
