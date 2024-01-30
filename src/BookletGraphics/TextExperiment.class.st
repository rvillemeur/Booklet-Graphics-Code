Class {
	#name : #TextExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #accessing }
TextExperiment >> helloWorldExample [

	<bookExample>
	| elt |
	elt := BlTextElement new text: 'Hello world!' asRopedText.
	elt openInNewSpace.
	^ elt
]

{ #category : #'as yet unclassified' }
TextExperiment >> textAlignment1 [

	<bookExample>
	| t1 t2 p |
	t1 := BlTextElement text: 'Element' asRopedText.
	t2 := BlTextElement text: 'Élément' asRopedText.

	p := BlElement new
		     layout: BlLinearLayout horizontal;
		     constraintsDo: [ :c |
			     c horizontal fitContent.
			     c vertical fitContent ];
		     addChildren: {
				     t1.
				     t2 };
		     transformDo: [ :t | t scaleBy: 3.0 ].

	"force size calculation"
	p forceLayout.
	t1 transformDo: [ :t | t translateBy: 0 @ (t2 height - t1 height) ].

	^ p
]

{ #category : #'as yet unclassified' }
TextExperiment >> textAlignment2 [

	<bookExample>
	| t1 t2 p |
	t1 := BlTextElement text: 'Element' asRopedText.
	t1 constraintsDo: [ :c |
			     c linear vertical alignBottom.
			     c linear horizontal alignCenter ].
	t2 := BlTextElement text: 'Élément' asRopedText.
	

	p := BlElement new
		     layout: BlLinearLayout horizontal;
		     constraintsDo: [ :c |
			     c horizontal fitContent.
			     c vertical fitContent ];
		     addChildren: {
				     t1.
				     t2 };
		     transformDo: [ :t | t scaleBy: 3.0 ].

	^ p
]
