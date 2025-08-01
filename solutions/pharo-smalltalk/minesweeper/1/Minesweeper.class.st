Class {
	#name : #Minesweeper,
	#superclass : #Object,
	#category : #'Exercise@Minesweeper'
}

{ #category : #'as yet unclassified' }
Minesweeper >> annotate: anArray2D row: row column: column [
	"annotates a coordinate within the Array2D"
	"if it is already a bomb it stays marked as one"
	"if the sum is zero it stays blank"
	"else convert the sum to a character"
	| sum |
	^ (anArray2D at: row at: column) = 1 ifTrue: [ $* ] ifFalse: [
		sum := self sumWindow: anArray2D row: row column: column.
		(sum = 0) ifTrue: [ Character space ] ifFalse: [ sum asCharacterDigit ]
	]
]

{ #category : #'as yet unclassified' }
Minesweeper >> annotateMinefield: aCollection [
	| array2D |
	array2D := self toArray2D: aCollection.
	array2D := array2D indicesCollect: [ :row :column | self annotate: array2D row: row column: column ].
	^ (1 to: array2D rowCount) collect: [ :row |
		String newFrom: (array2D atRow: row)
	]
]

{ #category : #'as yet unclassified' }
Minesweeper >> columns: aCollection [
	^ aCollection inject: 0 into: [ :acc :row | acc max: row size ]
]

{ #category : #'as yet unclassified' }
Minesweeper >> rows: aCollection [
	^ aCollection size
]

{ #category : #'as yet unclassified' }
Minesweeper >> sumWindow: anArray2D row: row column: column [
	"Generates a 3x3 matrix around the coordinates given summing it up"
	"This method is used since this 3x3 window contains all the neighbours."
	^ (anArray2D atRows: row - 1 to: row + 1 columns: column - 1  to: column + 1 ifInvalid: 0) sum
]

{ #category : #'as yet unclassified' }
Minesweeper >> toArray2D: aCollection [
	"convert the array of rows into a 2D array of 0s and 1s"
	^ Array2D rows: (self rows: aCollection) columns: (self columns: aCollection) contents:
		(self toArray: aCollection)
]

{ #category : #'as yet unclassified' }
Minesweeper >> toArray: aCollection [
	"convert the array of rows into a flat array of 0s and 1s"
	^ aCollection flatCollect: [ :row | 
		row asArray collect: [ :char | (char = $*) asInteger  ]
	]
]
