Class {
	#name : #BlClock,
	#superclass : #BlElement,
	#instVars : [
		'hourNeedle',
		'minutesNeedle',
		'secondNeedle'
	],
	#category : #'BookletGraphics-Clock'
}

{ #category : #drawing }
BlClock >> aeDrawOn: aeCanvas [
	"draw clock tick on frame"

	| center |
	center := self extent / 2.

	super aeDrawOn: aeCanvas.

	aeCanvas setOutskirtsCentered.
	
	0 to: 11 do: [ :items |
		| target |
		target := (items * Float pi / 6) cos @ (items * Float pi / 6) sin.

		items % 3 == 0
			ifTrue: [
				aeCanvas pathFactory: [ :cairoContext |
					cairoContext
						moveTo: center;
						relativeMoveTo: target * 115;
						relativeLineTo: target * 35;
						closePath ].

				aeCanvas setBorderBlock: [
					aeCanvas
						setSourceColor: Color black;
						setBorderWidth: 8 ] ]
			ifFalse: [
				aeCanvas pathFactory: [ :cairoContext |
					cairoContext
						moveTo: center;
						relativeMoveTo: target * 125;
						relativeLineTo: target * 25;
						closePath ].

				aeCanvas setBorderBlock: [
					aeCanvas
						setSourceColor: Color black;
						setBorderWidth: 6 ] ].
		aeCanvas drawFigure ]
]

{ #category : #'api - look' }
BlClock >> background [

	^ BlBackground  paint: Color lightGray
]

{ #category : #'api - look' }
BlClock >> border [

	^ BlBorder paint: Color black width: 4
]

{ #category : #'api - bounds' }
BlClock >> extent [

	^ 300 @ 300
]

{ #category : #'api - look' }
BlClock >> geometry [

	^ BlCircleGeometry new matchExtent: self extent
]

{ #category : #accessing }
BlClock >> hourNeedle [

	^ hourNeedle
]

{ #category : #initialization }
BlClock >> initialize [

	| animation |
	super initialize.
	hourNeedle := BlElement new
		              geometry:
			              (BlLineGeometry from: 150 @ 150 to: 150 @ 75);
		              size: 75 @ 75;
		              outskirts: BlOutskirts centered;
		              border: (BlBorder paint: Color black width: 5).


	minutesNeedle := BlElement new
		                 geometry:
			                 (BlLineGeometry from: 150 @ 150 to: 50 @ 150);
		                 size: 100 @ 100;
		                 outskirts: BlOutskirts centered;
		                 border: (BlBorder paint: Color blue width: 3).

	secondNeedle := BlElement new
		                geometry:
			                (BlLineGeometry from: 150 @ 150 to: 250 @ 150);
		                size: 100 @ 100;
		                outskirts: BlOutskirts centered;
		                border: (BlBorder paint: Color red width: 3).


	self addChildren: {
			hourNeedle.
			minutesNeedle.
			secondNeedle }.

	animation := BlAnimation new
		             beInfinite;
		             duration: 0.5 seconds.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationLoopDoneEvent
			 do: [ :anEvent | |target time|
				time := DateAndTime current.
				target := ((Float pi / 30 * time second) cos) @ ((Float pi / 30 * time second) sin).
				secondNeedle geometry to: 150@150 + (target * 125).
				self forceLayout .
				]).
	
	self addAnimation: animation.
]

{ #category : #accessing }
BlClock >> minutesNeedle [

	^ minutesNeedle
]

{ #category : #'instance creation' }
BlClock >> open [

	<script: 'self new openInSpace'>
	
]

{ #category : #accessing }
BlClock >> secondNeedle [

	^ secondNeedle
]
