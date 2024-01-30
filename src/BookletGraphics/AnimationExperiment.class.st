"
animation experiment and example in Bloc
"
Class {
	#name : #AnimationExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #examples }
AnimationExperiment class >> animatedBackground [

	<sampleInstance>
	| element animation |
	element := BlElement new size: 50 @ 50.

	animation := BlNumberTransition new
		             from: 0;
		             to: 1;
		             by: 0.5;
		             beInfinite;
		             duration: 3 seconds;
		             onStepDo: [ :aValue :anElement |
			             aValue < 0.5
				             ifTrue: [ anElement background: Color red ]
				             ifFalse: [ anElement background: Color blue ] ].

	element addAnimation: animation.
	element openInNewSpace.
	^ element
]

{ #category : #examples }
AnimationExperiment class >> animatedBackground2 [

	<sampleInstance>
	| element animation |
	element := BlElement new size: 50 @ 50.

	animation := BlNumberTransition new
		             from: 0;
		             to: 1;
		             by: 0.5;
		             beInfinite;
		             duration: 3 seconds;
		"onStepDo: is called on every space pulse. Color are updated at each pulse..."
		             onStepDo: [ :aValue :anElement |
			             aValue < 0.5
				             ifTrue: [ anElement background: Color random ]
				             ifFalse: [ anElement background: Color blue ] ].

	element addAnimation: animation.
	element openInNewSpace.
	^ element
]

{ #category : #'see class side' }
AnimationExperiment >> seeClassSide [ 
]
