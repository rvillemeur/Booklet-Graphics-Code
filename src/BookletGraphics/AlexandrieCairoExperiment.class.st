Class {
	#name : #AlexandrieCairoExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Alexandrie'
}

{ #category : #examples }
AlexandrieCairoExperiment >> fillPaint3 [

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
	canvas pathTranslate: 100 @ 0.
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].
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

{ #category : #'as yet unclassified' }
AlexandrieCairoExperiment >> radialGradientPattern1 [

	<gtExample>
	| radius center extent mainSurface mainContext aGradient |
	radius := 100.
	center := radius asPoint.
	extent := (radius * 2) asPoint.

	mainSurface := AeCairoImageSurface
		               extent: extent
		               format: AeCairoSurfaceFormat argb32.
	mainContext := mainSurface newContext.

	"paint background"
	mainContext
		sourceColorRGB: Color blue muchDarker;
		paint.

	"draw sphere"
	aGradient := (AeCairoRadialGradientPattern
		              innerCenter: 50 @ 100
		              innerRadius: radius / 5
		              outerCenter: center
		              outerRadius: radius)
		             addStopAt: 0.0 color: Color yellow;
		             addStopAt: 1.0 color: Color red;
		             yourself.
	mainContext
		source: aGradient;
		circleRadius: radius;
		fill.
	"mainSurface inspect"
	^ mainSurface asForm
]
