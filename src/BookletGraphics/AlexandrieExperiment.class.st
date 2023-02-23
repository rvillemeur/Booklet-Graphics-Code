Class {
	#name : #AlexandrieExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Alexandrie'
}

{ #category : #examples }
AlexandrieExperiment >> example1 [
<gtExample>
	| aFTLibrary aFace aeCanvas cairoScaledFont fontHeight|
	aFTLibrary := AeFTLibrary newInitialized.
	fontHeight := 30.
	aFace := AeSourceSansPro_Regular firstFaceUsing: aFTLibrary.

	aeCanvas := AeCanvas extent: 400 @ 400.
	aeCanvas clear: Color white.
	"--------------------------------"
		aeCanvas pathFactory: [ :cairoContext |
		cairoContext rectangle: (0@0 rectangle: 400@400) ].

	aeCanvas setBackgroundWith: [
	aeCanvas setSourceLinearPatternStops: {
					 (0 -> (Color red alpha: 0.8)).
					 (0.166 -> (Color orange alpha: 0.8)).
					 (0.332 -> (Color yellow alpha: 0.8)).
					 (0.5 -> (Color green alpha: 0.8)).
					 (0.664 -> (Color blue alpha: 0.8)).
					 (0.83 -> (Color magenta alpha: 0.8)).
					 (1 -> (Color purple alpha: 0.8)) } start: 0@0 end: 400@400 ].
	aeCanvas setBorderOff.
	aeCanvas drawFigure.
	
		"--------------------------------"
	cairoScaledFont := aeCanvas scaledFontForFace: aFace size: fontHeight.

	aeCanvas pathTransform:
		(AeCairoMatrix
			 newX: 20
			 y: 180
			 sx: 1.2
			 sy: 1.2
			 shx: -25 degreesToRadians 
			 shy: 25 degreesToRadians).
			
		"Draw text withOUT Harfbuzz:"
	aeCanvas pathTranslate: 0 @ (fontHeight*1.1).
	aeCanvas setSourceLinearPatternStops: {
					 (0 -> (Color white alpha: 0.9)).
					 (1 -> (Color black alpha: 0.9)) } start: 0@0 end: 100@150.
	aeCanvas
		drawText: (cairoScaledFont glyphArrayForString: 'Hello Alexandrie in Pharo')
		font: cairoScaledFont.

^aeCanvas asForm
]

{ #category : #examples }
AlexandrieExperiment >> fillPaint1 [

	<gtExample>
	| canvas |
	canvas := AeCanvas extent: 200 @ 200.

	canvas clear: (Color purple alpha: 0.3).
	"linear gradient fill"
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangle: (0 @ 0 rectangle: 100 @ 100) ].
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
		cairoContext rectangle: (100 @ 0 rectangle: 200 @ 100) ].
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].
	canvas setBorderOff.
	canvas drawFigure.


	"Bitmap fill"
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: 100@100].
	canvas
		setBackgroundWithForm: PolymorphSystemSettings pharoLogoForm
		alpha: 1.0.
	canvas pathTransform:
		(AeCairoMatrix
			 newX: 0
			 y: 135
			 sx: 0.5
			 sy: 0.5
			 shx: 0  
			 shy: 0).
	canvas setBorderOff.
	canvas pathTransform: (AeCairoMatrix newIdentity ).
	canvas drawFigure.


	"Radial gradient fill"
		canvas pathTransform:
		(AeCairoMatrix
			 newX: 0
			 y: 10
			 sx: 0
			 sy: 0
			 shx: 0  
			 shy: 0).
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangle: (100 @ 100 rectangle: 200 @ 200) ].
	canvas setBackgroundWith: [
		canvas
			setSourceRadialPatternStops: {
					(0 -> Color white).
					(1 -> Color black) }
			center: 150 @ 150
			radius: 50 ].
	canvas setBorderOff.
	canvas drawFigure.
	^ canvas asForm
]

{ #category : #examples }
AlexandrieExperiment >> fillPaint2 [

	<gtExample>
	| canvas form |
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
	canvas pathTransform: (AeCairoMatrix newTranslationBy: 100 @ 0).
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].
	canvas setBorderOff.
	canvas drawFigure.


	"Bitmap fill".
	form := PolymorphSystemSettings pharoLogoForm.
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: form extent ].
	canvas pathTransform: ((AeCairoMatrix newTranslationByX: -100 y: 135) scaleBy: 0.25@0.25).
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
	canvas pathTransform: (AeCairoMatrix newIdentity translateByX: 100 y:-135).
	canvas setBorderOff.
	canvas drawFigure.
	^ canvas asForm
]
