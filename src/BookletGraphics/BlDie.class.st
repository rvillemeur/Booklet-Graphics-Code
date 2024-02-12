Class {
	#name : #BlDie,
	#superclass : #Object,
	#instVars : [
		'faces',
		'dieValue',
		'isStopped',
		'extent'
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
		       size: extent;
		       geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		       border: (BlBorder paint: Color black width: 2);
		       background:  ((BlLinearGradientPaint direction: 1 @ 1)
						    		matchExtent: extent;
						   		   from: Color green to: Color lightGreen ).

	"die forceLayout."
	(self perform: ('face' , dieValue asString) asSymbol) do: [ :aPoint |
		self drawPointAt: aPoint on: die ].

	^ die
]

{ #category : #drawing }
BlDie >> drawPointAt: aPoint on: aDie [

	| element  x y|

	x := extent / 6.
	y := extent  / 6.

	element := BlElement new
		           geometry: BlCircleGeometry new;
		           size: x @ y ;
		           background: Color black;
		           position: aDie position + (extent * aPoint) - ((x/2)@(y/2)).
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

{ #category : #initialization }
BlDie >> initialize [

	super initialize.

	extent := 50@50.
	dieValue := 9.
	faces := 9.
	isStopped := false
]

{ #category : #'instance creation' }
BlDie >> open [
	<script: 'self new drawDie openInNewSpace'>
]
