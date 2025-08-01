Class {
	#name : #Leap,
	#superclass : #Object,
	#category : #'Exercise@Leap'
}

{ #category : #'as yet unclassified' }
Leap >> leapYear: anInteger [
	^ (anInteger isDivisibleBy: 4) & ((anInteger isDivisibleBy: 100) not) | (anInteger isDivisibleBy: 400).
]
