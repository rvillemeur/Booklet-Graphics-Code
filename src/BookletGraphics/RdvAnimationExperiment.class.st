Class {
	#name : #RdvAnimationExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #accessing }
RdvAnimationExperiment >> animatedBackground [

	<bookExample>
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

{ #category : #accessing }
RdvAnimationExperiment >> animatedBackground2 [

	<bookExample>
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
