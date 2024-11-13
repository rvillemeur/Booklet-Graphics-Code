Class {
	#name : 'BlocPresentationHelper',
	#superclass : 'Object',
	#category : 'BookletGraphics-Bloc',
	#package : 'BookletGraphics',
	#tag : 'Bloc'
}

{ #category : 'examples' }
BlocPresentationHelper class >> AllAlexandrieCairoOperatorExample [

	<sampleInstance>
	| container space elements|
	space := BlSpace new.
	container := BlElement new
		        border: (BlBorder paint: Color red width: 1);
		        background: (Color red alpha: 0.2);
		        layout: BlFlowLayout horizontal;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical fitContent ].


	elements := Dictionary new.
	elements at: 'Add' put: AlexandrieCairoExperiment operatorAdd.
	elements at: 'ATop' put: AlexandrieCairoExperiment operatorAtop.
	elements at: 'Clear' put: AlexandrieCairoExperiment operatorClear.
	elements at: 'Color Burn' put: AlexandrieCairoExperiment operatorColorBurn.
	elements at: 'Color Dodge' put: AlexandrieCairoExperiment operatorColorDodge.
	elements at: 'Darken' put: AlexandrieCairoExperiment operatorDarken.
	elements at: 'Dest' put: AlexandrieCairoExperiment operatorDest.
	elements at: 'DestATop' put: AlexandrieCairoExperiment operatorDestAtop.
	elements 	at: 'Dest In' put: AlexandrieCairoExperiment operatorDestIn.
	elements at: 'Dest Out' put: AlexandrieCairoExperiment operatorDestOut.
	elements at: 'Dest Over' put: AlexandrieCairoExperiment operatorDestOver.
	elements at: 'Difference' put: AlexandrieCairoExperiment operatorDifference.
	elements at: 'Exclusion' put: AlexandrieCairoExperiment operatorExclusion.
	elements at: 'HSL Color' put: AlexandrieCairoExperiment operatorHSLColor.
	elements at: 'HSL Hue' put: AlexandrieCairoExperiment operatorHSLHue.
	elements 	at: 'HSL Luminosity' put: AlexandrieCairoExperiment operatorHSLLuminosity.
	elements at: 'HSL Saturation' put: AlexandrieCairoExperiment operatorHSLSaturation.
	elements at: 'Hard Light' put: AlexandrieCairoExperiment operatorHardLight.
	elements at: 'In' put: AlexandrieCairoExperiment operatorIn.
	elements at: 'Lighten' put: AlexandrieCairoExperiment operatorLighten.
	elements at: 'Multiply' put: AlexandrieCairoExperiment operatorMultiply.
	elements at: 'Out' put: AlexandrieCairoExperiment operatorOut.
	elements 	at: 'Over' put: AlexandrieCairoExperiment operatorOver.
	elements at: 'Overlay' put: AlexandrieCairoExperiment operatorOverlay.
	elements at: 'Saturate' put: AlexandrieCairoExperiment operatorSaturate.
	elements at: 'Screen' put: AlexandrieCairoExperiment operatorScreen.
	elements 	at: 'Soft Light' put: AlexandrieCairoExperiment operatorSoftLight.
	elements at: 'Source' put: AlexandrieCairoExperiment operatorSource.
	elements at: 'XOR' put: AlexandrieCairoExperiment operatorXor.
	
	elements keysAndValuesDo: [ :key :value | container addChild: (self boxForm: value text: key) ].

	space root addChild: container.

	space show.
	^ space
]

{ #category : 'examples' }
BlocPresentationHelper class >> AllAlexandrieCanvasBackgroundExample [

	<sampleInstance>
	| container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 5);
		             padding: (BlInsets all: 5);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 5);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].
	"size: 450 @ 150;"

	container addChild:
		(self boxForm: AeCanvasExperiment backGround1 text: 'Solid Color').
	container addChild:
		(self boxForm: AeCanvasExperiment backGround2 text: 'Form picture').
	container addChild:
		(self boxForm: AeCanvasExperiment backGround3 text: 'linear gradient').
		container addChild:
		(self boxForm: AeCanvasExperiment backGround4 text: 'radial gradient').
	space root addChild: container.
	space show.
	^ space
]

