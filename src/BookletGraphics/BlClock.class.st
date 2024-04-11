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
		'radius',
		'hourNeedleSize',
		'minuteNeedleSize',
		'secondNeedleSize'
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

{ #category : #model }
BlClock >> hourCoordinate: time [

	| angleHours y angleTime  angleMinutes x |
	angleHours := Float pi / 6 * time hours.
	angleMinutes := Float pi / 360 * time minutes.
	angleTime := angleHours + angleMinutes.

	x := angleTime sin.
	y := angleTime cos * -1.

	^ 	x @ y.
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
				 self updateNeedlesPosition: Time now.
				 self requestLayout ]).

	self addAnimation: animation
]

{ #category : #initialization }
BlClock >> initClock [
	self removeChildren.

	self initConstant.
	self initClockFrame.
	self initElements.
	self initAnimation
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
BlClock >> initConstant [

	center := self extent / 2.
	hourNeedleSize := radius / 2.
	minuteNeedleSize := radius * 14.8 / 20.
	secondNeedleSize := radius * 16.8 / 20
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

{ #category : #model }
BlClock >> minuteCoordinate: minutes [

	| x y angle |
	angle := Float pi / 30 * minutes.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : #'instance creation' }
BlClock >> open [

	<script: '(BlClock radius: 150) openInSpace '>
	
]

{ #category : #accessing }
BlClock >> radius: aNumber [

	radius := aNumber.
	self initClock.
]

{ #category : #model }
BlClock >> secondCoordinate: seconds [

	| x y angle  |
	angle := Float pi / 30 * seconds.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : #positioning }
BlClock >> updateHourNeedlePosition: time [

	| coordinate |
	coordinate := self hourCoordinate: time.
	hourNeedle geometry to: center + (coordinate * hourNeedleSize)
]

{ #category : #positioning }
BlClock >> updateMinuteNeedlePosition: minutes [

	| coordinate |
	coordinate := self minuteCoordinate: minutes.
	minutesNeedle geometry to: center + (coordinate * minuteNeedleSize)
]

{ #category : #positioning }
BlClock >> updateNeedlesPosition: time [

	self updateHourNeedlePosition: time.
	self updateMinuteNeedlePosition: time minutes.
	self updateSecondNeedlePosition: time seconds
]

{ #category : #positioning }
BlClock >> updateSecondNeedlePosition: seconds [

	| coordinate |
	coordinate := self secondCoordinate: seconds.
	secondNeedle geometry to: center + (coordinate * secondNeedleSize)
]
