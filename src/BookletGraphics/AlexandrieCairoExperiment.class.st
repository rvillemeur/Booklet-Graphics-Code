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
		sourceColor: (Color purple alpha: 0.5);
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
		sourceColor: (Color red alpha: 0.6);
		paint.


	"green rectangle"
	context
		sourceColor: Color green;
		rectangle: (100 @ 100 extent: 100 @ 100);
		fillPreserve;
		sourceColor: Color yellow;
		stroke.

	"draw a blue triangle"
	context
		moveTo: 300 @ 100;
		lineTo: 400 @ 100;
		lineTo: 400 @ 200;
		closePath;
		sourceColor: Color blue;
		stroke.

	"black circle"
	context
		arcCenterX: 150
		centerY: 350
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		sourceColor: Color black;
		stroke.

	"Thick magenta line"
	context
		lineWidth: 15;
		moveTo: 300 @ 350;
		relativeLineTo: 100 @ 0;
		sourceColor: Color magenta;
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
		sourceColor: (Color white alpha: 0.5);
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
		sourceColor: Color red;
		paintWithAlpha: 0.5.


	"green rectangle"
	context
		sourceColor: Color green;
		rectangle: (100 @ 100 extent: 100 @ 100);
		fillPreserve;
		sourceColor: Color yellow;
		lineWidth: 4;
		antialias: AeCairoAntialias CAIRO_ANTIALIAS_NONE;
		operator: AeCairoOperator CAIRO_OPERATOR_DARKEN;
		dash: (AeFFIDoubleArray newFrom: #( 8 4 2 )) count: 3 offset: 0;
		useLineCapRound;
		stroke.

	"draw a blue triangle"
	context
		moveTo: 300 @ 100;
		lineTo: 400 @ 100;
		lineTo: 400 @ 200;
		closePath;
		dash: (AeFFIDoubleArray newFrom: #( 1 )) count: 1 offset: 0;
		lineWidth: 2;
		sourceColor: Color blue;
		stroke.

	"black circle"
	context
		arcCenterX: 150
		centerY: 350
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		sourceColor: Color black;
		stroke.

	"Thick magenta line"
	context
		lineWidth: 15;
		moveTo: 300 @ 350;
		relativeLineTo: 100 @ 0;
		sourceColor: Color magenta;
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
		sourceColor: (Color white alpha: 0.5);
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
		sourceColor: (Color purple alpha: 0.5);
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
		sourceColor: (Color yellow alpha: 0.2);
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
		sourceColor: Color yellow;
		paint.


	context
		lineWidth: 15;
		moveTo: 0 @ 30;
		lineTo: 100 @ 30;
		sourceColor: Color red;
		useLineCapButt;
		moveTo: 115 @ 33;
		showText: 'butt';
		stroke.

	context
		lineWidth: 15;
		moveTo: 0 @ 60;
		lineTo: 100 @ 60;
		sourceColor: Color red;
		useLineCapSquare;
		moveTo: 115 @ 63;
		showText: 'square';
		stroke.

	context
		lineWidth: 15;
		moveTo: 0 @ 90;
		relativeLineTo: 100 @ 0;
		sourceColor: Color red;
		useLineCapRound;
		moveTo: 115 @ 93;
		showText: 'round';
		stroke.


	^ surface asForm
]

{ #category : #accessing }
AlexandrieCairoExperiment >> lineColor [

	<bookExample>
	| surface context gradient |
	surface := AeCairoImageSurface
		           extent: 200 @ 120
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColor: Color yellow;
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
		sourceColor: (Color black alpha: 0.7);
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
		sourceColor: Color yellow;
		paint.

	"A dash pattern is specified by an array of positive values.
	Each value provides the length of alternate 'on' and 'off' portions of the stroke.
	The offset specifies an offset into the pattern at which the stroke begins."

	context
		lineWidth: 15;
		moveTo: 0 @ 30;
		lineTo: 200 @ 30;
		sourceColor: Color red;
		dash: (AeFFIDoubleArray newFrom: #( 4 6 )) offset: 4;
		stroke.

	context
		lineWidth: 15;
		moveTo: 0 @ 60;
		lineTo: 200 @ 60;
		sourceColor: Color red;
		dash: (AeFFIDoubleArray newFrom: #( 4 6 )) offset: 0;
		stroke.

	context
		lineWidth: 15;
		moveTo: 0 @ 90;
		lineTo: 200 @ 90;
		sourceColor: Color red;
		dash: (AeFFIDoubleArray newFrom: #( 2 5 2 10 )) offset: 0;
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
		maskSurface: form x: 0 y: 0;
		fill.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> mask2 [

	<bookExample>
	| surface context form pattern |
	form := PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	pattern := AeCairoSurfacePattern surface:
		           (AeCairoImageSurface fromForm: form).

	context := surface newContext.

	"let the background transparent, et let the mask appear in purple alpha"
	context
		sourceColor: (Color purple alpha: 0.5);
		mask: pattern;
		fill.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> mask3 [

	<bookExample>
	| surface context form pattern |
	form := PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	pattern := AeCairoSurfacePattern surface:
		           (AeCairoImageSurface fromForm: form).

	context := surface newContext.

"paint the background in purple, et let the mask appear in alpha"
	context
		sourceColorRGBA: (Color purple alpha: 0.5);
		mask: pattern;
		paint.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> mask4 [

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
		maskSurface: form x: 0 y: 0;
		paint.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> mask5 [

	<bookExample>
	| surface context form |
	form := AeCairoImageSurface fromForm:
		        PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		maskSurface: form x: 0 y: 0;
		sourceColorRGBA: (Color purple alpha: 0.5);
		paint.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> mask6 [

	<bookExample>
	| surface context form pattern |
	form := PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	pattern := AeCairoSurfacePattern surface:
		           (AeCairoImageSurface fromForm: form).

	context := surface newContext.

"paint the background in purple, et let the mask appear in alpha"
	context
		mask: pattern;
		sourceColorRGBA: (Color purple alpha: 0.5);
		paint.

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
AlexandrieCairoExperiment >> maskAndClip2 [

	<bookExample>
	| surface context form pattern |
	form := PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	pattern := AeCairoSurfacePattern surface:
		           (AeCairoImageSurface fromForm: form).
	context := surface newContext.


	context
		sourceColorRGBA: (Color purple alpha: 0.5);
		arcCenterX: 180
		centerY: 60
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		sourceColorRGBA: (Color white alpha: 0.7);
		clip;
		mask: pattern;
		fill.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> maskAndClip3 [

	<bookExample>
	| surface context form pattern |
	form := PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	pattern := AeCairoSurfacePattern surface:
		           (AeCairoImageSurface fromForm: form).
	context := surface newContext.


	context
		sourceColorRGBA: (Color purple alpha: 0.5);
		arcCenterX: 180
		centerY: 60
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		sourceColorRGBA: (Color white alpha: 0.7);
		clip;
		mask: pattern;
		paint.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> maskAndClip4 [

	<bookExample>
	| surface context form pattern |
	form := PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	pattern := AeCairoSurfacePattern surface:
		           (AeCairoImageSurface fromForm: form).
	context := surface newContext.


	context
		sourceColorRGBA: (Color purple alpha: 0.5);
		arcCenterX: 180
		centerY: 60
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		clip;
		mask: pattern;
		fill.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> maskAndClip5 [

	<bookExample>
	| surface context form pattern |
	form := PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	pattern := AeCairoSurfacePattern surface:
		           (AeCairoImageSurface fromForm: form).
	context := surface newContext.


	context
		sourceColor: (Color purple alpha: 0.5);
		mask: pattern;
		arcCenterX: 180
		centerY: 60
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		paint;
		sourceColor: (Color white alpha: 0.7);
		clip;
		paint.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> maskAndClip6 [

	<bookExample>
	| surface context form pattern |
	form := PolymorphSystemSettings pharoLogoForm.
	surface := AeCairoImageSurface
		           extent: form extent
		           format: AeCairoSurfaceFormat argb32.
	pattern := AeCairoSurfacePattern surface:
		           (AeCairoImageSurface fromForm: form).
	context := surface newContext.


	context
		sourceColor: (Color purple alpha: 0.5);
		mask: pattern;
		arcCenterX: 180
		centerY: 60
		radius: 50
		startAngle: 0
		endAngle: Float twoPi;
		fill;
		sourceColor: (Color white alpha: 0.9);
		clip;
		fill.

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> meshPattern [

	<bookExample>
	| surface context    meshPattern  |
	surface := AeCairoImageSurface
		           extent: 130 asPoint 
		           format: AeCairoSurfaceFormat argb32.

	context := surface newContext.

	"https://www.cairographics.org/manual/cairo-cairo-pattern-t.html#cairo-pattern-create-mesh"
	
	meshPattern := AeCairoMeshPattern new.
	meshPattern beginPatch.
	
	meshPattern
		moveToX: 0 y: 0;
		curveViaX:  30 y: -30 viaX: 60 y:  30 toX: 100 y: 0;
		curveViaX: 130 y: 140 viaX: 60 y: -40 toX: 100 y: 100;
		curveViaX:  60 y:  70 viaX: 30 y: 130 toX:   0 y: 100;
		curveViaX: -30 y: -40 viaX: 30 y: 140 toX:   0 y: 0.

	meshPattern
		cornerAt: 0 putColorRGB: Color red;
		cornerAt: 1 putColorRGB: Color green;
		cornerAt: 2 putColorRGB: Color blue;
		cornerAt: 3 putColorRGB: Color yellow.
		
	meshPattern endPatch.

	context
		source: meshPattern;
		paint.

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
		sourceColor: Color blue muchDarker;
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
		sourceColorRGBA: Color lightYellow ;
		paint.

"stroke first and fill second. The color of fill appear on the top of stroke"
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
		sourceColorRGBA: (Color red alpha: 0.7);
		strokePreserve .


	context sourceColorRGBA: (Color blue alpha: 0.5) ; fill.
	
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
		sourceColor: Color lightYellow;
		paint.

	"fill first and stroke second. The color of stroke appear on the top of fill"
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
		sourceColor: (Color blue alpha: 0.7);
		fillPreserve.


	context
		lineWidth: 10;
		sourceColor: (Color red alpha: 0.5);
		stroke.

	^ surface asForm
]

{ #category : #'as yet unclassified' }
AlexandrieCairoExperiment >> textWithHarfBuzz [

	<bookExample>
	| surface context text buffer fontLibrary freetypeFace fontHeight scaledFont fontOptions |
	fontHeight := 22.
	text := 'a := A->B->>C <= c|=>d~~>e.'.

	surface := AeCairoImageSurface
		           extent: 1000 @ (fontHeight * 2)
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColor: Color white;
		paint.
	"context
		tolerance: 0.2;
		antialias: AeCairoAntialias fast."
	"Margin"
	context translateBy: fontHeight / 2 @ 0.
	"----------------------------------------------------------"
	fontLibrary := AeFTLibrary newInitialized.
	freetypeFace := AeCascadiaCodeDownloadedFont new
		                downloadDirectory:
			                AeFilesystemResources downloadedFontsDirectory;
		                ensureDownloaded;
		                firstFaceUsing: fontLibrary.

	fontOptions := AeCairoFontOptions new
		               antialias: AeCairoAntialias fast;
		               hintMetrics: AeCairoHintMetrics on;
		               hintStyle: AeCairoHintStyle slight;
		               subpixelOrder: AeCairoSubpixelOrder default.

	scaledFont := AeCairoScaledFont
		              fontFace:
		              (AeCairoFreetypeFontFace newForFace: freetypeFace)
		              fontMatrix:
		              (AeCairoMatrix newScalingByX: fontHeight y: fontHeight)
		              userToDeviceMatrix: AeCairoMatrix newIdentity
		              options: fontOptions.
	"----------------------------------------------------------"
	"Draw text with Harfbuzz:"
	buffer := AeHbBuffer new
		          direction: AeHbDirection leftToRight;
		          script: AeHbScript latin;
		          language: AeHbLanguage en;
		          clusterLevel: AeHbBufferClusterLevel recommended;
		          flags: AeHbBufferFlags beginningOrEndingOfText;
		          addUtf8String: text.

	context translateBy: 0 @ (fontHeight * 1.1).
	context sourceColorRGB: Color green muchDarker.
	context
		scaledFont: scaledFont;
		showGlyphs:
			(buffer cairoGlyphArrayForFace: freetypeFace size: fontHeight).

	^ surface asForm
]

{ #category : #examples }
AlexandrieCairoExperiment >> textWithOrWithoutHarfbuzz [
	"~~>, ->, <=, |=>  and ->> have special representation using cascadia font.
see 
https://github.com/microsoft/cascadia-code/blob/main/images/arrow_support.png 
and 
https://github.com/microsoft/cascadia-code/blob/main/images/ligatures.png

Used together, HarfBuzz can perform shaping on Unicode text segments, outputting 
the glyph IDs that FreeType should rasterize from the active font as well as the 
positions at which those glyphs should be drawn. "

	<bookExample>
	| surface context scaledFont fontHeight freetypeFace fontOptions text buffer fontLibrary glyphs |
	text := 'a := A->B->>C <= c|=>d~~>e.'.
	fontHeight := 22.

	surface := AeCairoImageSurface
		           extent: 1000 @ (fontHeight * 4)
		           format: AeCairoSurfaceFormat argb32.
	context := surface newContext.

	context
		sourceColor: Color white;
		paint.

	fontLibrary := AeFTLibrary newInitialized.
	freetypeFace := AeCascadiaCodeDownloadedFont new
		                downloadDirectory:
			                AeFilesystemResources downloadedFontsDirectory;
		                ensureDownloaded;
		                firstFaceUsing: AeFTLibrary newInitialized.

	"may not be necessary"
	context
		tolerance: 0.2;
		antialias: AeCairoAntialias fast.


	fontOptions := AeCairoFontOptions new
		               antialias: AeCairoAntialias fast;
		               hintMetrics: AeCairoHintMetrics on;
		               hintStyle: AeCairoHintStyle slight;
		               subpixelOrder: AeCairoSubpixelOrder default.


	scaledFont := AeCairoScaledFont
		              fontFace:
		              (AeCairoFreetypeFontFace newForFace: freetypeFace)
		              fontMatrix:
		              (AeCairoMatrix newScalingByX: fontHeight y: fontHeight)
		              userToDeviceMatrix: AeCairoMatrix newIdentity
		              options: fontOptions.

	"Margin"
	context translateBy: fontHeight / 2 @ 0.

	"Draw text withOUT Harfbuzz:"
	context translateBy: 0 @ (fontHeight * 1.1).
	context sourceColor: Color red muchDarker.
	context
		scaledFont: scaledFont;
		showGlyphs: (scaledFont glyphArrayForString: text).
	"context fill."

	"Draw text with Harfbuzz:"
	buffer := AeHbBuffer new
		          direction: AeHbDirection leftToRight;
		          script: AeHbScript latin;
		          language: AeHbLanguage en;
		          clusterLevel: AeHbBufferClusterLevel recommended;
		          flags: AeHbBufferFlags beginningOrEndingOfText;
		          addString: text.

	glyphs := buffer
		          cairoGlyphArrayForFace: freetypeFace
		          size: fontHeight.
	context translateBy: 0 @ (fontHeight * 1.1).
	context sourceColor: Color green muchDarker.
	context
		scaledFont: scaledFont;
		showGlyphs: glyphs.

	^ surface asForm
]