{ #category : 'examples' }
BlocPresentationHelper class >> AllAlexandrieCanvasLineCapExample [

	<sampleInstance>
	| container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 5);
		             padding: (BlInsets all: 5);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 5);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].
	"size: 450 @ 150;"

	container addChild:
		(self boxForm: AeCanvasExperiment exampleLineCapRound text: 'line cap round').
	container addChild:
		(self boxForm: AeCanvasExperiment exampleLineCapSquare text: 'line cap square').
	container addChild:
		(self boxForm: AeCanvasExperiment exampleLineCapButt text: 'line cap butt').
	space root addChild: container.
	space show.
	^ space
]

{ #category : 'examples' }
BlocPresentationHelper class >> AllAlexandrieCanvasLineJoinExample [

	<sampleInstance>
	| container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 5);
		             padding: (BlInsets all: 5);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 5);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].
	"size: 450 @ 150;"

	container addChild:
		(self boxForm: AeCanvasExperiment exampleLineJoinRound text: 'line cap round').
	container addChild:
		(self boxForm: AeCanvasExperiment exampleLineJoinBevel text: 'line cap square').
	container addChild:
		(self boxForm: AeCanvasExperiment exampleLineJoinMiterLimit0 text: 'line cap butt').
	space root addChild: container.
	space show.
	^ space
]

{ #category : 'examples' }
BlocPresentationHelper class >> allGeometryExample [

	<sampleInstance>
	| space root elements  |
	space := BlSpace new.

	root := BlElement new
		        border: (BlBorder paint: Color red width: 1);
		        background: (Color red alpha: 0.2);
		        layout: BlFlowLayout horizontal;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical fitContent ].


	elements := Dictionary new.
	elements at: 'annulus' put: GeometryExperiment annulus.
	elements at: 'bezier' put: GeometryExperiment bezier.
	elements at: 'circle' put: GeometryExperiment circle.
	elements at: 'ellipse' put: GeometryExperiment ellipse.
	elements at: 'line' put: GeometryExperiment line.
	elements at: 'polygon' put: GeometryExperiment polygon.
	elements at: 'polyline' put: GeometryExperiment polyline.
	elements at: 'rectangle' put: GeometryExperiment rectangle.
	elements
		at: 'rounded rectangle'
		put: GeometryExperiment roundedRectangle.
	elements at: 'square' put: GeometryExperiment square.
	elements at: 'triangle' put: GeometryExperiment triangle.
	elements keysAndValuesDo: [ :key :value |
		root addChild: (self box: value text: key) ].

	space root addChild: root.

	space show.
	^ space
]

{ #category : 'examples - helpers' }
BlocPresentationHelper class >> background [

	^ Color yellow
]

{ #category : 'examples - helpers' }
BlocPresentationHelper class >> border [

	^ BlBorder paint: Color red width: 5
]

{ #category : 'examples - helpers' }
BlocPresentationHelper class >> box: element text: aText [

	| container elt1 elt2 text |
	container := BlElement new
		             border: (BlBorder paint: Color blue width: 1);
		             background: (Color blue alpha: 0.2);
		             layout: BlLinearLayout vertical;
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	elt1 := BlElement new
		        size: self boxSize;
		        background: (Color orange alpha: 0.2);
		        border: (BlBorder paint: Color orange width: 1);
		        layout: BlFrameLayout new.

	element constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ];
	size: self boxSize -25.

	elt1 addChild: element.


	elt2 := BlElement new
		        size: self textSize;
		        background: (Color orange alpha: 0.2);
		        border: (BlBorder paint: Color orange width: 1);
		        layout: BlFrameLayout new.

	text := BlTextElement new
		        position: 5 @ 5;
		        text: (aText asRopedText attributes:
					         { (BlTextForegroundAttribute paint: Color black) });
		        constraintsDo: [ :c |
			        c frame horizontal alignCenter.
			        c frame vertical alignCenter ].
	elt2 addChild: text.

	container addChildren: {
			elt1.
			elt2 }.
	^ container
]

{ #category : 'examples - helpers' }
BlocPresentationHelper class >> boxForm: element text: aText [

	| container img elt1 elt2 text |
	container := BlElement new
		             layout: BlLinearLayout vertical;
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	elt1 := BlElement new
		        layout: BlFrameLayout new;
		        constraintsDo: [ :c |
			        c horizontal fitContent.
			        c vertical fitContent ].

	img := BlElement new background: (BlImageBackground image: element); size: element extent.
	img constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].

	elt1 addChild: img.


	elt2 := BlElement new
		        layout: BlFrameLayout new;
		        padding: (BlInsets all: 3);
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ].

	text := BlTextElement new
		        position: 5 @ 5;
		        text: (aText asRopedText attributes:
					         { (BlTextForegroundAttribute paint: Color black) . (BlFontSizeAttribute size: 18)});
		        constraintsDo: [ :c |
			        c frame horizontal alignCenter.
			        c frame vertical alignCenter ].
	elt2 addChild: text.

	container addChildren: {
			elt1.
			elt2 }.
	^ container
]

{ #category : 'accessing' }
BlocPresentationHelper class >> boxSize [

	^ 225 @ 150
]

{ #category : 'examples' }
BlocPresentationHelper class >> multipleElementCapExample [

	<sampleInstance>
	| container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].
	container addChild:
		(self box: BackgroundAndBorderExperiment exampleLineCapButt text: 'cap butt').
	container addChild:
		(self box: BackgroundAndBorderExperiment exampleLineCapRound text: 'cap round').
	container addChild:
		(self box: BackgroundAndBorderExperiment exampleLineCapSquare text: 'cap square').

	space root addChild: container.
	space show.
	^ space
]

{ #category : 'examples' }
BlocPresentationHelper class >> multipleElementJoinExample [

	<sampleInstance>
	| container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].
	container addChild:
		(self box: BackgroundAndBorderExperiment exampleLineJoinBevel text: 'join bevel').
	container addChild:
		(self box: BackgroundAndBorderExperiment exampleLineJoinRound text: 'join round').
	container addChild:
		(self box: BackgroundAndBorderExperiment exampleLineJoinMiter text: 'join miter').
	space root addChild: container.
	space show.
	^ space
]

{ #category : 'examples' }
BlocPresentationHelper class >> multipleElementOutskirts [

	<sampleInstance>
	| container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 5);
		             padding: (BlInsets all: 5);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 5);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].
	"size: 450 @ 150;"

	container addChild:
		(self box: BackgroundAndBorderExperiment outskirtsOutside text: 'outskirts outside').
	container addChild:
		(self box: BackgroundAndBorderExperiment outskirtsCentered text: 'outskirts centered').
	container addChild:
		(self box: BackgroundAndBorderExperiment outskirtsInside text: 'outskirts inside').
	space root addChild: container.
	space show.
	^ space
]

