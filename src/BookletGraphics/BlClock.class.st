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

{ #category : #initialization }
BlClock >> initAnimation [

	| animation |
	animation := BlAnimation new
		             beInfinite;
		             duration: 0.5 seconds.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationLoopDoneEvent
			 do: [ :anEvent |
				 | time |
				 time := DateAndTime current.
				 self updateHours: time hours.
				 self updateMinutes: time minutes.
				 self updateSeconds: time seconds.
				 self requestLayout ]).

	self addAnimation: animation
]

{ #category : #initialization }
BlClock >> initElements [

	hourNeedle := BlElement new
		              geometry: (BlLineGeometry new from: 150 @ 150);
		              outskirts: BlOutskirts centered;
		              border: (BlBorder paint: Color black width: 5).

	minutesNeedle := BlElement new
		                 geometry: (BlLineGeometry new from: 150 @ 150);
		                 outskirts: BlOutskirts centered;
		                 border: (BlBorder paint: Color blue width: 3).

	secondNeedle := BlElement new
		                geometry: (BlLineGeometry new from: 150 @ 150);
		                outskirts: BlOutskirts centered;
		                border: (BlBorder paint: Color red width: 3).

	self addChildren: {
			hourNeedle.
			minutesNeedle.
			secondNeedle }
]

{ #category : #initialization }
BlClock >> initialize [

	super initialize.
	self initElements.
	self initAnimation.


]

{ #category : #'instance creation' }
BlClock >> open [

	<script: 'self new openInSpace'>
	
]

{ #category : #positioning }
BlClock >> updateHours: hours [

	| target |
	target := (Float pi / 6 * hours) cos @ (Float pi / 6 * hours) sin.
	hourNeedle geometry to: 150 @ 150 + (target * 75)
]

{ #category : #positioning }
BlClock >> updateMinutes: minutes [

	| target |
	target := (Float pi / 30 * minutes) cos
	          @ (Float pi / 30 * minutes) sin.
	minutesNeedle geometry to: 150 @ 150 + (target * 100)
]

{ #category : #positioning }
BlClock >> updateSeconds: seconds [

	| target |
	target := (Float pi / 30 * seconds) cos
	          @ (Float pi / 30 * seconds) sin.
	secondNeedle geometry to: 150 @ 150 + (target * 125)
]
