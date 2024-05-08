"
Skin description of the ToClock
"
Class {
	#name : 'ToClockSkin',
	#superclass : 'ToRawSkin',
	#category : 'BookletGraphics-Clock',
	#package : 'BookletGraphics',
	#tag : 'Clock'
}

{ #category : 'private - drawing' }
ToClockSkin >> drawClockFrame: e [
	"draw small lines around clock frame"

	| quarterLength quarterWidth hourLength hourWidth radius|
	radius := e extent min / 2.0.
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
				e addChild: (BlElement new
						 geometry: (BlLineGeometry
								  from: e center + (coordinate * (radius - quarterLength))
								  to: e center + (coordinate * radius));
						 outskirts: BlOutskirts centered;
						 border: (BlBorder paint: Color black width: quarterWidth)) ]
			ifFalse: [ "other hour marks"
				e addChild: (BlElement new
						 geometry: (BlLineGeometry
								  from: e center + (coordinate * (radius - hourLength))
								  to: e center + (coordinate * radius));
						 outskirts: BlOutskirts centered;
						 border: (BlBorder paint: Color black width: hourWidth)) ] ]
]

{ #category : 'event handling' }
ToClockSkin >> installLookEvent: anEvent [

	super installLookEvent: anEvent.
	anEvent elementDo: [ :e |
		e geometry: (BlCircleGeometry new matchExtent: e extent).
		e border: (BlBorder paint: Color purple width: 4).
		e background:
			(BlBackground paint: (e valueOfTokenNamed: #'background-color')).

		self drawClockFrame: e.
		e hourNeedle defaultRawSkin: ToHourNeedleClockSkin new.
		e minutesNeedle defaultRawSkin: ToMinuteNeedleClockSkin new.
		e secondNeedle defaultRawSkin: ToSecondNeedleClockSkin new ]
]
