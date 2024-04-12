Class {
	#name : #ToClockSkin,
	#superclass : #ToRawSkin,
	#category : #'BookletGraphics-Clock'
}

{ #category : #'event handling' }
ToClockSkin >> installLookEvent: anEvent [

	super installLookEvent: anEvent.
	anEvent elementDo: [ :e | 
		e geometry: (BlCircleGeometry new matchExtent: 300@300 ). 
		e border: (BlBorder paint: Color purple width: 4).
		e background: (BlBackground  paint: Color lightYellow ) ].
]
