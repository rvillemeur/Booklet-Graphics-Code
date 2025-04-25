"
text experiment and example in bloc
- font selection
- font effect (background and foreground color)
- etc.
"
Class {
	#name : 'TextExperiment',
	#superclass : 'Object',
	#category : 'BookletGraphics-Bloc',
	#package : 'BookletGraphics',
	#tag : 'Bloc'
}

{ #category : 'examples' }
TextExperiment class >> exampleHelloWorld [

	<simpleInstance>
	| elt |
	elt := BlTextElement text: 'Hello world!' asRopedText.
	elt openInNewSpace.
	^ elt
]

{ #category : 'examples' }
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

	label := (BlTextElement text: labelText) position: 50 @ 10; background: Color yellow.

	label openInNewSpace.
	^ label
]

{ #category : 'examples' }
TextExperiment class >> helloHarfbuzz [

	<sampleInstance>
	| labelText label |
	"Harfbuzz rendering is currently commented out in BATextParagraphSpan >> measure "
	labelText := 'a := A->B->>C <= c|=>d~~>e.' asRopedText
		             background: Color orange;
		             fontSize: 25;
		             fontName: 'Cascadia Code';
						 underline;
						 underlineColor: Color red.

	(labelText from: 1 to: 5) foreground: Color blue.
	(labelText from: 7 to: 11) foreground: Color white.
	(labelText from: 12 to: 15) foreground: Color red.
	
	label := (BlTextElement text: labelText)
		         position: 50 @ 10;
		         background: Color yellow;
		         margin: (BlInsets all: 10);
		         padding: (BlInsets all: 5);
		         outskirts: BlOutskirts centered;
		         border: (BlBorder paint: Color red width: 5).
	label tightMeasurement.

	^ label



]

{ #category : 'examples' }
TextExperiment class >> sampleEditorMeasure [

	<sampleInstance>
	| labelText label |
	labelText := 'Sphinx - a := A->B->>C <= c|=>d~~>e.' asRopedText
		             background: Color orange;
		             fontSize: 25;
		             fontName: 'Cascadia Code'.

	label := (BlTextElement text: labelText)
		         background: Color yellow;
		         "margin: (BlInsets all: 5);"
		         "padding: (BlInsets all: 5);"
		         "outskirts: BlOutskirts outside;"
		         border: (BlBorder paint: Color red width: 1).
	label editorMeasurement.
	^ label
]

{ #category : 'examples' }
TextExperiment class >> sampleEmojiGrid [

	<sampleInstance>
	| container aWideString elt |
	"AeFontManager resetGlobalInstance.
AeFontManager globalInstance scanDirectory: AeFilesystemResources fontsDirectory"
	container := BlElement new
		             border: (BlBorder paint: Color red width: 1);
		             background: (Color red alpha: 0.2);
		             layout: BlFlowLayout horizontal;
		             constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical fitContent ].

	aWideString := WideString streamContents: [ :stream |
		               #( 16r1F468 16r1F469 16r1F467 16r1F466 )
			               do: [ :each | stream nextPut: (Unicode value: each) ]
			               separatedBy: [
			               stream nextPut: Unicode zeroWidthJoiner ] ].
	
	elt := BlTextElement text: (aWideString asRopedText
			        fontSize: 40;
			        fontName: 'Noto Color Emoji').
	elt
		padding: (BlInsets all: 5);
		border: (BlBorder paint: Color black width: 1).

	container addChild: elt.
	container openInNewSpace.
	^ container
]

{ #category : 'examples' }
TextExperiment class >> sampleEmojiGrid2 [

	<sampleInstance>
	| container |
		"AeFontManager resetGlobalInstance.
AeFontManager globalInstance scanDirectory: AeFilesystemResources fontsDirectory"
	container := BlElement new
		             border: (BlBorder paint: Color red width: 1);
		             background: (Color white);
		             layout: BlFlowLayout horizontal;
		             constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical fitContent ].

	"Noto Color Emoji has 2668 different glyph"
	
	16r1F600 to: 16r1F64F do: [ :each |
		| elt |
		elt := BlTextElement text: ((Unicode value: each) asRopedText
				        fontSize: 40;
				        fontName: 'Noto Color Emoji').
		elt
			padding: (BlInsets all: 5);
			border: (BlBorder paint: Color black width: 1).

		container addChild: elt ].

	"container openInNewSpace."
	^ container
]

{ #category : 'examples' }
TextExperiment class >> sampleGlyphGrid [

	<sampleInstance>
	| container |
		"AeFontManager resetGlobalInstance.
AeFontManager globalInstance scanDirectory: AeFilesystemResources fontsDirectory"
	container := BlElement new
		             border: (BlBorder paint: Color red width: 1);
		             background: (Color red alpha: 0.2);
		             layout: BlFlowLayout horizontal;
		             constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical fitContent ].

	"3199 is the number of glyphs reported by AeFontManager on Cascadia Code"
	1 to: 3199 do: [ :i |
		| elt |
		elt := BlTextElement text: ((Unicode value: i) asRopedText
				        fontSize: 25;
				        fontName: 'Cascadia Code').
		elt
			"margin: (BlInsets all: 5);"
			padding: (BlInsets all: 5);
			border: (BlBorder paint: Color black width: 1).

		container addChild: elt ].
	container openInNewSpace.
	^ container
]

{ #category : 'examples' }
TextExperiment class >> sampleLabelMeasure [

	<sampleInstance>
	| labelText label |
	labelText := 'Sphinx - a := A->B->>C <= c|=>d~~>e.' asRopedText
		             background: Color orange;
		             fontSize: 25;
		             fontName: 'Cascadia Code'.

	label := (BlTextElement text: labelText)
		         background: Color yellow;
		         "margin: (BlInsets all: 5);"
		         "padding: (BlInsets all: 5);"
		         "outskirts: BlOutskirts outside;"
		         border: (BlBorder paint: Color red width: 1).
	label labelMeasurement.

	^ label
]

{ #category : 'examples' }
TextExperiment class >> sampleMeasure [

	<sampleInstance>
	| container |
	container := BlElement new
		             border: (BlBorder paint: Color black width: 2);
		             layout: BlLinearLayout vertical alignCenterLeft ;
		 				padding: (BlInsets all: 5);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ];
		transformDo: [ :t |
			"Zoom in, to better appreciate children details"
			t topLeftOrigin; scaleBy: 3 ].

	container addChildren: {
			BlTextElement text: 'editor measure' asRopedText.
			self sampleEditorMeasure.
			BlTextElement text: 'label measure' asRopedText.
			self sampleLabelMeasure.
			BlTextElement text: 'tight measure' asRopedText.
			self sampletightMeasure }.
	container openInNewSpace.
	^ container
]

{ #category : 'examples' }
TextExperiment class >> sampletightMeasure [

	<sampleInstance>
	| labelText label |
	labelText := 'Sphinx - a := A->B->>C <= c|=>d~~>e.' asRopedText
		             background: Color orange;
		             fontSize: 25;
		             fontName: 'Cascadia Code'.

	label := (BlTextElement text: labelText)
		         background: Color yellow;
		         "margin: (BlInsets all: 5);"
		         "padding: (BlInsets all: 5);"
		         "outskirts: BlOutskirts outside;"
		         border: (BlBorder paint: Color red width: 1).
	label tightMeasurement.

	^ label
]

{ #category : 'examples' }
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

{ #category : 'examples' }
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

{ #category : 'examples' }
TextExperiment class >> textAttributesStyle [

	<sampleInstance>
	| text attributes label element |
	text := 'Hi John' asRopedText.

	element := BlAttributedTextElement new.
	attributes := element attributesBuilder
		              foreground: Color green;
		              monospace;
		              bold;
		              italic;
		              fontSize: 30;
		              fontName: 'Roboto';
		              monospace.

	label := (element text: text)
		         position: 50 @ 10;
		         background: Color yellow;
		         margin: (BlInsets all: 2);
		         padding: (BlInsets all: 2);
		         outskirts: BlOutskirts centered;
		         border: (BlBorder paint: Color red width: 2).

	element text: 'hello world' asRopedText.
	label openInNewSpace.
	^ label
]

{ #category : 'examples' }
TextExperiment class >> textHighlight [

	<sampleInstance>
	| text highlight paint element |
	element := BlElement new
		           layout: (AlbLineFlowLayout new lineSpacing: 10);
		           constraintsDo: [ :c |
			           c horizontal matchParent.
			           c vertical fitContent ].
	paint := Color lightRed. "BlColorPaint new color:"
	highlight := BlTextParagraphHighlight new.
	highlight paint: paint from: 1 to: 5.

	text := BlTextElement new text: 'hello world' asRopedText.
	text highlightWith: highlight.

	element addChild: text.
	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
TextExperiment class >> textHighlightWithCustomCategory [

	<sampleInstance>
	| text highlight paint element |
	element := BlElement new
		           layout: (AlbLineFlowLayout new lineSpacing: 10);
		           constraintsDo: [ :c |
			           c horizontal matchParent.
			           c vertical fitContent ].
	paint := Color lightBlue. "BlColorPaint new color:"
	highlight := BlTextParagraphHighlight new.
	highlight paint: paint from: 1 to: 5.

	text := BlTextElement new text: 'hello world' asRopedText.
	text highlightWith: highlight.
	text
		highlightCategory: #test
		with:
		(BlTextParagraphHighlight new paint: Color yellow from: 6 to: 8).
	text highlightsOfCategory: #test.

	element addChild: text.
	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
TextExperiment class >> textStyler [

	<sampleInstance>
	| text styler label |
	text := 'Hi John' asRopedText.

	styler := BlTextAttributesStyler on: (text from: 3 to: 7).
	styler
		bold;
		italic;
		fontSize: 30;
		fontName: 'Roboto';
		monospace;
		foreground: Color green.
	styler style.

	label := (BlTextElement text: text)
		         position: 50 @ 10;
		         background: Color yellow;
		         margin: (BlInsets all: 2);
		         padding: (BlInsets all: 2);
		         outskirts: BlOutskirts centered;
		         border: (BlBorder paint: Color red width: 2).

	label openInNewSpace.
	^ label
]

{ #category : 'examples' }
TextExperiment class >> textStyler2 [

	<sampleInstance>
	| text styler label |
	text := 'Hi John' asRopedText.

	text attribute: (BlTextBackgroundAttribute paint: (Color red alpha: 0.3)) from: 1 to: 2.
	styler := BlTextAttributesStyler on: (text from: 3 to: 7).
	styler
		bold;
		italic;
		fontSize: 30;
		fontName: 'Roboto';
		monospace;
		foreground: Color green.
	styler style.

	label := (BlTextElement text: text)
		         position: 50 @ 10;
		         background: Color yellow;
		         margin: (BlInsets all: 2);
		         padding: (BlInsets all: 2);
		         outskirts: BlOutskirts centered;
		         border: (BlBorder paint: Color red width: 2).

	label openInNewSpace.
	^ label
]

{ #category : 'examples' }
TextExperiment class >> textStyler3 [

	<sampleInstance>
	| text styler label |
	text := 'Hi John' asRopedText.

	"Setting attribute directly"
	text attribute: (BlTextBackgroundAttribute paint: (Color black)) from: 1 to: 2.

	"fluid syntax"
	(text from: 1 to: 2) stylerDo: [ :aStyler | aStyler bold italic foreground: Color red ].

	"using styler helper class "
	styler := BlTextAttributesStyler on: (text from: 3 to: 7).
	styler
		bold;
		italic;
		fontSize: 30;
		fontName: 'Roboto';
		monospace;
		foreground: Color green.
	styler style.

	label := (BlTextElement text: text)
		         position: 50 @ 10;
		         background: Color yellow;
		         margin: (BlInsets all: 2);
		         padding: (BlInsets all: 2);
		         outskirts: BlOutskirts centered;
		         border: (BlBorder paint: Color red width: 2).

	label openInNewSpace.
	^ label
]

{ #category : 'examples' }
TextExperiment class >> textStylerWithFluentAPI [

	<sampleInstance>
	| text label |
	text := 'Hi John' asRopedText.

	(text from: 3 to: 7) stylerDo: [ :aStyler |
		aStyler bold italic foreground: Color red ].

	label := (BlTextElement text: text)
		         position: 50 @ 10;
		         background: Color yellow;
		         margin: (BlInsets all: 2);
		         padding: (BlInsets all: 2);
		         outskirts: BlOutskirts centered;
		         border: (BlBorder paint: Color red width: 2).

	label openInNewSpace.
	^ label
]

{ #category : 'see class side' }
TextExperiment >> seeClassSide [ 
]
