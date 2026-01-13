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

{ #category : 'api - look' }
BlCustomDrawElement >> background [

	^ BlBackground paint: Color lightGray
]

{ #category : 'api - look' }
BlCustomDrawElement >> border [ 

	^ BlBorder paint: Color black width: 4
]

{ #category : 'api - bounds' }
BlCustomDrawElement >> extent [

	^ 300 @ 300
]

{ #category : 'initialization' }
BlCustomDrawElement >> initialize [

	super initialize.
	v1 := 150 @ 0.
	v2 := 0 @ 300.
	v3 := 300 @ 300
]

{ #category : 'instance creation' }
BlCustomDrawElement >> open [
	<script: 'self new openInNewSpace'>
]
