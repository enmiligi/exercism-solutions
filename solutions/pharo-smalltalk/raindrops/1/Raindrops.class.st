Class {
	#name : #Raindrops,
	#superclass : #Object,
	#category : #'Exercise@Raindrops'
}

{ #category : #convertion }
Raindrops >> convertNumber: anInteger [ 
	| output |
	output := ''.
	(anInteger isDivisibleBy: 3) ifTrue: [output := output, 'Pling' ].
	(anInteger isDivisibleBy: 5) ifTrue: [output := output, 'Plang' ].
	(anInteger isDivisibleBy: 7) ifTrue: [output := output, 'Plong'].
	(output isEmpty) ifTrue: [output := anInteger asString].
	^ output.
]
