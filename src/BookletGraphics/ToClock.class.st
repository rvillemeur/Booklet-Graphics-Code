Class {
	#name : #ToClock,
	#superclass : #ToElement,
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
ToClock class >> openInDynamicLayout [

	<sampleInstance>
	| clock space |
	space := BlSpace new.

	space root
		border: (BlBorder paint: Color red width: 1);
		background: Color yellow;
		layout: BlFlowLayout horizontal.


	clock := self new constraintsDo: [ :c |
		         c horizontal matchParent.
		         c vertical matchParent ].

	space root addChild: clock.
	space show.
	^ clock
]

{ #category : #example }
ToClock class >> openInFixedSize [

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
	^ clock
]

{ #category : #accessing }
ToClock >> center [

	^ center
]

{ #category : #model }
ToClock >> hourCoordinate: time [

	| angleHours y angleTime  angleMinutes x |
	angleHours := Float pi / 6 * time hours.
	angleMinutes := Float pi / 360 * time minutes.
	angleTime := angleHours + angleMinutes.

	x := angleTime sin.
	y := angleTime cos * -1.

	^ 	x @ y.
]

{ #category : #accessing }
ToClock >> hourNeedle [

	^ hourNeedle
]

{ #category : #initialization }
ToClock >> initAnimation [

	| animation |
	animation := BlAnimation new
		             beInfinite;
		             duration: 0.5 seconds.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationLoopDoneEvent
			 do: [ :anEvent | self updateNeedlesPosition: Time now .
					self requestLayout .]).

	self addAnimation: animation
]

{ #category : #initialization }
ToClock >> initialize [

	super initialize.
	secondNeedle := BlElement new.
	minutesNeedle := BlElement new.
	hourNeedle := BlElement new.

	self addChildren: {
			hourNeedle.
			minutesNeedle.
			secondNeedle }.

	self
		addEventHandlerOn: BlElementExtentChangedEvent
		do: [ :e | self resize ]
]

{ #category : #skin }
ToClock >> installRawStyle [

	super installRawStyle.
]

{ #category : #model }
ToClock >> minuteCoordinate: minutes [

	| x y angle |
	angle := Float pi / 30 * minutes.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : #accessing }
ToClock >> minutesNeedle [

	^ minutesNeedle
]

{ #category : #'instance creation' }
ToClock >> newRawSkin [

	^ ToClockSkin  new
]

{ #category : #drawing }
ToClock >> resize [

	radius := self extent min / 2.0.

	center := radius @ radius.
	hourNeedleSize := radius / 2.
	minuteNeedleSize := radius * 14.8 / 20.
	secondNeedleSize := radius * 16.8 / 20.

	self initAnimation 
]

{ #category : #model }
ToClock >> secondCoordinate: seconds [

	| x y angle  |
	angle := Float pi / 30 * seconds.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : #accessing }
ToClock >> secondNeedle [

	^ secondNeedle
]

{ #category : #'api - bounds' }
ToClock >> size: aPoint [

	super size: aPoint.

	radius := aPoint x / 2.

	center := radius @ radius.
	hourNeedleSize := radius / 2.
	minuteNeedleSize := radius * 14.8 / 20.
	secondNeedleSize := radius * 16.8 / 20.

	self initAnimation 
]

{ #category : #positioning }
ToClock >> updateHourNeedlePosition: time [

	| coordinate |
	coordinate := self hourCoordinate: time.
	"hourNeedle geometry from: center to: center + (coordinate * hourNeedleSize)."
	hourNeedle geometry: (BlLineGeometry
			 from: center
			 to: center + (coordinate * hourNeedleSize))
]

{ #category : #positioning }
ToClock >> updateMinuteNeedlePosition: minutes [

	| coordinate |
	coordinate := self minuteCoordinate: minutes.
	minutesNeedle geometry from: center to: center + (coordinate * minuteNeedleSize)
]

{ #category : #positioning }
ToClock >> updateNeedlesPosition: time [

	self updateHourNeedlePosition: time.
	self updateMinuteNeedlePosition: time minutes.
	self updateSecondNeedlePosition: time seconds.
]

{ #category : #positioning }
ToClock >> updateSecondNeedlePosition: seconds [

	| coordinate |
	coordinate := self secondCoordinate: seconds.
	secondNeedle geometry
		from: center
		to: center + (coordinate * secondNeedleSize)
]