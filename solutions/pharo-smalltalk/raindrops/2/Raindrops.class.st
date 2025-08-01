Class {
	#name : #Raindrops,
	#superclass : #Object,
	#category : #'Exercise@Raindrops'
}

{ #category : #convertion }
Raindrops >> convertNumber: anInteger [
	^ 	String streamContents: [:stream |
			(anInteger isDivisibleBy: 3) ifTrue: [stream << 'Pling'].
			(anInteger isDivisibleBy: 5) ifTrue: [stream << 'Plang'].
			(anInteger isDivisibleBy: 7) ifTrue: [stream << 'Plong'].
			(stream isEmpty) ifTrue: [stream << anInteger asString].
			].
]
