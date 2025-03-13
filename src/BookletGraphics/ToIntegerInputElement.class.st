Class {
	#name : 'ToIntegerInputElement',
	#superclass : 'ToElement',
	#instVars : [
		'plus',
		'minus',
		'inputValue',
		'value',
		'inputLabel'
	],
	#category : 'BookletGraphics-ToploInput',
	#package : 'BookletGraphics',
	#tag : 'ToploInput'
}

{ #category : 'example' }
ToIntegerInputElement class >> openInFixedSize [

	<sampleInstance>
	| input container space |
	space := BlSpace new.
	space toTheme: ToRawTheme new.
	
	container := BlElement new
		             border: (BlBorder paint: Color red width: 1);
		             background: Color yellow ;
		             layout: BlFrameLayout new;
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	input := self new.

	container addChild: input.

	space root addChild: container.
	space show.
	^ container.
]

{ #category : 'example' }
ToIntegerInputElement class >> openInFixedSizeWithStyleSheet [

	<sampleInstance>
	| input container space |
	space := BlSpace new.
	space toTheme: ToInputElementStyleSheet new.
	
	container := BlElement new
		             border: (BlBorder paint: Color red width: 1);
		             background: Color purple ;
		             layout: BlFrameLayout new;
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	input := self new.

	container addChild: input.

	space root addChild: container.
	space show.
	^ container.
]

{ #category : 'helper methods' }
ToIntegerInputElement >> changeValueTo: aValue [

	inputValue text: (self configuredString: aValue asString).
	inputValue text fontSize: 30.
	value := aValue
]

{ #category : 'helper methods' }
ToIntegerInputElement >> configuredString: aString [

	^ aString asRopedText attributes:
		  { (BlTextForegroundAttribute paint: Color white) }
]

{ #category : 'initialization' }
ToIntegerInputElement >> createCircle [

	| circle |
	circle := BlElement new
		          background: Color black;
		          border: (BlBorder paint: Color pink width: 2);
		          layout: BlFrameLayout new;
		          geometry: BlCircleGeometry new.
	^ circle
]

{ #category : 'counter' }
ToIntegerInputElement >> decreaseInput [

	self changeValueTo: value - 1
]

{ #category : 'counter' }
ToIntegerInputElement >> increaseInput [

	self changeValueTo: value + 1
]

{ #category : 'initialization' }
ToIntegerInputElement >> initialize [

	super initialize.
	self layout: BlFrameLayout new.
	self id: #coreInput.
	self initializePlusButton.
	self initializeMinusButton.
	self initializeInputValue: 20.
	self label: 'Input'
]

{ #category : 'initialization' }
ToIntegerInputElement >> initializeInputValue: aValue [

	inputValue := BlTextElement new.
	inputValue id: #input.
	inputValue constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].
	self changeValueTo: aValue.
	self addChild: inputValue
]

{ #category : 'initialization' }
ToIntegerInputElement >> initializeMinusButton [

	| textElt |
	minus := self createCircle.
	minus id: #minus.
	minus constraintsDo: [ :c |
		c frame horizontal alignLeft.
		c frame vertical alignCenter.
		c margin: (BlInsets all: 10) ].
	textElt := BlTextElement new text: (self configuredString: '-').
	textElt text fontSize: 80.
	textElt constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].
	minus
		addEventHandlerOn: BlMouseDownEvent
		do: [ :e | self decreaseInput ].
	minus addChild: textElt.
	self addChild: minus
]

{ #category : 'initialization' }
ToIntegerInputElement >> initializePlusButton [

	| textElt |
	plus := self createCircle.
	plus id: #plus.
	plus constraintsDo: [ :c |
		c frame horizontal alignRight.
		c frame vertical alignCenter ].
	plus transformDo: [ :t | t translateBy: -15 @ 0 ].
	textElt := BlTextElement new text: (self configuredString: '+').
	textElt text fontSize: 55.
	textElt constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].
	plus
		addEventHandlerOn: BlMouseDownEvent
		do: [ :e | self increaseInput ].
	plus addChild: textElt.
	self addChild: plus
]

{ #category : 'accessing' }
ToIntegerInputElement >> label: aString [

	inputLabel := BlTextElement new.
	inputLabel text: (self configuredString: aString).
	inputLabel text fontSize: 25.
	inputLabel constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c margin: (BlInsets all: 10) ].
	self addChild: inputLabel
]

{ #category : 'accessing' }
ToIntegerInputElement >> minus [

	^ minus
]

{ #category : 'accessing' }
ToIntegerInputElement >> newRawSkin [

	^ ToInputElementSkin new
]

{ #category : 'instance creation' }
ToIntegerInputElement >> open [
	<script: 'self new openInNewSpace'>
]

{ #category : 'accessing' }
ToIntegerInputElement >> plus [
^ plus
]
