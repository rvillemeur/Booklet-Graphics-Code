"
text experiment and example in bloc
- font selection
- font effect (background and foreground color)
- etc.
"
Class {
	#name : #TextExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #examples }
TextExperiment class >> exampleHelloWorld [

	<simpleInstance>
	| elt |
	elt := BlTextElement new text: 'Hello world!' asRopedText.
	elt openInNewSpace.
	^ elt
]

{ #category : #'as yet unclassified' }
TextExperiment class >> helloBloc [

	<sampleInstance>
	| labelText label |
	labelText := 'hello from bloc' asRopedText
		             background: Color orange ;
		             fontSize: 75;
		             fontName: 'Source Code Pro';
		             italic;
		             underline;
		             underlineColor: Color red;
		             vertical.

	(labelText from: 1 to: 5) foreground: Color blue.
	(labelText from: 7 to: 11) foreground: Color white.
	(labelText from: 12 to: 15) foreground: Color red.

	label := (BlTextElement text: labelText) position: 50 @ 10.

	label openInNewSpace.
	^ label
]

{ #category : #examples }
TextExperiment class >> textAlignment1 [

	<sampleInstance>
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

{ #category : #examples }
TextExperiment class >> textAlignment2 [

	<sampleInstance>
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

{ #category : #'see class side' }
TextExperiment >> seeClassSide [ 
]
