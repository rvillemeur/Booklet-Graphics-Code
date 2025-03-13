Class {
	#name : 'ToInputElementSkin',
	#superclass : 'ToRawSkin',
	#category : 'BookletGraphics-ToploInput',
	#package : 'BookletGraphics',
	#tag : 'ToploInput'
}

{ #category : 'event handling' }
ToInputElementSkin >> installSkinEvent: anEvent [
	"when installing the skin, changes the properties of widget mentionned down here"

	super installSkinEvent: anEvent.
	anEvent elementDo: [ :e |
		e size: 200 @ 100.
		e border: (BlBorder paint: Color black width: 3).
		e background: Color blue.
		e geometry: (BlRoundedRectangleGeometry cornerRadius: 20).
		e plus background: Color brown.
		e plus border: (BlBorder
				 paint: (e valueOfTokenNamed: #'color-border')
				 width: (e valueOfTokenNamed: #'line-width')).
		e minus background: Color brown.
		e minus border: (BlBorder
				 paint: (e valueOfTokenNamed: #'color-border')
				 width: (e valueOfTokenNamed: #'line-width')) ]
]
