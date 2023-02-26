Class {
	#name : #AlexandrieCairoExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Alexandrie'
}

{ #category : #examples }
AlexandrieCairoExperiment >> clip1 [

	<gtExample>
	| surface context form |
	form := AeCairoImageSurface fromForm:
		        PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

context
		sourceColorRGBA: (Color purple alpha: 0.5);
		paint.
	context
		arcCenterX: 180
		centerY: 60
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		sourceColorRGBA: (Color black alpha: 0.7);
		clip.
	context sourceSurface: form x: 0 y: 0.
	context paint.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> fillPaint1 [

	<gtExample>
	| surface context fontFace scaledFont |
	surface := AeCairoImageSurface
		           extent: 700 @ 500
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: (Color red alpha: 0.6);
		paint.


	"green rectangle"
	context
		sourceColorRGB: Color green;
		rectangle: (100 @ 100 extent: 100 @ 100);
		fill.

	"yellow border around the rectangle"
	context
		sourceColorRGB: Color yellow;
		rectangle: (100 @ 100 extent: 100 @ 100);
		stroke.

	"draw a blue triangle"
	context
		moveTo: 300 @ 100;
		lineTo: 400 @ 100;
		lineTo: 400 @ 200;
		closePath;
		sourceColorRGB: Color blue;
		stroke.

	"black circle"
	context
		arcCenterX: 150
		centerY: 350
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		sourceColorRGB: Color black;
		stroke.

	"Thick magenta line"
	context
		lineWidth: 15;
		moveTo: 300 @ 350;
		relativeLineTo: 100 @ 0;
		sourceColorRGB: Color magenta;
		stroke.

	"some text in white blending in the background"
	fontFace := AeCairoFreetypeFontFace newForFace:
		            (AeSourceSansPro_Regular firstFaceUsing:
			             AeFTLibrary newInitialized).
	scaledFont := fontFace
		              newScaledFontWithFontMatrix:
		              (AeCairoMatrix newScalingBy: 30 asPoint)
		              userToDeviceMatrix: AeCairoMatrix newIdentity
		              options: AeCairoFontOptions new.
	context
		sourceColorRGBA: (Color white alpha: 0.5);
		translateByX: 500 y: 100.
	context
		scaledFont: scaledFont;
		showGlyphs: (scaledFont glyphArrayForString: 'Cairo in Pharo').

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

{ #category : #examples }
AlexandrieCairoExperiment >> mask1 [

	<gtExample>
	| surface context form |
	form := AeCairoImageSurface fromForm:
		        PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: (Color purple alpha: 0.5);
		paint.
	context maskSurface: form x: 0 y: 0.
	context fill.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> maskAndClip1 [

	<gtExample>
	| surface context form |
	form := AeCairoImageSurface fromForm:
		        PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: (Color purple alpha: 0.5);
		paint.
	context
		arcCenterX: 180
		centerY: 60
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		sourceColorRGBA: (Color white alpha: 0.7);
		clip.
	context maskSurface: form x: 0 y: 0.
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
