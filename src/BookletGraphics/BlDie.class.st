Class {
	#name : #BlDie,
	#superclass : #Object,
	#instVars : [
		'faces',
		'dieValue',
		'isStopped',
		'width',
		'height'
	],
	#category : #'BookletGraphics-Bloc'
}

{ #category : #accessing }
BlDie >> dieValue: aNumber [

	((aNumber isInteger and: [ aNumber > 0 ]) and: [ aNumber <= faces ])
		ifFalse: [ ^ self ].
	dieValue := aNumber.
	self changed
]

{ #category : #drawing }
BlDie >> drawDie [

	| die |
	die := BlElement new
		       size: (self width) @ (self height);
		       geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		       border: (BlBorder paint: Color black width: 2);
		       background: Color green.

	(self perform: ('face' , dieValue asString) asSymbol) do: [ :aPoint |
		self drawPointAt: aPoint on: die ].

	^ die
]

{ #category : #drawing }
BlDie >> drawPointAt: aPoint on: aDie [

	| element  x y|

	x := (aDie extent) / 6.
	y := (aDie extent)  / 6.

	element := BlElement new
		           geometry: BlCircleGeometry new;
		           size: x @ y ;
		           background: Color black;
		           position: aDie position + (aDie extent * aPoint).
	aDie addChild: element.
]

{ #category : #geometry }
BlDie >> face1 [

	^ { (0.5 @ 0.5) }
]

{ #category : #geometry }
BlDie >> face2 [

	^ {
		  (0.25 @ 0.25).
		  (0.75 @ 0.75) }
]

{ #category : #geometry }
BlDie >> face3 [

	^ {
		  (0.25 @ 0.25).
		  (0.75 @ 0.75).
		  (0.5 @ 0.5) }
]

{ #category : #geometry }
BlDie >> face4 [

	^ {
		  (0.25 @ 0.25).
		  (0.75 @ 0.25).
		  (0.75 @ 0.75).
		  (0.25 @ 0.75) }
]

{ #category : #geometry }
BlDie >> face5 [

	^ {
		  (0.25 @ 0.25).
		  (0.75 @ 0.25).
		  (0.75 @ 0.75).
		  (0.25 @ 0.75).
		(0.5) @ 0.5 }
]

{ #category : #geometry }
BlDie >> face6 [

	^ {
		  (0.25 @ 0.25).
		  (0.75 @ 0.25).
		  (0.75 @ 0.75).
		  (0.25 @ 0.75).
		  (0.25 @ 0.5).
		  (0.75 @ 0.5) } 
]

{ #category : #geometry }
BlDie >> face7 [

	^ {
		  (0.25 @ 0.25).
		  (0.75 @ 0.25).
		  (0.75 @ 0.75).
		  (0.25 @ 0.75).
		  (0.25 @ 0.5).
		  (0.75 @ 0.5).
		  (0.5 @ 0.5) }
]

{ #category : #geometry }
BlDie >> face8 [

	^ {
		  (0.25 @ 0.25).
		  (0.75 @ 0.25).
		  (0.75 @ 0.75).
		  (0.25 @ 0.75).
		  (0.25 @ 0.5).
		  (0.75 @ 0.5).
		  (0.5 @ 0.5).
		0.5@0.25 }
]

{ #category : #geometry }
BlDie >> face9 [

	^ {
		  (0.25 @ 0.25).
		  (0.75 @ 0.25).
		  (0.75 @ 0.75).
		  (0.25 @ 0.75).
		  (0.25 @ 0.5).
		  (0.75 @ 0.5).
		  (0.5 @ 0.5).
		  (0.5 @ 0.25).
		  (0.5 @ 0.75) }
]

{ #category : #accessing }
BlDie >> faces: aNumber [
	" Set the number of faces"

	((aNumber isInteger and: [ aNumber > 0 ]) and: [ aNumber <= 9 ])
		ifTrue: [ faces := aNumber ]
]

{ #category : #'api - bounds' }
BlDie >> height [

	^ 50
]

{ #category : #initialization }
BlDie >> initialize [

	super initialize.

	dieValue := 6.
	faces := 6.
	isStopped := false
]

{ #category : #'instance creation' }
BlDie >> open [
	<script: 'self new drawDie openInNewSpace'>
]

{ #category : #'api - bounds' }
BlDie >> width [

	^ 50
]
