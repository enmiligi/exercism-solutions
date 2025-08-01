Class {
	#name : #Leap,
	#superclass : #Object,
	#category : #'Exercise@Leap'
}

{ #category : #'as yet unclassified' }
Leap >> leapYear: anInteger [
	^ (anInteger isDivisibleBy: 4) and: [(anInteger isDivisibleBy: 100) not or: [anInteger isDivisibleBy: 400]].
]
