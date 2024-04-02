"
a simple clock drawned using Bloc
"
Class {
	#name : #BlClock,
	#superclass : #BlElement,
	#instVars : [
		'hourNeedle',
		'minutesNeedle',
		'secondNeedle',
		'center',
		'radius'
	],
	#category : #'BookletGraphics-Clock'
}

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

	^ radius * 2 @ (radius * 2)
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
				 time := Time now.
				 self updateHours: time.
				 self updateMinutes: time minutes.
				 self updateSeconds: time seconds.
				 self requestLayout ]).

	self addAnimation: animation
]

{ #category : #initialization }
BlClock >> initClockFrame [
	"draw small lines around clock frame"

	0 to: 11 do: [ :items |
		| target |
		target := (items * Float pi / 6) cos @ (items * Float pi / 6) sin.

		items % 3 == 0
			ifTrue: [
				self addChild: (BlElement new
						 geometry: (BlLineGeometry from: center + (target * 115) to: center + (target * 150));
						 outskirts: BlOutskirts centered;
						 border: (BlBorder paint: Color black width: 8)) ]
			ifFalse: [
				self addChild: (BlElement new
						 geometry: (BlLineGeometry from: center + (target * 125) to: center + (target * 150));
						 outskirts: BlOutskirts centered;
						 border: (BlBorder paint: Color black width: 6)) ] ]
]

{ #category : #initialization }
BlClock >> initElements [

	hourNeedle := BlElement new
		              geometry: (BlLineGeometry new from: center);
		              outskirts: BlOutskirts centered;
		              border: (BlBorder paint: Color black width: 5).

	minutesNeedle := BlElement new
		                 geometry: (BlLineGeometry new from: center);
		                 outskirts: BlOutskirts centered;
		                 border: (BlBorder paint: Color black width: 5).

	secondNeedle := BlElement new
		                geometry: (BlLineGeometry new from: center);
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
	radius := 150.
	center := self extent / 2.
	self initClockFrame.
	self initElements.
	self initAnimation.


]

{ #category : #'instance creation' }
BlClock >> open [

	<script: 'self new openInSpace'>
	
]

{ #category : #positioning }
BlClock >> updateHours: time [

	| target |
	target := ((Float pi / 6 * time hours)  + (Float pi / 360 * time minutes)) sin * -1
		@ ((Float pi / 6 * time hours) + (Float pi / 360 * time minutes)) cos * -1.

	hourNeedle geometry to: center + (target * 75)
]

{ #category : #positioning }
BlClock >> updateMinutes: minutes [

	| target |
	target := (Float pi / 30 * minutes) sin * -1
	          @ (Float pi / 30 * minutes) cos * -1.

	minutesNeedle geometry to: center + (target * 110)
]

{ #category : #positioning }
BlClock >> updateSeconds: seconds [

	| target |
	target := (Float pi / 30 * seconds) sin * -1
	          @ (Float pi / 30 * seconds) cos * -1.

	secondNeedle geometry to: center + (target * 125)
]
