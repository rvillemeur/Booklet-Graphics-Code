Class {
	#name : 'ToClockStyleSkin',
	#superclass : 'ToBeeSkin',
	#category : 'BookletGraphics-Clock',
	#package : 'BookletGraphics',
	#tag : 'Clock'
}

{ #category : 'api - hooks' }
ToClockStyleSkin >> onInstalledIn: anElement [

	super onInstalledIn: anElement.
	anElement installBeeStyle
]

{ #category : 'api - hooks' }
ToClockStyleSkin >> onUninstalledIn: anElement [

	super onUninstalledIn: anElement.
	anElement uninstallBeeStyle
]
