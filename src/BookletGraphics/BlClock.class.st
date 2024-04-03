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

{ #category : #accessing }
BlClock class >> radius: aNumber [

	^ self new radius: aNumber.
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

	| quarterLength quarterWidth hourLength hourWidth |
	quarterLength := radius * 4.8 /20.
	quarterWidth := 8.
	hourLength := radius * 3.2 /20.
	hourWidth := 6.

	0 to: 11 do: [ :items |
		| target angle |
		angle := items * Float pi / 6.
		target := angle cos @ angle sin.

		items % 3 == 0
			ifTrue: [ "quarter mark"
				self addChild: (BlElement new
						 geometry: (BlLineGeometry
								  from: center + (target * (radius - quarterLength))
								  to: center + (target * radius));
						 outskirts: BlOutskirts centered;
						 border: (BlBorder paint: Color black width: quarterWidth)) ]
			ifFalse: [ "other hour marks"
				self addChild: (BlElement new
						 geometry: (BlLineGeometry
								  from: center + (target * (radius - hourLength))
								  to: center + (target * radius));
						 outskirts: BlOutskirts centered;
						 border: (BlBorder paint: Color black width: hourWidth)) ] ]
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



]

{ #category : #'instance creation' }
BlClock >> open [

	<script: '(BlClock radius: 150) openInSpace '>
	
]

{ #category : #accessing }
BlClock >> radius: aNumber [

	radius := aNumber.
	self removeChildren.
	center := self extent / 2.
	self initClockFrame.
	self initElements.
	self initAnimation
]

{ #category : #positioning }
BlClock >> updateHours: time [

	| target angleHours angleMinutes angleTime needleSize |
	needleSize := radius / 2.
	angleHours := Float pi / 6 * time hours.
	angleMinutes := Float pi / 360 * time minutes.
	angleTime := angleHours + angleMinutes.

	target := angleTime sin * -1 @ angleTime cos * -1.

	hourNeedle geometry to: center + (target * needleSize)
]

{ #category : #positioning }
BlClock >> updateMinutes: minutes [

	| target angle needleSize |
	needleSize := radius * 14.8 /20 .
	angle := Float pi / 30 * minutes.
	target := angle sin * -1 @ angle cos * -1.

	minutesNeedle geometry to: center + (target * needleSize)
]

{ #category : #positioning }
BlClock >> updateSeconds: seconds [

	| target angle needleSize |
	needleSize := radius *  16.8 / 20.
	angle := Float pi / 30 * seconds.
	target := angle sin * -1 @ angle cos * -1.

	secondNeedle geometry to: center + (target * needleSize)
]
