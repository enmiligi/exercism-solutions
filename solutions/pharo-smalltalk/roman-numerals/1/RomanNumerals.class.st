Class {
	#name : #RomanNumerals,
	#superclass : #Object,
	#category : #'Exercise@RomanNumerals'
}

{ #category : #'class variables' }
RomanNumerals class >> numerals [
	^ {1000 -> 'M'.
		900 -> 'CM'.
		500 -> 'D'.
		400 -> 'CD'.
		100 -> 'C'.
		90 -> 'XC'.
		50 -> 'L'.
		40 -> 'XL'.
		10 -> 'X'.
		9 -> 'IX'.
		5 -> 'V'.
		4 -> 'IV'.
		1 -> 'I'} asOrderedDictionary
]

{ #category : #convertion }
RomanNumerals >> romanNumber: anInteger [
	| newInteger output |
	output := ''.
	newInteger := anInteger.
	self class numerals associationsDo: [:pair | [newInteger  >= pair key] whileTrue: [newInteger := newInteger - pair key. output := output, pair value]].
	^ output.
]
