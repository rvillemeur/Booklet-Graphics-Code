Class {
	#name : #AlexandrieCairoExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Alexandrie'
}

{ #category : #examples }
AlexandrieCairoExperiment >> fillPaint1 [

	<gtExample>
	| surface context gradient |
	surface := AeCairoImageSurface extent: 700 @ 500 format: AeCairoSurfaceFormat argb32.
	context := surface newContext.
	
	context sourceColorRGB: (Color red); paint.


	"green rectangle"
	context sourceColorRGB: (Color green); rectangle: (100@100 extent: 100 @ 100) ; fill.
	
	"yellow border around the rectangle"
	context sourceColorRGB: (Color yellow); rectangle: (100@100 extent: 100 @ 100) ; stroke.
	
	"draw a blue triangle"
	context moveTo: 300@100; lineTo: 400@100; lineTo: 400@200; closePath; sourceColorRGB: (Color blue); stroke.
	
	"black circle"
	context arcCenterX: 150 centerY: 350 radius: 50 startAngle: 0 endAngle: Float twoPi; sourceColorRGB: (Color black); stroke. 
	
	"Thick magenta line"
	context lineWidth: 15; moveTo: 300@350; relativeLineTo: 100@0; sourceColorRGB: (Color magenta ); stroke.
	"canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: 100 @ 100 ].
	canvas pathTranslate: 100 @ 0.
	canvas setBackgroundWith: [
		canvas setSourceColor: (Color yellow alpha: 0.9) ].
	canvas setBorderOff.
	canvas drawFigure."


	"Bitmap fill"
	"form := PolymorphSystemSettings pharoLogoForm.
	canvas pathFactory: [ :cairoContext |
		cairoContext rectangleTo: form extent ].
	canvas
		pathTranslate: -100 @ 0135;
		pathScale: 0.25 @ 0.25.
	canvas setBackgroundWithForm: form alpha: 1.0.
	canvas setBorderOff.
	canvas drawFigure."

	"Radial gradient fill"
	"canvas pathFactory: [ :cairoContext |
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
	canvas drawFigure."
	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> fillPaint3 [

	<gtExample>
	| surface context gradient form |
	surface := AeCairoImageSurface
		           extent: 200 @ 200
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: (Color purple alpha: 0.5);
		paint.
	"linear gradient fill"
	gradient := AeCairoLinearGradientPattern
		            from: 0 @ 0
		            to: 100 @ 100
		            addStopsFrom: {
				            (0 -> Color white).
				            (1 -> Color black) }.
	context
		source: gradient;
		rectangleTo: 100 @ 100;
		fill.

	"plain color fill"
	context
		sourceColorRGBA: (Color yellow alpha: 0.2);
		rectangle: (100 @ 0 extent: 100 @ 100);
		fill.

	"Bitmap fill"
	form := AeCairoImageSurface fromForm:
		        PolymorphSystemSettings pharoLogoForm.
	context
		rectangle: (0 @ 100 extent: form extent + 100 @ 200);
		translateByX: 0 y: 135;
		scaleByX: 0.25 y: 0.25;
		sourceSurface: form x: 0 y: 0;
		fill.

	"Radial gradient fill"
	gradient := AeCairoRadialGradientPattern
		            innerCenter: 50 @ 50
		            innerRadius: 50
		            outerCenter: 80 @ 80
		            outerRadius: 0
		            addStopsFrom: {
				            (0 -> Color black).
				            (1 -> Color white) }.

	"context scaleByX: 4 y: 4; translateByX: 0 y: 0."
	context
		scaleByX: 4 y: 4;
		translateByX: 100 y: -35;
		rectangleTo: 100 @ 100;
		source: gradient.

	context fill.

	^ surface asForm
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
