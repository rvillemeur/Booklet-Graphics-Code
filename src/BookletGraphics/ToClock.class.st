"
A clock implementation using Bloc graphic framework and facilities with Toplo

See class side for usage with 
- fixed size
- dynamic layout
"
Class {
	#name : 'ToClock',
	#superclass : 'ToElement',
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
	#category : 'BookletGraphics-Clock',
	#package : 'BookletGraphics',
	#tag : 'Clock'
}

{ #category : 'example' }
ToClock class >> openInDynamicLayout [

	<sampleInstance>
	| clock space |
	space := BlSpace new.
	space toTheme: ToRawClockTheme new.

	space root
		border: (BlBorder paint: Color red width: 1);
		background: Color white;
		layout: BlFlowLayout horizontal.


	clock := self new constraintsDo: [ :c |
		         c horizontal matchParent.
		         c vertical matchParent ].

	space root addChild: clock.
	space show.
	^ clock
]

{ #category : 'example' }
ToClock class >> openInDynamicLayoutWithStyleSheet [

	<sampleInstance>
	| clock space |
	space := BlSpace new.
	space toTheme: ToClockStyleSheetTheme new.

	space root
		border: (BlBorder paint: Color red width: 1);
		background: Color white;
		layout: BlFlowLayout horizontal.


	clock := self new constraintsDo: [ :c |
		         c horizontal matchParent.
		         c vertical matchParent ].

	space root addChild: clock.
	space show.
	^ clock
]

{ #category : 'example' }
ToClock class >> openInFixedSize [

	<sampleInstance>
	| clock container space |
	space := BlSpace new.
	space toTheme: ToRawClockTheme new.
	
	container := BlElement new
		             border: (BlBorder paint: Color red width: 1);
		             background: Color white ;
		             layout: BlFrameLayout new;
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	clock := self new size: 300 @ 300.

	container addChild: clock.

	space root addChild: container.
	space show.
	^ container.
]

{ #category : 'example' }
ToClock class >> openInFixedSizeWithStyleSheet [

	<sampleInstance>
	| clock container space |
	space := BlSpace new.
	space toTheme: ToClockStyleSheetTheme new.
	
	container := BlElement new
		             border: (BlBorder paint: Color red width: 1);
		             background: Color white ;
		             layout: BlFrameLayout new;
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	clock := self new size: 300 @ 300.

	container addChild: clock.

	space root addChild: container.
	space show.
	^ container.
]

{ #category : 'accessing' }
ToClock >> center [

	^ center
]

{ #category : 'theme' }
ToClock >> defaultBeeStyleStamps [ 

	^ #( #clock )
]

{ #category : 'model' }
ToClock >> hourCoordinate: time [

	| angleHours y angleTime  angleMinutes x |
	angleHours := Float pi / 6 * time hours.
	angleMinutes := Float pi / 360 * time minutes.
	angleTime := angleHours + angleMinutes.

	x := angleTime sin.
	y := angleTime cos * -1.

	^ 	x @ y.
]

{ #category : 'accessing' }
ToClock >> hourNeedle [

	^ hourNeedle
]

{ #category : 'initialization' }
ToClock >> initAnimation [

	| animation |
	animation := BlAnimation new
		             beInfinite;
		             duration: 0.5 seconds.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationLoopDoneEvent
			 do: [ :anEvent | self updateNeedlesPosition: Time now .
					self invalidate .]).

	self addAnimation: animation
]

{ #category : 'initialization' }
ToClock >> initClock [
	self removeChildren.

	self initConstant.
	self initElements.
	self requestNewSkin.
	self initAnimation
	"self whenLayoutedDoOnce:  [ self initAnimation ]."
]

{ #category : 'initialization' }
ToClock >> initConstant [

	center := radius @ radius.
	hourNeedleSize := radius / 2.
	minuteNeedleSize := radius * 14.8 / 20.
	secondNeedleSize := radius * 16.8 / 20
]

{ #category : 'initialization' }
ToClock >> initElements [

	secondNeedle := ToElement new id: #secondNeedle.
	minutesNeedle := ToElement new id: #minuteNeedle.
	hourNeedle := ToElement new id: #hourNeedle.

	self addChildren: {
			hourNeedle.
			minutesNeedle.
			secondNeedle }
]

{ #category : 'initialization' }
ToClock >> initialize [

	super initialize.
	self
		addEventHandlerOn: BlElementExtentChangedEvent
		do: [ :e | self resize ]
]

{ #category : 'skin' }
ToClock >> installRawStyle [

	super installRawStyle.
]

{ #category : 'model' }
ToClock >> minuteCoordinate: minutes [

	| x y angle |
	angle := Float pi / 30 * minutes.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : 'accessing' }
ToClock >> minutesNeedle [

	^ minutesNeedle
]

{ #category : 'instance creation' }
ToClock >> newRawSkin [

	^ ToClockSkin  new
]

{ #category : 'drawing' }
ToClock >> resize [

	radius := self extent min / 2.0.
	self initClock.
	

	
]

{ #category : 'model' }
ToClock >> secondCoordinate: seconds [

	| x y angle  |
	angle := Float pi / 30 * seconds.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : 'accessing' }
ToClock >> secondNeedle [

	^ secondNeedle
]

{ #category : 'api - bounds' }
ToClock >> size: aPoint [

	super size: aPoint.
	radius := aPoint x / 2.
	self initClock
]

{ #category : 'positioning' }
ToClock >> updateHourNeedlePosition: time [

	| coordinate |
	coordinate := self hourCoordinate: time.
	hourNeedle geometry from: center to: center + (coordinate * hourNeedleSize).
]

{ #category : 'positioning' }
ToClock >> updateMinuteNeedlePosition: minutes [

	| coordinate |
	coordinate := self minuteCoordinate: minutes.
	minutesNeedle geometry from: center to: center + (coordinate * minuteNeedleSize)
]

{ #category : 'positioning' }
ToClock >> updateNeedlesPosition: time [

	self updateHourNeedlePosition: time.
	self updateMinuteNeedlePosition: time minutes.
	self updateSecondNeedlePosition: time seconds.
]

{ #category : 'positioning' }
ToClock >> updateSecondNeedlePosition: seconds [

	| coordinate |
	coordinate := self secondCoordinate: seconds.
	secondNeedle geometry
		from: center
		to: center + (coordinate * secondNeedleSize)
]
