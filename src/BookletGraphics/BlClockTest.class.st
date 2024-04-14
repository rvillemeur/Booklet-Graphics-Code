Class {
	#name : #BlClockTest,
	#superclass : #TestCase,
	#category : #'BookletGraphics-Clock'
}

{ #category : #tests }
BlClockTest >> testHourCoordinate [

	| time clock |
	clock := BlClock new.

	time := Time fromString: '6:00:00'.
	self assert: (clock hourCoordinate:  time) closeTo: 0 @ 1.

	time := Time fromString: '6:15:00'.
	self assert: (clock hourCoordinate: time) closeTo: -0.1305 @ 0.9914 precision: 4.
	
	time := Time fromString: '6:30:00'.
	self assert: (clock hourCoordinate: time) closeTo: 0.9659@(-0.2588) precision: 4.

	time := Time fromString: '6:45:00'.
	self assert: (clock hourCoordinate: time) closeTo: -0.3826 @ 0.9238 precision: 4.


]

{ #category : #tests }
BlClockTest >> testMinuteCoordinate [

	| time clock |
	clock := BlClock new.

	time := Time fromString: '6:00:00'.
	self assert: (clock minuteCoordinate: time minute) closeTo: 0 @ -1.

	time := Time fromString: '6:15:00'.
	self assert: (clock minuteCoordinate: time minute) closeTo: 1 @ 0.

	time := Time fromString: '6:30:00'.
	self assert: (clock minuteCoordinate: time minute) closeTo: 0 @ 1.

	time := Time fromString: '6:45:00'.
	self assert: (clock minuteCoordinate: time minute) closeTo: -1 @ 0
]

{ #category : #tests }
BlClockTest >> testSecondCoordinate [

	| time clock |
	clock := BlClock new.

	time := Time fromString: '6:00:00'.
	self assert: (clock secondCoordinate: time second) closeTo: 0 @ -1.

	time := Time fromString: '6:00:15'.
	self assert: (clock secondCoordinate: time second) closeTo: 1 @ 0.

	time := Time fromString: '6:00:30'.
	self assert: (clock secondCoordinate: time second) closeTo: 0 @ 1.

	time := Time fromString: '6:00:45'.
	self assert: (clock secondCoordinate: time second) closeTo: -1 @ 0
]
