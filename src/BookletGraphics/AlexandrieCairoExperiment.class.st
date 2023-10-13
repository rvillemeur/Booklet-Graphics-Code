"
The default line cap style is CAIRO_LINE_CAP_BUTT.
CAIRO_LINE_CAP_BUTT: start(stop) the line exactly at the start(end) point
CAIRO_LINE_CAP_ROUND: use a round ending, the center of the circle is the end point 
CAIRO_LINE_CAP_SQUARE: use squared ending, the center of the square is the end point

The default line join style is CAIRO_LINE_JOIN_MITER.
CAIRO_LINE_JOIN_MITER: use a sharp (angled) corner, see cairo_set_miter_limit() 
CAIRO_LINE_JOIN_ROUND: use a rounded join, the center of the circle is the joint point 
CAIRO_LINE_JOIN_BEVEL: use a cut-off join, the join is cut off at half the line width from the joint point

[Operators:](https://cairographics.org/operators/)
"
Class {
	#name : #AlexandrieCairoExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Alexandrie'
}

{ #category : #examples }
AlexandrieCairoExperiment >> clip1 [

	<bookExample>
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
		clip.
	context sourceSurface: form x: 0 y: 0.
	context paint.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> clip2 [

	<bookExample>
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
		endAngle: Float twoPi.
	context
		arcCenterX: 60
		centerY: 60
		radius: 50
		startAngle: 0
		endAngle: Float twoPi.
	context
		arcCenterX: 250
		centerY: 60
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		clip.
	context sourceSurface: form x: 0 y: 0.
	context paint.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> fillPaint1 [

	<bookExample>
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
		fillPreserve;
		sourceColorRGB: Color yellow;
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
AlexandrieCairoExperiment >> fillPaint2 [

	<bookExample>
	| surface context fontFace scaledFont |
	surface := AeCairoImageSurface
		           extent: 700 @ 500
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: Color red ;
		paintWithAlpha: 0.5.


	"green rectangle"
	context
		sourceColorRGB: Color green;
		rectangle: (100 @ 100 extent: 100 @ 100);
		fillPreserve;
		sourceColorRGB: Color yellow;
		lineWidth: 4;
		antialias: AeCairoAntialias CAIRO_ANTIALIAS_NONE;
		operator: AeCairoCompositionOp CAIRO_OPERATOR_DARKEN;
		dash: (AeCairoDoubleArray newFrom: #(8 4 2)) count: 3 offset: 0;
		useLineCapRound;
		stroke.

	"draw a blue triangle"
	context
		moveTo: 300 @ 100;
		lineTo: 400 @ 100;
		lineTo: 400 @ 200;
		closePath;
		dash: (AeCairoDoubleArray newFrom: #(1)) count: 1 offset: 0;
		lineWidth: 2;
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

	<bookExample>
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

{ #category : #accessing }
AlexandrieCairoExperiment >> lineCap [

	<bookExample>
	| surface context |
	surface := AeCairoImageSurface
		           extent: 150 @ 120
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: Color yellow;
		paint.


	context
		lineWidth: 15;
		moveTo: 0 @ 30;
		lineTo: 100 @ 30;
		sourceColorRGB: Color red;
		useLineCapButt;
		moveTo: 115@33;
		showText: 'butt';
		stroke.

	context
		lineWidth: 15;
		moveTo: 0 @ 60;
		lineTo:  100 @ 60;
		sourceColorRGB: Color red;
		useLineCapSquare;
		moveTo: 115@63;
		showText: 'square';
		stroke.

	context
		lineWidth: 15;
		moveTo: 0 @ 90;
		relativeLineTo: 100 @ 0;
		sourceColorRGB: Color red;
		useLineCapRound;
		moveTo: 115@93;
		showText: 'round';
		stroke.


	^ surface asForm
]

{ #category : #accessing }
AlexandrieCairoExperiment >> lineColor [

	<bookExample>
	| surface context gradient|
	surface := AeCairoImageSurface
		           extent: 200 @ 120
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: Color yellow;
		paint.

	"A dash pattern is specified by an array of positive values.
	Each value provides the length of alternate 'on' and 'off' portions of the stroke.
	The offset specifies an offset into the pattern at which the stroke begins."

"linear gradient fill"
	gradient := AeCairoLinearGradientPattern
		            from: 0 @ 30
		            to: 200 @ 45
		            addStopsFrom: {
				            (0 -> Color white).
				            (1 -> Color black) }.
				
	context
		lineWidth: 15;
		moveTo: 0 @ 30;
		lineTo: 200 @ 30;
		source: gradient;
		stroke.

"solid color"
	context
		lineWidth: 15;
		moveTo: 0 @ 60;
		lineTo: 200 @ 60;
		sourceColorRGB: (Color black alpha:0.7);
		stroke.

"Radial gradient fill"
	gradient := AeCairoRadialGradientPattern
		            innerCenter: 50 @ 90
		            innerRadius: 50
		            outerCenter: 80 @ 105
		            outerRadius: 0
		            addStopsFrom: {
				            (0 -> Color black).
				            (1 -> Color white) }.
	context
		lineWidth: 15;
		moveTo: 0 @ 90;
		lineTo: 200 @ 90;
		source: gradient;
		stroke.


	^ surface asForm
]

{ #category : #accessing }
AlexandrieCairoExperiment >> lineDash [

	<bookExample>
	| surface context |
	surface := AeCairoImageSurface
		           extent: 200 @ 120
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: Color yellow;
		paint.

	"A dash pattern is specified by an array of positive values.
	Each value provides the length of alternate 'on' and 'off' portions of the stroke.
	The offset specifies an offset into the pattern at which the stroke begins."

	context
		lineWidth: 15;
		moveTo: 0 @ 30;
		lineTo: 200 @ 30;
		sourceColorRGB: Color red;
		dash: (AeCairoDoubleArray newFrom: #( 4 6 )) offset: 4;
		stroke.

	context
		lineWidth: 15;
		moveTo: 0 @ 60;
		lineTo: 200 @ 60;
		sourceColorRGB: Color red;
		dash: (AeCairoDoubleArray newFrom: #( 4 6 )) offset: 0;
		stroke.

	context
		lineWidth: 15;
		moveTo: 0 @ 90;
		lineTo: 200 @ 90;
		sourceColorRGB: Color red;
		dash: (AeCairoDoubleArray newFrom: #( 2 5 2 10 )) offset: 0;
		stroke.


	^ surface asForm
]

{ #category : #accessing }
AlexandrieCairoExperiment >> linePath [

	<bookExample>
	| surface context |
	surface := AeCairoImageSurface
		           extent: 120 @ 100
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: Color yellow;
		paint.

	context
		lineWidth: 3;
		moveTo: 25 @ 25;
		lineTo: 50 @ 37.75;
		relativeLineTo: 25 @ -12.5;
		arcCenter: 75 @ 50
		radius: 20
		startAngle: 0
		endAngle: 135 degreesToRadians;
		curveVia: 50 @ 60 via: 50 @ 90 to: 25 @ 75;
		closePath;
		sourceColorRGB: Color red;
		stroke.
	
	^ surface asForm
]

{ #category : #accessing }
AlexandrieCairoExperiment >> linejoin [

	<bookExample>
	| surface context |
	surface := AeCairoImageSurface
		           extent: 150 @ 170
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: Color yellow;
		paint.


	context
		lineWidth: 15;
		moveTo: 10 @ 60;
		lineTo: 60 @ 10;
		lineTo: 110 @ 60;
		sourceColorRGB: Color red;
		useLineJoinRound  ;
		moveTo: 115@30;
		showText: 'round';
		stroke.

	context
		lineWidth: 15;
		moveTo: 10 @ 110;
		lineTo: 60 @ 60;
		lineTo: 110 @ 110;
		sourceColorRGB: Color red;
		useLineJoinMiter ;
		moveTo: 115@80;
		showText: 'mitter';
		stroke.
		
	context
		lineWidth: 15;
		moveTo: 10 @ 160;
		lineTo: 60 @ 110;
		lineTo: 110 @ 160;
		sourceColorRGB: Color red;
		useLineJoinBevel  ;
		moveTo: 115@130;
		showText: 'bevel';
		stroke.


	^ surface asForm
]

{ #category : #accessing }
AlexandrieCairoExperiment >> linejoin2 [

	<bookExample>
	| surface context |
	surface := AeCairoImageSurface
		           extent: 120 @ 220
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: Color yellow;
		paint.


	context
		lineWidth: 15;
		moveTo: 10 @ 110;
		lineTo: 30 @ 30;
		lineTo: 50 @ 110;
		sourceColorRGB: Color red;
		useLineJoinMiter;
		moveTo: 60@80;
		showText: 'mitter';
		moveTo: 60@100;
		showText: 'no limit';
		stroke.

	" limit on the ratio of the miter length to the width used to draw a miter join it is possible for the miter to extend far beyond the thickness of the line stroking the path. the miterlimit ratio is used to define when the limit is exceeded, if so the join is converted from a miter to a bevel."

	context
		lineWidth: 15;
		moveTo: 10 @ 210;
		lineTo: 30 @ 130;
		lineTo: 50 @ 210;
		sourceColorRGB: Color red;
		useLineJoinMiter;
		miterLimit: 3;
		moveTo: 60@180;
		showText: 'mitter';
		moveTo: 60@200;
		showText: 'with limit';
		stroke.
		

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> mask1 [

	<bookExample>
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

	<bookExample>
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

{ #category : #examples }
AlexandrieCairoExperiment >> radialGradientPattern1 [

	<bookExample>
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

{ #category : #accessing }
AlexandrieCairoExperiment >> strokeAndFill [

	<bookExample>
	| surface context |
	surface := AeCairoImageSurface
		           extent: 120 @ 100
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: Color yellow;
		paint.

	context
		lineWidth: 10;
		moveTo: 25 @ 25;
		lineTo: 50 @ 37.75;
		relativeLineTo: 25 @ -12.5;
		arcCenter: 75 @ 50
		radius: 20
		startAngle: 0
		endAngle: 135 degreesToRadians;
		curveVia: 50 @ 60 via: 50 @ 90 to: 25 @ 75;
		closePath;
		sourceColorRGB: Color red;
		strokePreserve .


	context sourceColorRGB: Color lightBlue ; fill.
	
	^ surface asForm
]

{ #category : #accessing }
AlexandrieCairoExperiment >> strokeAndFill2 [

	<bookExample>
	| surface context |
	surface := AeCairoImageSurface
		           extent: 120 @ 100
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColorRGBA: Color yellow;
		paint.

	context
		moveTo: 25 @ 25;
		lineTo: 50 @ 37.75;
		relativeLineTo: 25 @ -12.5;
		arcCenter: 75 @ 50
		radius: 20
		startAngle: 0
		endAngle: 135 degreesToRadians;
		curveVia: 50 @ 60 via: 50 @ 90 to: 25 @ 75;
		closePath;
		sourceColorRGB: (Color blue alpha: 0.1);
		fillPreserve.


	context
		lineWidth: 3;
		sourceColorRGB: (Color red alpha: 0.2);
		stroke.

	^ surface asForm
]
