Class {
	#name : #Isogram,
	#superclass : #Object,
	#category : #'Exercise@Isogram'
}

{ #category : #testing }
Isogram >> isIsogramPhrase: aString [
	| lowerLetters |
	lowerLetters := aString asLowercase onlyLetters.
	^ lowerLetters asSet size = lowerLetters size.
]
