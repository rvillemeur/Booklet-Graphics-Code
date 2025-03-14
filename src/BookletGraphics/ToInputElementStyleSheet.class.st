Class {
	#name : 'ToInputElementStyleSheet',
	#superclass : 'ToBeeTheme',
	#category : 'BookletGraphics-ToploInput',
	#package : 'BookletGraphics',
	#tag : 'ToploInput'
}

{ #category : 'accessing' }
ToInputElementStyleSheet class >> defaultTokenProperties [

	^ super defaultTokenProperties , {
		  (ToTokenProperty name: #'input-color-border' value: Color lightOrange).
		  (ToTokenProperty name: #'input-line-width' value: 5) }
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
			with: [ :e | BlRoundedRectangleGeometry cornerRadius: 20 ];
			write: (self property: #size) with: [ :e | 200 @ 100 ];
			write: (self property: #background) with: [ :e | Color blue ];
			write: (self property: #border)
			with: [ :e | BlBorder paint: Color black width: 3 ] ].

	self select: #minus asIdSelector style: [
		self
			write: (self property: #background) with: [ :e | Color lightBlue ];
			write: (self property: #border) with: [ :e |
				BlBorder
					paint: (e valueOfTokenNamed: #'input-color-border')
					width: (e valueOfTokenNamed: #'input-line-width') ] ].

	self select: #plus asIdSelector style: [
		self
			write: (self property: #background) with: [ :e | Color brown ];
			write: (self property: #border) with: [ :e |
				BlBorder
					paint: (e valueOfTokenNamed: #'input-color-border')
					width: (e valueOfTokenNamed: #'input-line-width') ] ]
]
