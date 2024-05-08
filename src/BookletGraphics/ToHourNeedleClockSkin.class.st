"
Skin description of the hour needle for ToClock
"
Class {
	#name : 'ToHourNeedleClockSkin',
	#superclass : 'ToRawSkin',
	#category : 'BookletGraphics-Clock',
	#package : 'BookletGraphics',
	#tag : 'Clock'
}

{ #category : 'event handling' }
ToHourNeedleClockSkin >> installLookEvent: anEvent [

	super installLookEvent: anEvent.
	anEvent elementDo: [ :e |
		e
			id: #hourNeedle;
			geometry: BlLineGeometry new;
			outskirts: BlOutskirts centered;
			border: (BlBorder
					 paint: (e valueOfTokenNamed: #'clock-hour-needle-color')
					 width: (e valueOfTokenNamed: #'clock-hour-needle-width')) ]
]
