Class {
	#name : #BlClock2,
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

{ #category : #example }
BlClock2 class >> openInDynamicLayout [
<sampleInstance>

|clock space|

space := BlSpace new.
		        
space root	border: (BlBorder paint: Color red width: 1);
		        background: (Color yellow);
				layout: BlFlowLayout horizontal.
				 

clock := self new 
 constraintsDo: [ :c |
			           c horizontal matchParent .
			           c vertical matchParent  ].

	space root addChild: clock.
	space show.
	^clock.
]

{ #category : #example }
BlClock2 class >> openInFixedSize [

	<sampleInstance>
	| clock container |
	container := BlElement new
		             border: (BlBorder paint: Color red width: 1);
		             background: Color yellow;
		             layout: BlFrameLayout new;
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	clock := self new size: 300 @ 300.

	container addChild: clock.

	container openInNewSpace.
	^clock.
]

{ #category : #'api - look' }
BlClock2 >> background [

	^ BlBackground  paint: Color lightGray
]

{ #category : #'api - look' }
BlClock2 >> border [

	^ BlBorder paint: Color black width: 4
]

{ #category : #'api - look' }
BlClock2 >> geometry [

	^ BlCircleGeometry new matchExtent: self extent.
]

{ #category : #model }
BlClock2 >> hourCoordinate: time [

	| angleHours y angleTime  angleMinutes x |
	angleHours := Float pi / 6 * time hours.
	angleMinutes := Float pi / 360 * time minutes.
	angleTime := angleHours + angleMinutes.

	x := angleTime sin.
	y := angleTime cos * -1.

	^ 	x @ y.
]

{ #category : #initialization }
BlClock2 >> initAnimation [

	| animation |
	animation := BlAnimation new
		             beInfinite;
		             duration: 0.5 seconds.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationLoopDoneEvent
			 do: [ :anEvent |
				 self updateNeedlesPosition: Time now.
				]).

	self addAnimation: animation
]

{ #category : #initialization }
BlClock2 >> initClock [
	self removeChildren.

	self initConstant.
	self initClockFrame.
	self initElements.
	self initAnimation
]

{ #category : #initialization }
BlClock2 >> initClockFrame [
	"draw small lines around clock frame"

	| quarterLength quarterWidth hourLength hourWidth |
	quarterLength := radius * 4.8 /20.
	quarterWidth := 8.
	hourLength := radius * 3.2 /20.
	hourWidth := 6.

	0 to: 11 do: [ :items |
		| coordinate angle |
		angle := items * Float pi / 6.
		coordinate := angle cos @ angle sin.

		items % 3 == 0
			ifTrue: [ "quarter mark"
				self addChild: (BlElement new
						 geometry: (BlLineGeometry
								  from: center + (coordinate * (radius - quarterLength))
								  to: center + (coordinate * radius));
						 outskirts: BlOutskirts centered;
						 border: (BlBorder paint: Color black width: quarterWidth)) ]
			ifFalse: [ "other hour marks"
				self addChild: (BlElement new
						 geometry: (BlLineGeometry
								  from: center + (coordinate * (radius - hourLength))
								  to: center + (coordinate * radius));
						 outskirts: BlOutskirts centered;
						 border: (BlBorder paint: Color black width: hourWidth)) ] ]
]

{ #category : #initialization }
BlClock2 >> initConstant [

	center := radius @ radius.
	hourNeedleSize := radius / 2.
	minuteNeedleSize := radius * 14.8 / 20.
	secondNeedleSize := radius * 16.8 / 20
]

{ #category : #initialization }
BlClock2 >> initElements [

	hourNeedle := BlElement new
		              id: #hourNeedle;
		              geometry: BlLineGeometry new;
		              outskirts: BlOutskirts centered;
		              border: (BlBorder paint: Color black width: 5).

	minutesNeedle := BlElement new
		                 id: #minuteNeedle;
		                 geometry: BlLineGeometry new;
		                 outskirts: BlOutskirts centered;
		                 border: (BlBorder paint: Color black width: 5).

	secondNeedle := BlElement new
		                id: #secondNeedle;
		                geometry: BlLineGeometry new;
		                outskirts: BlOutskirts centered;
		                border: (BlBorder paint: Color red width: 3).

	self addChildren: {
			hourNeedle.
			minutesNeedle.
			secondNeedle }
]

{ #category : #initialization }
BlClock2 >> initialize [

	super initialize.
	self
		addEventHandlerOn: BlElementExtentChangedEvent
		do: [ :e | self resize ]
]

{ #category : #model }
BlClock2 >> minuteCoordinate: minutes [

	| x y angle |
	angle := Float pi / 30 * minutes.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : #drawing }
BlClock2 >> resize [

	radius := self extent min / 2.0.
	self initClock
]

{ #category : #model }
BlClock2 >> secondCoordinate: seconds [

	| x y angle  |
	angle := Float pi / 30 * seconds.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : #'api - bounds' }
BlClock2 >> size: aPoint [
	super size: aPoint.

	radius := aPoint x / 2.
	self initClock.
]

{ #category : #positioning }
BlClock2 >> updateHourNeedlePosition: time [

	| coordinate |
	coordinate := self hourCoordinate: time.
	"hourNeedle geometry from: center to: center + (coordinate * hourNeedleSize)."
	hourNeedle geometry: (BlLineGeometry
			 from: center
			 to: center + (coordinate * hourNeedleSize))
]

{ #category : #positioning }
BlClock2 >> updateMinuteNeedlePosition: minutes [

	| coordinate |
	coordinate := self minuteCoordinate: minutes.
	minutesNeedle geometry from: center to: center + (coordinate * minuteNeedleSize)
]

{ #category : #positioning }
BlClock2 >> updateNeedlesPosition: time [

	self updateHourNeedlePosition: time.
	self updateMinuteNeedlePosition: time minutes.
	self updateSecondNeedlePosition: time seconds.
]

{ #category : #positioning }
BlClock2 >> updateSecondNeedlePosition: seconds [

	| coordinate |
	coordinate := self secondCoordinate: seconds.
	secondNeedle geometry
		from: center
		to: center + (coordinate * secondNeedleSize)
]
