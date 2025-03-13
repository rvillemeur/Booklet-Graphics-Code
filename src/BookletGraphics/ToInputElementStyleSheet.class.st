Class {
	#name : 'ToInputElementStyleSheet',
	#superclass : 'ToStyleSheetTheme',
	#category : 'BookletGraphics-ToploInput',
	#package : 'BookletGraphics',
	#tag : 'ToploInput'
}

{ #category : 'accessing' }
ToInputElementStyleSheet class >> defaultTokenProperties [

	^ super defaultTokenProperties , {
		  (ToTokenProperty name: #'color-border' value: Color lightOrange).
		  (ToTokenProperty name: #'line-width' value: 2) }
]

{ #category : 'accessing' }
ToInputElementStyleSheet class >> label [ 

	^ 'Input'
]

{ #category : 'initialization' }
ToInputElementStyleSheet >> initializeStyleRules [

	super initializeStyleRules.
	self select: #coreInput asIdSelector style: [
		self
			write: (self property: #geometry)
			with: [ :e | BlRoundedRectangleGeometry cornerRadius: 20 ].

		self write: (self property: #size) with: [ :e | 200 @ 100 ].
		self write: (self property: #background) with: [ :e | Color blue ].

		self
			write: (self property: #border)
			with: [ :e | BlBorder paint: Color black width: 3 ] ].

	self select: #minus asIdSelector style: [
		self write: (self property: #background) with: [ :e | Color brown ].

		self write: (self property: #border) with: [ :e |
			BlBorder
				paint: (e valueOfTokenNamed: #'color-border')
				width: (e valueOfTokenNamed: #'line-width') ] ].

	self select: #plus asIdSelector style: [
		self write: (self property: #background) with: [ :e | Color brown ].

		self write: (self property: #border) with: [ :e |
			BlBorder
				paint: (e valueOfTokenNamed: #'color-border')
				width: (e valueOfTokenNamed: #'line-width') ] ]
]
