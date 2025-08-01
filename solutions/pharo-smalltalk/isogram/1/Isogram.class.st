Class {
	#name : #Isogram,
	#superclass : #Object,
	#category : #'Exercise@Isogram'
}

{ #category : #testing }
Isogram >> isIsogramPhrase: aString [
	| lowerLetters deduplicated |
	lowerLetters := aString asLowercase select: [:char | char isLetter].
	deduplicated  := String streamContents: [ :stream | lowerLetters asSet do: [ :each | stream nextPutAll: each asString ] ].
	deduplicated sort.
	^ deduplicated = lowerLetters sorted.
]
