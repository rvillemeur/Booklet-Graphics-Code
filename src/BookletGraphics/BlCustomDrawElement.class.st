"
Exemple of custom drawing inside a bloc element
"
Class {
	#name : 'BlCustomDrawElement',
	#superclass : 'BlElement',
	#instVars : [
		'v1',
		'v2',
		'v3'
	],
	#category : 'BookletGraphics-Bloc',
	#package : 'BookletGraphics',
	#tag : 'Bloc'
}

{ #category : 'drawing' }
BlCustomDrawElement >> aeDrawOn: aeCanvas [
	"draw custom triangle"

	super aeDrawOn: aeCanvas.
	
	v1 := 150 @ 0.
	v2 := 0 @ 300.
	v3 := 300 @ 300.
	
	aeCanvas setOutskirtsCentered .
	aeCanvas pathFactory: [ :cairoContext |
			cairoContext
				moveTo: v1;
				lineTo: v2;
				lineTo: v3;
				closePath ].
	aeCanvas setBorderBlock: [
			aeCanvas
				setSourceColor: Color red;
				setBorderWidth: 8 ].

	aeCanvas drawFigure
]

{ #category : 'instance creation' }
BlCustomDrawElement >> open [
	<script: 'self new openInNewSpace; inspect'>
]
