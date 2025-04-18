"
A clock implementation using only Bloc graphic framework

See class side for usage with 
- fixed size
- dynamic layout
"
Class {
	#name : 'BlClockModel',
	#superclass : 'Object',
	#instVars : [
		'time'
	],
	#category : 'BookletGraphics-BlocClock',
	#package : 'BookletGraphics',
	#tag : 'BlocClock'
}

{ #category : 'positioning' }
BlClockModel >> hourCoordinate [

	| angleHours y angleTime  angleMinutes x |
	angleHours := Float pi / 6 * time hours.
	angleMinutes := Float pi / 360 * time minutes.
	angleTime := angleHours + angleMinutes.

	x := angleTime sin.
	y := angleTime cos * -1.

	^ 	x @ y.
]

{ #category : 'positioning' }
BlClockModel >> minuteCoordinate [

	| x y angle |
	angle := Float pi / 30 * time minutes.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : 'positioning' }
BlClockModel >> secondCoordinate [

	| x y angle  |
	angle := Float pi / 30 * time seconds.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : 'accessing' }
BlClockModel >> time: anObject [

	time := anObject
]
