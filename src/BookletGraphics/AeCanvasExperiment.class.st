"
canvas API example as used by Bloc
"
Class {
	#name : 'AeCanvasExperiment',
	#superclass : 'Object',
	#category : 'BookletGraphics-Bloc',
	#package : 'BookletGraphics',
	#tag : 'Bloc'
}

{ #category : 'examples' }
AeCanvasExperiment class >> PaintAndClip1 [

	<sampleInstance>
	| canvas form |
	form := PolymorphSystemSettings pharoLogoForm.

	canvas := AeCanvas extent: form extent.
	canvas clear: (Color purple alpha: 0.5).
	canvas setBorderOff.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			arcCenterX: 180
			centerY: 60
			radius: 50
			startAngle: 0
			endAngle: Float twoPi ].
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color white alpha: 0.5) ].

	"don't forget this call"
	canvas drawFigureAndPrepareToClip.

	canvas paintGroupWith:  [
		canvas pathFactory: [ :cairoContext |
			cairoContext rectangleTo: form extent ].
		canvas setBackgroundWithForm: form alpha: 0.5.
		canvas drawFigure ].

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> backGround1 [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 500 @ 500.
	canvas clear: Color white.


"keep a buffer of 4, so we can still see outskirts outside"
	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 20 @ 20;
			lineTo: 480 @ 20;
			lineTo: 480 @ 480;
			lineTo: 20 @ 480;
			closePath ].


	canvas setBackgroundWith: [ canvas setSourceSolidColor: Color  red].

	canvas setBorderOff .
	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> backGround2 [

	<sampleInstance>
	| canvas form |
	canvas := AeCanvas extent: 500 @ 500.
	canvas clear: Color white.
	canvas setBorderOff.

	form := Smalltalk ui icons iconNamed: #pharoBig.
	canvas pathScale: (canvas extent / form extent) asFloatPoint.
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: form extent ].


	canvas setBackgroundWithForm: form alpha: 0.5.

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> backGround3 [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 500 @ 500.
	canvas clear: Color white.
	canvas setBorderOff.

	"keep a buffer of 4, so we can still see outskirts outside"
	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 20 @ 20;
			lineTo: 480 @ 20;
			lineTo: 480@ 480;
			lineTo: 20 @ 480;
			closePath ].


	canvas
		setBackgroundWith: [
			canvas
				setSourceLinearPatternStops: {
						(0 -> Color red).
						(1 -> Color black) }
				start: 0 @ 0
				end: 500 @ 500 ]
		alpha: 0.5.


	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> backGround4 [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 500 @ 500.
	canvas clear: Color white.
	canvas setBorderOff.

	"keep a buffer of 4, so we can still see outskirts outside"
	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 20 @ 20;
			lineTo: 480 @ 20;
			lineTo: 480@ 480;
			lineTo: 20 @ 480;
			closePath ].


	canvas
		setBackgroundWith: [
			canvas
				setSourceRadialPatternStops:  {
						(0 -> Color red).
						(1 -> Color black) }
				innerCenter: 50 @ 50
				innerRadius: 500
				outerCenter: 480 @ 480
				outerRadius:  30 ]
		alpha: 0.95.


	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> borderPathPaintOutskirtsCentered [

	<sampleInstance>
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
	canvas setOutskirtsCentered   .
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

{ #category : 'examples' }
AeCanvasExperiment class >> borderPathPaintOutskirtsInside [

	<sampleInstance>
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

{ #category : 'examples' }
AeCanvasExperiment class >> borderPathPaintOutskirtsOutside [

	<sampleInstance>
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

{ #category : 'examples' }
AeCanvasExperiment class >> clip1 [

	<sampleInstance>
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

{ #category : 'examples' }
AeCanvasExperiment class >> clip2 [

	<sampleInstance>
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

{ #category : 'examples' }
AeCanvasExperiment class >> clip3 [

	<sampleInstance>
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

{ #category : 'examples' }
AeCanvasExperiment class >> example1 [

	<sampleInstance>
	| aManager aFace aeCanvas cairoScaledFont fontHeight paint anAlexandrieCanvasExperiment |
	anAlexandrieCanvasExperiment := self new.
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

	aManager := AeFontManager globalInstance.
	aManager
		scanDirectory: AeFilesystemResources fontsDirectory;
		scanEmbeddedFonts.

	fontHeight := 23.
	aFace := aManager
		         detectFamilyName: 'Inria Serif'
		         slant: AeFontSlant normal
		         weight: AeFontWeight normal
		         stretch: AeFontStretch normal
		         ifNone: [
		         anAlexandrieCanvasExperiment inform: 'missing font' ].

	cairoScaledFont := aeCanvas scaledFontForFace: aFace size: fontHeight.

	aeCanvas pathTransform: (AeCairoMatrix
			 newX: 20
			 y: 180
			 sx: 1.2
			 sy: 1.2
			 shx: -25 degreesToRadians
			 shy: 25 degreesToRadians).

	aeCanvas pathTranslate: 0 @ (fontHeight * 1.1).
	aeCanvas
		setSourceLinearPatternStops: {
				(0 -> (Color red alpha: 0.9)).
				(1 -> (Color black alpha: 0.9)) }
		start: 0 @ 0
		end: 100 @ 150.
	aeCanvas
		drawGlyphs:
		(cairoScaledFont glyphArrayForString: 'Hello AeCanvas in Pharo Bloc')
		font: cairoScaledFont.

	^ aeCanvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> exampleLineCapButt [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 200 @ 100.
	canvas clear: Color white.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 50;
			lineTo: 150 @ 50;
			closePath ].

	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].

	canvas setOutskirtsCentered .
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setDashes: #( 4 16 ) offset: 2;
			setJoinBevel ;
			setCapButt ;
			setBorderWidth: 10 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> exampleLineCapRound [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 200 @ 100.
	canvas clear: Color white.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 50;
			lineTo: 150 @ 50;
			closePath ].

	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].

	canvas setOutskirtsCentered .
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setDashes: #( 4 16 ) offset: 2;
			setJoinRound;
			setCapRound ;
			setBorderWidth: 10 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> exampleLineCapSquare [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 200 @ 100.
	canvas clear: Color white.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 50;
			lineTo: 150 @ 50;
			closePath ].

	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].

	canvas setOutskirtsCentered .
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setDashes: #( 4 16 ) offset: 2;
			setJoinBevel ;
			setCapSquare;
			setBorderWidth: 10 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> exampleLineCapSquareWithOutskirtsInside [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 200 @ 100.
	canvas clear: Color white.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 50;
			lineTo: 150 @ 50;
			closePath ].

	canvas borderPathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 50;
			lineTo: 150 @ 50;
			closePath ].
		
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].

	canvas setOutskirtsInside .
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setDashes: #( 4 16 ) offset: 2;
			setJoinRound;
			setCapSquare;
			setBorderWidth: 10 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> exampleLineJoinBevel [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 200 @ 200.
	canvas clear: Color white.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 50;
			lineTo: 150 @ 50;
			lineTo: 150@150 ].

	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].

	canvas setOutskirtsCentered.
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setJoinBevel ;
			setCapSquare;
			setBorderWidth: 10 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> exampleLineJoinMiterLimit0 [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 200 @ 200.
	canvas clear: Color white.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 50;
			lineTo: 150 @ 50;
			lineTo: 150@150 ].

	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].

	canvas setOutskirtsCentered.
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setJoinMiter: 0 ;
			setCapSquare;
			setBorderWidth: 10 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> exampleLineJoinMiterLimit10 [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 200 @ 200.
	canvas clear: Color white.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 50;
			lineTo: 150 @ 50;
			lineTo: 150@150 ].

	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].

	canvas setOutskirtsInside .
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setJoinMiter: 10 ;
			setCapSquare;
			setBorderWidth: 10 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> exampleLineJoinRound [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 200 @ 200.
	canvas clear: Color white.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 50 @ 50;
			lineTo: 150 @ 50;
			lineTo: 150@150 ].

	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].

	canvas setOutskirtsCentered.
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setJoinRound;
			setCapSquare;
			setBorderWidth: 10 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> fillPaint2 [

	<sampleInstance>
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
			innerCenter: 50 @ 50
		            innerRadius: 50
		            outerCenter: 80 @ 80
		            outerRadius: 0
		             ].
	canvas pathTransform: (transform beIdentity; translateByX: 400 y:-135; scaleBy: 4@4).
	canvas setBorderOff.
	canvas drawFigure.
	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> fillPaint3 [

	<sampleInstance>
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
					(0 -> Color black).
					(1 -> Color white) }
			innerCenter: 50 @ 50
			innerRadius: 50
			outerCenter: 80 @ 80
			outerRadius: 0 ].
	canvas
		pathTranslate: 400 @ -135;
		pathScale: 4 @ 4.
	canvas setBorderOff.
	canvas drawFigure.
	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> mask2 [

	<sampleInstance>
	| canvas form |
	form := PolymorphSystemSettings pharoLogoForm.

	canvas := AeCanvas extent: form extent.

	canvas setBorderBlock: [
		canvas
			setSourceColor: Color yellow;
			setBorderWidth: 5.0 ].
	canvas setOutskirtsCentered.
	
	canvas maskGroupWith: [
		canvas pathFactory: [ :cairoContext |
			cairoContext rectangleTo: form extent ].
		canvas setBackgroundWithForm: form alpha: 0.5.
		canvas drawFigure ].

	canvas pathFactory: [ :cairoContext | cairoContext rectangleTo: form extent ].
	canvas setBackgroundWith: [ canvas setSourceColor: (Color purple alpha: 0.5) ].
	canvas drawFigure.
	
	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> mask3 [

	<sampleInstance>
	| canvas |
	canvas := AeCanvas extent: 150 @ 150.

	canvas maskGroupWith: [
		canvas pathTranslate: 10 @ 20.
		canvas pathFactory: [ :cairoContext |
			cairoContext
				moveTo: 10 @ 10;
				lineTo: 100 @ 10;
				lineTo: 100 @ 100;
				lineTo: 10 @ 100;
				closePath ].
		canvas setBorderBlock: [
			canvas
				setSourceColor: (Color orange);
				setBorderWidth: 5.0 ].
		canvas setOutskirtsCentered.
		canvas setBackgroundWith: [
			canvas setSourceColor: (Color orange alpha: 0.5) ].
		canvas drawFigure ].

	canvas pathFactory: [ :cairoContext |
		cairoContext
			moveTo: 10 @ 10;
			lineTo: 100 @ 10;
			lineTo: 100 @ 100;
			lineTo: 10 @ 100;
			closePath ].
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color yellow;
			setBorderWidth: 5.0 ].
	canvas setOutskirtsCentered.
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color red alpha: 0.5) ].
	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> mask4 [

	<sampleInstance>
	| canvas form |
	form := PolymorphSystemSettings pharoLogoForm.

	canvas := AeCanvas extent: form extent.
	canvas setBorderOff.

	canvas pathFactory: [ :cairoContext | cairoContext rectangleTo: form extent ].
	canvas setBackgroundWith: [ canvas setSourceColor: (Color purple alpha: 0.5) ].
	canvas drawFigure.

	canvas maskGroupWith: [
		canvas setBackgroundWithForm: form alpha: 0.5.
		canvas drawFigure ].

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> maskAndClip1 [

	<sampleInstance>
	| canvas form |
	form := PolymorphSystemSettings pharoLogoForm.

	canvas := AeCanvas extent: form extent.
	canvas clear: (Color purple alpha: 0.5).
	canvas setBorderOff.

	canvas pathFactory: [ :cairoContext |
		cairoContext
			arcCenterX: 180
			centerY: 60
			radius: 50
			startAngle: 0
			endAngle: Float twoPi ].
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color white alpha: 0.5) ].

	"don't forget this call"
	canvas drawFigureAndPrepareToClip.

	canvas maskGroupWith:   [
		canvas pathFactory: [ :cairoContext |
			cairoContext rectangleTo: form extent ].
		canvas setBackgroundWithForm: form alpha: 0.5.
		canvas drawFigure ].

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> maskWithPrivateContext [

	<sampleInstance>
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

	canvas paintGroupWith: [
		canvas privateAeCairoContext
			sourceColor: (Color purple alpha: 0.5);
			mask:
				(AeCairoSurfacePattern surface:
						 (AeCairoImageSurface fromForm: form));
			paint ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> pathPaintOutskirtsCentered [

	<sampleInstance>
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

	canvas setOutskirtsCentered .
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setDashes: #( 20 10 10 10  ) offset: 0;
			setJoinRound;
			setCapSquare;
			setBorderWidth: 4 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> pathPaintOutskirtsInside [

	<sampleInstance>
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

	canvas setOutskirtsInside .
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setDashes: #( 20 10 10 10  ) offset: 0;
			setJoinRound;
			setCapSquare;
			setBorderWidth: 4 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> pathPaintOutskirtsOutside [

	<sampleInstance>
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

	canvas setOutskirtsOutside .
	canvas setBorderBlock: [
		canvas
			setSourceColor: Color red;
			setDashes: #( 20 10 10 10  ) offset: 0;
			setJoinRound;
			setCapSquare;
			setBorderWidth: 4 ].

	canvas drawFigure.

	^ canvas asForm
]

{ #category : 'examples' }
AeCanvasExperiment class >> textWithOrWithoutHarfbuzz [

	<sampleInstance>
	| aManager aFace aeCanvas cairoScaledFont fontHeight string  |
	"font definition"
	AeFontManager resetGlobalInstance.
	aManager := AeFontManager globalInstance.
	aManager
		scanDirectory: AeFilesystemResources fontsDirectory;
		scanEmbeddedFonts.

	aFace := aManager
		         detectFamilyName: 'Cascadia Code'
		         slant: AeFontSlant normal
		         weight: AeFontWeight normal
		         stretch: AeFontStretch normal
		         ifNone: [
		         self inform: 'missing font' ].



	"~~>, ->, <=, |=>  and ->> have special representation using cascadia font.
see 
https://github.com/microsoft/cascadia-code/blob/main/images/arrow_support.png 
and 
https://github.com/microsoft/cascadia-code/blob/main/images/ligatures.png

Used together, HarfBuzz can perform shaping on Unicode text segments, outputting 
the glyph IDs that FreeType should rasterize from the active font as well as the 
positions at which those glyphs should be drawn. "

	string := 'a := A->B->>C <= c|=>d~~>e.'.
	fontHeight := 22.

	aeCanvas := AeCanvas extent: 400 @ (fontHeight * 3).
	aeCanvas clear: Color white.

	cairoScaledFont := aeCanvas scaledFontForFace: aFace size: fontHeight.

	"Margin"
	aeCanvas pathTranslate: fontHeight / 2 @ 0.

	"Draw text withOUT Harfbuzz:"
	aeCanvas pathTranslate: 0 @ (fontHeight * 1.1).
	aeCanvas setSourceColor: Color red muchDarker.
	aeCanvas
		drawGlyphs: (cairoScaledFont glyphArrayForString: string)
		font: cairoScaledFont.

	"Draw text with Harfbuzz:"
	aeCanvas pathTranslate: 0 @ (fontHeight * 1.1).
	aeCanvas setSourceColor: Color green muchDarker.
	aeCanvas
		drawGlyphs: (AeHbBuffer new
				 direction: AeHbDirection leftToRight;
				 script: AeHbScript latin;
				 language: AeHbLanguage en;
				 clusterLevel: AeHbBufferClusterLevel recommended;
				 flags: AeHbBufferFlags beginningOrEndingOfText;
				 addString: string;
				 cairoGlyphArrayForFace: aFace size: fontHeight)
		font: cairoScaledFont.

	^ aeCanvas asForm
]

{ #category : 'see class side' }
AeCanvasExperiment >> seeClassSide [ 
]
