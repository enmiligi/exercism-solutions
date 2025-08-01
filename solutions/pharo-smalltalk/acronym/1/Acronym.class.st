Class {
	#name : #Acronym,
	#superclass : #Object,
	#category : #'Exercise@Acronym'
}

{ #category : #'as yet unclassified' }
Acronym >> abbreviatePhrase: aString [ 
	^ 
		(aString splitOn: '[ \-_]+' asRegex)
			inject: '' into: [:string :word | string, (word at: 1) asString asUppercase].
]
