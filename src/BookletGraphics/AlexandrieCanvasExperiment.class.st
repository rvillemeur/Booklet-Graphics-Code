Class {
	#name : #AlexandrieCanvasExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Alexandrie'
}

{ #category : #examples }
AlexandrieCanvasExperiment >> Outskirts1 [

	<bookExample>
	| canvas |
	canvas := AeCanvas extent: 100 @ 100.
	canvas clear: Color white.
	canvas setBackgroundOff.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 25 @ 25;
			lineTo: 75 @ 25;
			lineTo: 75 @ 75;
			lineTo: 25 @ 75;
			closePath ].


	canvas setOutskirtsOutside.
	canvas
		setSourceColor: Color red;
		setDashes: #( 4 6 ) offset: 2;
		setJoinRound;
		setCapSquare;
		setBorderWidth: 4.

	canvas drawFigure.

	canvas setOutskirtsInside.
	canvas
		setSourceColor: Color blue;
		setDashes: #( 4 6 ) offset: 2;
		setJoinRound;
		setCapSquare;
		setBorderWidth: 4.

	canvas drawFigure.

	canvas setOutskirtsCentered.
	canvas
		setSourceColor: Color yellow;
		setDashes: #( 4 6 ) offset: 2;
		setJoinRound;
		setCapSquare;
		setBorderWidth: 4.

	canvas drawFigure.

	^ canvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> Outskirts2 [

	<bookExample>
	| canvas |
	canvas := AeCanvas extent: 100 @ 100.
	canvas clear: Color white.
	canvas setBackgroundOff.

"keep a buffer of 4, so we can still see outskirts outside"
	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 4 @ 4;
			lineTo: 96 @ 4;
			lineTo: 96 @ 96;
			lineTo: 4 @ 96;
			closePath ].


	canvas setOutskirtsOutside.
	canvas
		setSourceColor: Color red;
		setDashes: #( 4 6 ) offset: 2;
		setJoinRound;
		setCapSquare;
		setBorderWidth: 4.

	canvas drawFigure.

	canvas setOutskirtsInside.
	canvas
		setSourceColor: Color blue;
		setDashes: #( 4 6 ) offset: 2;
		setJoinRound;
		setCapSquare;
		setBorderWidth: 4.

	canvas drawFigure.

	canvas setOutskirtsCentered.
	canvas
		setSourceColor: Color yellow;
		setDashes: #( 4 6 ) offset: 2;
		setJoinRound;
		setCapSquare;
		setBorderWidth: 4.

	canvas drawFigure.

	^ canvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> borderPathPaint1 [

	<bookExample>
	| canvas |
	canvas := AeCanvas extent: 100 @ 100.
	canvas clear: Color white.
"need to either define outskirts, or set border off"
	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 25 @ 25;
			lineTo: 75 @ 25;
			lineTo: 75 @ 75;
			lineTo: 25 @ 75;
			closePath ].

	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.5) ].

	canvas borderPathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 25;
			lineTo: 75 @ 50;
			lineTo: 50 @ 75;
			lineTo: 25 @ 50;
			closePath ].
	canvas setOutskirtsInside  .
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setDashes: #( 4 6 ) offset: 2;
			setJoinRound;
			setCapSquare;
			setBorderWidth: 4 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> borderPathPaint2 [

	<bookExample>
	| canvas |
	canvas := AeCanvas extent: 100 @ 100.
	canvas clear: Color white.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 25 @ 25;
			lineTo: 75 @ 25;
			lineTo: 75 @ 75;
			lineTo: 25 @ 75;
			closePath ].

	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.5) ].

	canvas borderPathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 25;
			lineTo: 75 @ 50;
			lineTo: 50 @ 75;
			lineTo: 25 @ 50;
			closePath ].
	canvas setOutskirtsOutside   .
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setDashes: #( 4 6 ) offset: 2;
			setJoinRound;
			setCapSquare;
			setBorderWidth: 4 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> clip1 [

	<bookExample>
	| canvas form |
	form := PolymorphSystemSettings pharoLogoForm.
	canvas := AeCanvas extent: form extent.

	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: form extent ].

	"first, apply background color"
	canvas clear: (Color purple alpha: 0.5).

	"second, select clipping figure"
	canvas pathFactory: [ :cairoContext |
		cairoContext
			arcCenterX: 180
			centerY: 60
			radius: 50
			startAngle: 0
			endAngle: Float twoPi ].
	canvas setBackgroundWith: [ canvas setSourceColor: (Color white alpha: 0.5) ].
	canvas setBorderOff.
	"don't forget this call"
	canvas drawFigureAndPrepareToClip.

	"third, set the form you want to clip"
	canvas setBackgroundWithForm: form alpha: 1.0.
	canvas setBorderOff.
	canvas drawFigure.

	^ canvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> clip2 [

	<bookExample>
	| canvas form |
	form := PolymorphSystemSettings pharoLogoForm.
	canvas := AeCanvas extent: form extent.

	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: form extent ].

	"first, apply background color"
	canvas clear: (Color purple alpha: 0.5).

	"second, select clipping figure"
	canvas pathFactory: [ :cairoContext |
		cairoContext
			arcCenterX: 180
			centerY: 60
			radius: 50
			startAngle: 0
			endAngle: Float twoPi.
		cairoContext
			arcCenterX: 60
			centerY: 60
			radius: 50
			startAngle: 0
			endAngle: Float twoPi.
		cairoContext
			arcCenterX: 300
			centerY: 60
			radius: 50
			startAngle: 0
			endAngle: Float twoPi ].
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color white alpha: 0.5) ].
	canvas setBorderOff.
	"don't forget this call"
	canvas drawFigureAndPrepareToClip.

	"third, set the form you want to clip"
	canvas setBackgroundWithForm: form alpha: 1.0.
	canvas setBorderOff.
	canvas drawFigure.

	^ canvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> clip3 [

	<bookExample>
	| canvas form |
	form := PolymorphSystemSettings pharoLogoForm.
	canvas := AeCanvas extent: form extent.
	canvas setBorderOff.

	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: form extent ].

	"first, apply background color"
	canvas clear: (Color purple alpha: 0.5).

	"second, select clipping figure"
	canvas pathFactory: [ :cairoContext |
		cairoContext
			arcCenterX: 180
			centerY: 60
			radius: 50
			startAngle: 0
			endAngle: Float twoPi ].
	canvas setBackgroundWith: [ canvas setSourceColor: (Color white alpha: 0.5) ].

	"don't forget this call"
	canvas drawFigureAndPrepareToClip:false.

	"third, set the form you want to clip"
	canvas setBackgroundWithForm: form alpha: 1.0.
	canvas drawFigure.

	^ canvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> example1 [

	<bookExample>
	| aFTLibrary aFace aeCanvas cairoScaledFont fontHeight paint |
	aeCanvas := AeCanvas extent: 400 @ 400.
	aeCanvas clear: Color white.

	paint := PolymorphSystemSettings pharoLogoForm.

	"--------------------------------"
	aeCanvas pathFactory: [ :cairoContext |
		cairoContext rectangle: (0 @ 0 rectangle: 400 @ 400) ].

	aeCanvas setBackgroundWith: [
		aeCanvas
			setSourceLinearPatternStops: {
					(0 -> (Color red alpha: 0.8)).
					(0.166 -> (Color orange alpha: 0.8)).
					(0.332 -> (Color yellow alpha: 0.8)).
					(0.5 -> (Color green alpha: 0.8)).
					(0.664 -> (Color blue alpha: 0.8)).
					(0.83 -> (Color magenta alpha: 0.8)).
					(1 -> (Color purple alpha: 0.8)) }
			start: 0 @ 0
			end: 400 @ 400 ].
	aeCanvas setBorderOff.
	aeCanvas drawFigure.

	"--------------------------------"

	aeCanvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: paint extent ].
	aeCanvas setBackgroundWithForm: paint alpha: 0.2.
	aeCanvas drawFigure.
	"--------------------------------"
	aFTLibrary := AeFTLibrary newInitialized.
	fontHeight := 30.
	aFace := AeSourceSansPro_Regular firstFaceUsing: aFTLibrary.
	cairoScaledFont := aeCanvas scaledFontForFace: aFace size: fontHeight.

	aeCanvas pathTransform: (AeCairoMatrix
			 newX: 20
			 y: 180
			 sx: 1.2
			 sy: 1.2
			 shx: -25 degreesToRadians
			 shy: 25 degreesToRadians).

	"Draw text withOUT Harfbuzz:"
	aeCanvas pathTranslate: 0 @ (fontHeight * 1.1).
	aeCanvas
		setSourceLinearPatternStops: {
				(0 -> (Color white alpha: 0.9)).
				(1 -> (Color black alpha: 0.9)) }
		start: 0 @ 0
		end: 100 @ 150.
	aeCanvas
		drawText:
		(cairoScaledFont glyphArrayForString: 'Hello Alexandrie in Pharo')
		font: cairoScaledFont.

	^ aeCanvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> fillPaint2 [

	<bookExample>
	| canvas form transform|
	transform := AeCairoMatrix newIdentity.
	canvas := AeCanvas extent: 200 @ 200.

	canvas clear: (Color purple alpha: 0.3).
	"linear gradient fill"
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: 100 @ 100 ].
	canvas setBackgroundWith: [
		canvas
			setSourceLinearPatternStops: {
					(0 -> Color white).
					(1 -> Color black) }
			start: 0 @ 0
			end: 100 @ 100 ].
	canvas setBorderOff.
	canvas drawFigure.

	"plain color fill"
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: 100 @ 100 ].
	canvas pathTransform: (transform translateByX: 100 y: 0).
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].
	canvas setBorderOff.
	canvas drawFigure.


	"Bitmap fill".
	form := PolymorphSystemSettings pharoLogoForm.
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: form extent ].
	canvas pathTransform: (transform beIdentity;  translateByX: -100 y: 135; scaleBy: 0.25@0.25).
		canvas
		setBackgroundWithForm: form
		alpha: 1.0.
	canvas setBorderOff.
	canvas drawFigure.

	"Radial gradient fill"
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: 100@100 ].
	canvas setBackgroundWith: [
		canvas
			setSourceRadialPatternStops: {
					(0 -> Color white).
					(1 -> Color black) }
			center: 50 @ 50
			radius: 50 ].
	canvas pathTransform: (transform beIdentity; translateByX: 400 y:-135; scaleBy: 4@4).
	canvas setBorderOff.
	canvas drawFigure.
	^ canvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> fillPaint3 [

	<bookExample>
	| canvas form |
	canvas := AeCanvas extent: 200 @ 200.

	canvas clear: (Color purple alpha: 0.6).
	"linear gradient fill"
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: 100 @ 100 ].
	canvas setBackgroundWith: [
		canvas
			setSourceLinearPatternStops: {
					(0 -> Color white).
					(1 -> Color black) }
			start: 0 @ 0
			end: 100 @ 100 ].
	canvas setBorderOff.
	canvas drawFigure.

	"plain color fill"
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: 100 @ 100 ].
	canvas pathTranslate: 100 @ 0.
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.1) ].
	canvas setBorderOff.
	canvas drawFigure.


	"Bitmap fill"
	form := PolymorphSystemSettings pharoLogoForm.
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: form extent ].
	canvas
		pathTranslate: -100 @ 0135;
		pathScale: 0.25 @ 0.25.
	canvas setBackgroundWithForm: form alpha: 1.0.
	canvas setBorderOff.
	canvas drawFigure.

	"Radial gradient fill"
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: 100 @ 100 ].
	canvas setBackgroundWith: [
		canvas
			setSourceRadialPatternStops: {
					(0 -> Color white).
					(1 -> Color black) }
			center: 50 @ 50
			radius: 50 ].
	canvas
		pathTranslate: 400 @ -135;
		pathScale: 4 @ 4.
	canvas setBorderOff.
	canvas drawFigure.
	^ canvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> mask [

	<bookExample>
	| canvas form |
	form := PolymorphSystemSettings pharoLogoForm.

	canvas := AeCanvas extent: form extent.
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color yellow;
			setBorderWidth: 5.0 ].
	canvas setOutskirtsCentered.

	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: form extent ].

	canvas setBackgroundOff.

	"canvas paintGroupWith: [
		canvas maskGroupWith: [
		AeCairoSurfacePattern surface: (AeCairoImageSurface fromForm: form) ].
		canvas
			setBackgroundWith: [ canvas setSourceColor: Color purple ]
			alpha: 0.5.]."

	canvas paintGroupWith: [
		canvas privateAeCairoContext
			sourceColorRGBA: (Color purple alpha: 0.5);
			mask:
				(AeCairoSurfacePattern surface:
						 (AeCairoImageSurface fromForm: form));
			paint ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : #examples }
AlexandrieCanvasExperiment >> pathPaint1 [

	<bookExample>
	| canvas |
	canvas := AeCanvas extent: 100 @ 100.
	canvas clear: Color white.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 25 @ 25;
			lineTo: 75 @ 25;
			lineTo: 75 @ 75;
			lineTo: 25 @ 75;
			closePath ].

	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].

	canvas setOutskirtsCentered.
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setDashes: #( 4 6 ) offset: 2;
			setJoinRound;
			setCapSquare;
			setBorderWidth: 4 ].

	canvas drawFigure.

	^ canvas asForm
]
