"
A couple of example on the transform possibility in bloc
- rotating
- translating
- scaling.
"
Class {
	#name : #transformExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #examples }
transformExperiment class >> transformExample [

	<sampleInstance>
	| aContainer node space |
	space := BlSpace new.
	aContainer := BlElement new
		              layout: BlFrameLayout new;
		              constraintsDo: [ :c |
			              c horizontal fitContent.
			              c vertical fitContent ];
		              padding: (BlInsets all: 20);
		              background: (Color gray alpha: 0.2).

	node := BlElement new
		        geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
		        border: (BlBorder paint: Color black width: 2);
		        background: Color white;
		        constraintsDo: [ :c |
			        c frame horizontal alignCenter.
			        c frame vertical alignBottom ];
		        size: 20 @ 20.

	aContainer transformDo: [ :t |
		t
			scaleBy: 2.0;
			rotateBy: 69;
			translateBy: 50 @ 50 ].
	aContainer addChild: node.

	aContainer forceLayout.

	space root addChild: aContainer.
	space show.
	^ space
]

{ #category : #'see class side' }
transformExperiment >> seeClassSide [ 
]
