"
Skin description of the Minute needle for ToClock
"
Class {
	#name : 'ToMinuteNeedleClockSkin',
	#superclass : 'ToRawSkin',
	#category : 'BookletGraphics-ToploClock',
	#package : 'BookletGraphics',
	#tag : 'ToploClock'
}

{ #category : 'event handling' }
ToMinuteNeedleClockSkin >> installSkinEvent: anEvent [

	super installSkinEvent: anEvent.
	anEvent elementDo: [ :e |
		e
			geometry: BlLineGeometry new;
			outskirts: BlOutskirts centered;
			border: (BlBorder
					 paint: (e valueOfTokenNamed: #'clock-minute-needle-color')
					 width: (e valueOfTokenNamed: #'clock-minute-needle-width')) ]
]