{ #category : 'examples' }
BlocPresentationHelper class >> multipleTriangleBackground [

	<sampleInstance>
	| container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	container addChild:
		(self box: BackgroundAndBorderExperiment triangleBackgroundImage text: 'image').
	container addChild:
		(self box: BackgroundAndBorderExperiment triangleBackgroundSolidColor text: 'solid color').
	container addChild:
		(self box: BackgroundAndBorderExperiment triangleBackgroundLinearColor text: 'linear color').
	container addChild:
		(self box: BackgroundAndBorderExperiment triangleBackgroundRadialColor text: 'radial color').

	space root addChild: container.
	space show.
	^ space
]

{ #category : 'examples' }
BlocPresentationHelper class >> multipleTriangleBorderColor [

	<sampleInstance>
	| container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	container addChild:
		(self box: BackgroundAndBorderExperiment triangleBorderSolidColor text: 'solid color').
	container addChild:
		(self box: BackgroundAndBorderExperiment triangleBorderLinearGradient text: 'linear color').
	container addChild:
		(self box: BackgroundAndBorderExperiment triangleBorderRadialGradient text: 'radial color').

	space root addChild: container.
	space show.
	^ space
]

{ #category : 'examples' }
BlocPresentationHelper class >> multipleTriangleDashed [

	<sampleInstance>
	| container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	container addChild:
		(self box: BackgroundAndBorderExperiment triangleDashedSmall text: 'dashedSmall').
	container addChild: (self
			 box: BackgroundAndBorderExperiment triangleDashedArray
			 text: 'dashOffset: 0; dashArray: #( 6 4 2 )').
	container addChild:
		(self box: BackgroundAndBorderExperiment triangleDashedNormal text: 'dashed').
	space root addChild: container.
	space show.
	^ space
]

{ #category : 'examples' }
BlocPresentationHelper class >> multipleTriangleWithCapAndJoin [

	<sampleInstance>
	| container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	container addChild:
		(self box: BackgroundAndBorderExperiment triangleJoinRound text: 'round join').
	container addChild:
		(self box: BackgroundAndBorderExperiment triangleJoinBevel text: 'bevel join').
	container addChild:
		(self box: BackgroundAndBorderExperiment triangleJoinMiter text: 'miter join').
	space root addChild: container.
	space show.
	^ space
]

{ #category : 'accessing' }
BlocPresentationHelper class >> textSize [

	^ 225 @ 25
]

{ #category : 'see class side' }
BlocPresentationHelper >> seeClassSide [ 
]
