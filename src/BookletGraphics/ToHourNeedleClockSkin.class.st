"
Skin description of the hour needle for ToClock
"
Class {
	#name : 'ToHourNeedleClockSkin',
	#superclass : 'ToRawSkin',
	#category : 'BookletGraphics-ToploClock',
	#package : 'BookletGraphics',
	#tag : 'ToploClock'
}

{ #category : 'event handling' }
ToHourNeedleClockSkin >> installSkinEvent: anEvent [

	super installSkinEvent: anEvent.
	anEvent elementDo: [ :e |
		e
			geometry: BlLineGeometry new;
			outskirts: BlOutskirts centered;
			border: (BlBorder
					 paint: (e valueOfTokenNamed: #'clock-hour-needle-color')
					 width: (e valueOfTokenNamed: #'clock-hour-needle-width')) ]
]
