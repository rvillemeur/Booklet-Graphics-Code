"
Skin description of the Second needle for ToClock
"
Class {
	#name : 'ToSecondNeedleClockSkin',
	#superclass : 'ToRawSkin',
	#category : 'BookletGraphics-ToploClock',
	#package : 'BookletGraphics',
	#tag : 'ToploClock'
}

{ #category : 'event handling' }
ToSecondNeedleClockSkin >> installSkinEvent: anEvent [

	super installSkinEvent: anEvent.
	anEvent elementDo: [ :e |
		e
			geometry: BlLineGeometry new;
			outskirts: BlOutskirts centered;
			border:(BlBorder
					 paint: (e valueOfTokenNamed: #'clock-second-needle-color')
					 width: (e valueOfTokenNamed: #'clock-second-needle-width')) ]
]
