"
various example on background and border settings in Bloc
"
Class {
	#name : 'BackgroundAndBorderExperiment',
	#superclass : 'Object',
	#category : 'BookletGraphics-Bloc',
	#package : 'BookletGraphics',
	#tag : 'Bloc'
}

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> CircleCapButtDashArray [

	<sampleInstance>
	| element |
	element := BlElement new
		           extent: 400 @ 400;
		           geometry: (BlCircleGeometry new matchExtent: 400 @ 400);
		           border: (BlBorder builder
				            paint: (Color r:0.9  g: 0.2 b:179) ;  
				            width: 12;
				            dashArray: #(3 12 );
				            capButt ;
				            build);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.
	^ element
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> CircleCapButtDashArray2 [

	<sampleInstance>
	| element |
	element := BlElement new
		           extent: 400 @ 400;
		           geometry: (BlCircleGeometry new matchExtent: 400 @ 400);
		           border: (BlBorder builder
				            paint: (Color r:0.9  g: 0.2 b:179) ;  
				            width: 6;
				            dashArray: #(20 14 );
				            capButt ;
				            build);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.
	^ element
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> CircleCapRoundDashArray [

	<sampleInstance>
	| element |
	element := BlElement new
		           extent: 200 @ 200;
		           geometry: (BlCircleGeometry new matchExtent: 200 @ 200);
		           border: (BlBorder builder
				            paint: (Color r:0.7  g: 0.2 b:348) ;  
				            width: 16;
				            dashArray: #(0 15 0 15);
				            capRound ;
				            build);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.
	^ element
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> CircleCapRoundDashArray2 [

	<sampleInstance>
	| element |
	element := BlElement new
		           extent: 200 @ 200;
		           geometry: (BlCircleGeometry new matchExtent: 200 @ 200);
		           border: (BlBorder builder
				            paint: (Color r:0.7  g: 0.2 b:348) ;  
				            width: 10;
				            dashArray: #(0  20 26 60 );
				            capRound ;
				            build);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.
	^ element
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> CircleCapSquareDashArray [

	<sampleInstance>
	| element |
	element := BlElement new
		           extent: 400 @ 400;
		           geometry: (BlCircleGeometry new matchExtent: 400 @ 400);
		           border: (BlBorder builder
				            paint: (Color r:0.9  g: 0.2 b:179) ;  
				            width: 10;
				            dashArray: #(0 20 45 20 );
				            capSquare ;
				            build);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.
	^ element
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> TriangleColorDashedMulti [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color yellow;
		  border: (BlBorder builder
				   width: 5;
				   paint: (Color red alpha: 1);
				   dashOffset: 0;
				   dashArray: #( 6 4 2 );
				   joinBevel;
				   build);
		  extent: 200 @ 200
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> box: element text: aText [

	| container elt1 elt2 text |
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

	element constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].

	elt1 addChild: element.


	elt2 := BlElement new
		        layout: BlFrameLayout new;
				padding: (BlInsets all:3);
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ].

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

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> exampleLineCapButt [

	<sampleInstance>
	| container vertices referenceLine capLine |
	container := BlElement new size: 200@200; border: (BlBorder paint: Color black width: 2); background: Color white.
	vertices := {
		            (50 @ 50).
		            (150 @ 50) }.

	referenceLine := (BlPolylineGeometry vertices: vertices) asElement.
	referenceLine border: (BlBorder paint: Color black width: 5).

	capLine := (BlPolylineGeometry vertices: vertices) asElement.
	capLine border: (BlBorder builder
			 paint: (Color pink alpha: 0.5);
			 width: 50;
			 lineCap: BlStrokeLineCap butt;
			 build).

	container addChildren: {
			referenceLine.
			capLine }.
	^ container 
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> exampleLineCapRound [

	<sampleInstance>
	| container vertices referenceLine capLine |
		container := BlElement new size: 200@200; border: (BlBorder paint: Color black width: 2); background: Color white.
	vertices := {
		            (50 @ 50).
		            (150 @ 50) }.

	referenceLine := (BlPolylineGeometry vertices: vertices) asElement.
	referenceLine border: (BlBorder paint: Color black width: 5).

	capLine := (BlPolylineGeometry vertices: vertices) asElement.
	capLine border: (BlBorder builder
			 paint: (Color pink alpha: 0.5);
			 width: 50;
			 lineCap: BlStrokeLineCap round;
			 build).

	container addChildren: {
			referenceLine.
			capLine }.
	^ container
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> exampleLineCapSquare [

	<sampleInstance>
	| container vertices referenceLine capLine |
		container := BlElement new size: 200@200; border: (BlBorder paint: Color black width: 2); background: Color white.
	vertices := {
		            (50 @ 50).
		            (150 @ 50) }.

	referenceLine := (BlPolylineGeometry vertices: vertices) asElement.
	referenceLine border: (BlBorder paint: Color black width: 5).

	capLine := (BlPolylineGeometry vertices: vertices) asElement.
	capLine border: (BlBorder builder
			 paint: (Color pink alpha: 0.5);
			 width: 50;
			 lineCap: BlStrokeLineCap square;
			 build).

	container addChildren: {
			referenceLine.
			capLine }.
	^ container
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> exampleLineJoinBevel [

	<sampleInstance>
	| container vertices referenceLine capLine |
		container := BlElement new size: 200@200; border: (BlBorder paint: Color black width: 2); background: Color white.
	vertices := {
		            (50 @ 50).
		            (150 @ 50).
		            (150 @ 150) }.

	referenceLine := (BlPolylineGeometry vertices: vertices) asElement.
	referenceLine border: (BlBorder paint: Color black width: 5).

	capLine := (BlPolylineGeometry vertices: vertices) asElement.
	capLine border: (BlBorder builder
			 paint: (Color pink alpha: 0.5);
			 width: 15;
			lineJoin: BlStrokeLineJoin bevel;
			 lineCap: BlStrokeLineCap square;
			 build).

	container addChildren: {
			referenceLine.
			capLine }.
	^ container
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> exampleLineJoinMiter [

	<sampleInstance>
	| container vertices referenceLine capLine |
		container := BlElement new size: 200@200; border: (BlBorder paint: Color black width: 2); background: Color white.
	vertices := {
		            (50 @ 50).
		            (150 @ 50).
		            (150 @ 150) }.

	referenceLine := (BlPolylineGeometry vertices: vertices) asElement.
	referenceLine border: (BlBorder paint: Color black width: 5).

	capLine := (BlPolylineGeometry vertices: vertices) asElement.
	capLine border: (BlBorder builder
			 paint: (Color pink alpha: 0.5);
			 width: 25;
			lineJoin: BlStrokeLineJoin miter;
			 lineCap: BlStrokeLineCap square;
			 build).

	container addChildren: {
			referenceLine.
			capLine }.
	^ container
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> exampleLineJoinRound [

	<sampleInstance>
	| container vertices referenceLine capLine |
		container := BlElement new size: 200@200; border: (BlBorder paint: Color black width: 2); background: Color white.
	vertices := {
		            (50 @ 50).
		            (150 @ 50).
		            (150 @ 150) }.

	referenceLine := (BlPolylineGeometry vertices: vertices) asElement.
	referenceLine border: (BlBorder paint: Color black width: 5).

	capLine := (BlPolylineGeometry vertices: vertices) asElement.
	capLine border: (BlBorder builder
			 paint: (Color pink alpha: 0.5);
			 width: 15;
				lineJoin: BlStrokeLineJoin round;
			 lineCap: BlStrokeLineCap square;
			 build).

	container addChildren: {
			referenceLine.
			capLine }.
	^ container
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> externalBackgroundImage [
	"not working currently"

	<sampleInstance>
	| image element |
	image := ImageReadWriter formFromStream:
		         'C:\devzone\EventPropagation.png' asFileReference
			         binaryReadStream.
	element := BlElement new
		           background: (BlImageBackground image: image);
		           border: (BlBorder paint: Color lightGray width: 5);
		           size: 500 @ 500.
	^ element
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> multipleElementWithOpacity [

	<sampleInstance>
	| element1 element2 element3 container box1 box2 box3 |
	container := BlElement new
		             size: 450 @ 150;
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             
		             border: (BlBorder paint: Color black width: 3).
	box1 := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        background: Color lightRed;
		opacity: 0.1;
		        border: (BlBorder paint: Color red width: 5).
	element1 := BlElement new
		            size: 100 @ 100;
		            geometry: (BlPolygonGeometry vertices: {
						             (50 @ 0).
						             (65 @ 40).
						             (100 @ 40).
						             (75 @ 60).
						             (85 @ 100).
						             (50 @ 80).
						             (15 @ 100).
						             (25 @ 60).
						             (0 @ 40).
						             (35 @ 40) });
		            border: (BlBorder paint: Color orange width: 5);
		            background: Color lightOrange;
		            outskirts: BlOutskirts centered.

	box1 addChild: element1.
	box2 := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        background: Color lightYellow;
		opacity: 0.5;
		        border: (BlBorder paint: Color yellow width: 5).
	element2 := BlElement new
		            size: 100 @ 100;
		            geometry: (BlPolygonGeometry vertices: {
						             (50 @ 0).
						             (65 @ 40).
						             (100 @ 40).
						             (75 @ 60).
						             (85 @ 100).
						             (50 @ 80).
						             (15 @ 100).
						             (25 @ 60).
						             (0 @ 40).
						             (35 @ 40) });
		            border: (BlBorder paint: Color green width: 5);
		            background: Color lightGreen;
		            outskirts: BlOutskirts centered.

	box2 addChild: element2.

	box3 := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        background: Color lightBlue;
		opacity: 0.9;
		        border: (BlBorder paint: Color blue width: 5).
	element3 := BlElement new
		            size: 100 @ 100;
		            geometry: (BlPolygonGeometry vertices: {
						             (50 @ 0).
						             (65 @ 40).
						             (100 @ 40).
						             (75 @ 60).
						             (85 @ 100).
						             (50 @ 80).
						             (15 @ 100).
						             (25 @ 60).
						             (0 @ 40).
						             (35 @ 40) });
		            border: (BlBorder paint: Color cyan width: 5);
		            background: Color lightCyan;
		            outskirts: BlOutskirts centered.

	box3 addChild: element3.
	container addChildren: {
			box1.
			box2.
			box3 }.
	^ container
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> multipleTriangle [

	<sampleInstance>
	| element1 element2 element3 container box1 box2 box3 |
	container := BlElement new
		             size: 1350 @ 450;
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3).
	box1 := BlElement new
		        size: 450 @ 450;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        background: Color lightRed;
		        border: (BlBorder paint: Color red width: 5).
	element1 := BlElement new
		            size: 300 @ 300;
		            geometry: (BlTriangleGeometry new
				   matchExtent: 150 @ 300);
		            border: (BlBorder  builder paint: (Color orange); width: 15; build);
		            background: Color lightOrange;
		            outskirts: BlOutskirts centered.

	box1 addChild: element1.
	box2 := BlElement new
		        size: 450 @450;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        background: Color lightYellow;
		        border: (BlBorder paint: Color yellow width: 5).
	element2 := BlElement new
		            size: 300 @ 300;
		            geometry: (BlTriangleGeometry new
				   matchExtent: 150 @ 300);
		            border: (BlBorder  builder paint: (Color green); width: 15;  build);
		            background: Color lightGreen;
		            outskirts: BlOutskirts centered.

	box2 addChild: element2.
	
	box3 := BlElement new
		        size: 450 @ 450;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		         background: Color lightBlue;
		        border: (BlBorder paint: Color blue width: 5).
	element3 := BlElement new
		            size: 300@300;
		           		            geometry: (BlTriangleGeometry new
				   matchExtent: 150 @ 300);
		            border: (BlBorder  builder paint: (Color cyan); width: 15; build);
		            background: Color lightCyan;
		            outskirts: BlOutskirts centered.

	box3 addChild: element3.
	container addChildren: {
			box1.
			box2.
			box3 }.
	^ container
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> outskirtsCentered [

	| box element1 element2|
	box := BlElement new
		       size: 150 @ 150;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       background: Color lightYellow;
		       border: (BlBorder paint: Color yellow width: 5).
	element1 := BlElement new
		           size: 100 @ 100;
					position: 25@25;
		           geometry: (BlPolygonGeometry vertices: {
						            (50 @ 0).
						            (65 @ 40).
						            (100 @ 40).
						            (75 @ 60).
						            (85 @ 100).
						            (50 @ 80).
						            (15 @ 100).
						            (25 @ 60).
						            (0 @ 40).
						            (35 @ 40) });
		           border: (BlBorder paint: Color green width: 15);
		           background: Color lightGreen;
		           outskirts: BlOutskirts centered.
element2 := BlElement new
		           size: 100 @ 100;
		position: 25@25;
		           geometry: (BlPolygonGeometry vertices: {
						            (50 @ 0).
						            (65 @ 40).
						            (100 @ 40).
						            (75 @ 60).
						            (85 @ 100).
						            (50 @ 80).
						            (15 @ 100).
						            (25 @ 60).
						            (0 @ 40).
						            (35 @ 40) });
		           border: (BlBorder builder
				            paint: Color black;
				            width: 2;
				            dashOffset: 0;
				            dashArray: #( 6 4 2 );
				            capButt;
				            build);
		           background: Color transparent.

	box addChildren: { element1. element2}.
	^ box
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> outskirtsInside [
|box element1 element2|
box := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		         background: Color lightBlue;
		        border: (BlBorder paint: Color blue width: 5).
	element1 := BlElement new
		            size: 100 @ 100;
		position: 25@25;
		            geometry: (BlPolygonGeometry vertices: {
						              (50 @ 0).
						              (65 @ 40).
						              (100 @ 40).
						              (75 @ 60).
						              (85 @ 100).
						              (50 @ 80).
						              (15 @ 100).
						              (25 @ 60).
						              (0 @ 40).
						              (35 @ 40) });
		            border: (BlBorder paint: Color cyan width: 10);
		            background: Color lightCyan;
		            outskirts: BlOutskirts inside.

element2 := BlElement new
		           size: 100 @ 100;
				position: 25@25;
		           geometry: (BlPolygonGeometry vertices: {
						            (50 @ 0).
						            (65 @ 40).
						            (100 @ 40).
						            (75 @ 60).
						            (85 @ 100).
						            (50 @ 80).
						            (15 @ 100).
						            (25 @ 60).
						            (0 @ 40).
						            (35 @ 40) });
		           border: (BlBorder builder
				            paint: Color black;
				            width: 2;
				            dashOffset: 0;
				            dashArray: #( 6 4 2 );
				            capButt;
				            build);
		           background: Color transparent.
	box addChildren: { element1. element2}.
	^box
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> outskirtsOutside [

	| box element1 element2 |
	box := BlElement new
		       size: 150 @ 150;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       background: Color lightRed;
		       border: (BlBorder paint: Color red width: 5).
	element1 := BlElement new
		           size: 100 @ 100;
		position: 25@25;
		           geometry: (BlPolygonGeometry vertices: {
						            (50 @ 0).
						            (65 @ 40).
						            (100 @ 40).
						            (75 @ 60).
						            (85 @ 100).
						            (50 @ 80).
						            (15 @ 100).
						            (25 @ 60).
						            (0 @ 40).
						            (35 @ 40) });
		           border: (BlBorder paint: Color orange width: 10);
		           background: Color lightOrange;
		           outskirts: BlOutskirts outside.

element2 := BlElement new
		           size: 100 @ 100;
		position: 25@25;
		           geometry: (BlPolygonGeometry vertices: {
						            (50 @ 0).
						            (65 @ 40).
						            (100 @ 40).
						            (75 @ 60).
						            (85 @ 100).
						            (50 @ 80).
						            (15 @ 100).
						            (25 @ 60).
						            (0 @ 40).
						            (35 @ 40) });
 border: (BlBorder builder
				            paint: Color black;
				            width: 2;
				            dashOffset: 0;
				            dashArray: #( 6 4 2 );
				            capButt;
				            build);
		           background: Color transparent.
	box addChildren: { element1. element2}.
	^ box
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> polygonLinearGradient [
	"not working currently"

	<sampleInstance>
	| aGeometry |
	aGeometry := BlPolygonGeometry vertices: {
			             (100 @ 0).
			             (200 @ 0).
			             (300 @ 100).
			             (0 @ 100) }.

	^ BlElement new
		  geometry: aGeometry;
		  size: aGeometry geometryBounds extent;
		  background:
			  (BlLinearGradientPaint vertical from: Color black to: Color white);
		  border: (BlBorder paint: Color red width: 3);
		  yourself
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleBackgroundImage [
"not working currently"
	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: (BlImageBackground image: PolymorphSystemSettings pharoLogoForm);
		  border: (BlBorder paint: Color lightGray width: 5);
		  size: 100 @ 100
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleBackgroundLinearColor [
	"not working currently"

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: ((BlLinearGradientPaint direction: 1 @ 1)
				   from: Color red
				   to: Color blue);
		  border: (BlBorder paint: Color lightGray width: 5);
		  size: 100 @ 100
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleBackgroundRadialColor [
	"not working currently"

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: (BlRadialGradientPaint new
				   stops: {
						   (0 -> Color blue).
						   (1 -> Color red) };
				   center: 75 @ 75;
				   radius: 50;
				   yourself);
		  border: (BlBorder paint: Color lightGray width: 5);
		  size: 100 @ 100
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleBackgroundSolidColor [
	"not working currently"

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: (Color
				   r: 63
				   g: 81
				   b: 181
				   range: 255);
		  border: (BlBorder paint: Color lightGray width: 5);
		  size: 100 @ 100
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleBorderImage [
"not working currently"
	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color lightGray;
		  border: (BlBorder
				   paint: (BlImagePatternPaint form: PolymorphSystemSettings pharoLogoForm)
				   width: 5);
		  size: 100 @ 100
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleBorderLinearGradient [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color lightGray;
		  border: (BlBorder
				   paint: ((BlLinearGradientPaint direction: 1 @ 1)
						    matchExtent: 100 @ 75;
						    from: Color blue to: Color red)
				   width: 5);
		  size: 100 @ 100
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleBorderRadialGradient [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color lightGray;
		  border: (BlBorder
				   paint: (BlRadialGradientPaint new
						    stops: {
								    (0 -> Color blue).
								    (1 -> Color red) };
						    center: 50 @ 100 // 2;
						    radius: 50;
						    yourself)
				   width: 5);
		  size: 100 @ 100
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleBorderSolidColor [

	<sampleInstance>
	^BlElement new
		geometry: (BlTriangleGeometry new
				 matchExtent: 50 @ 100;
				 beLeft);
		background:  Color lightGray;
		border: (BlBorder paint: Color red width: 10);
		size: 100 @ 100
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleColorDashed [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color yellow;
		  border: (BlBorder builder
				   width: 5;
				   paint: (Color red alpha: 1);
				   dashOffset: 0;
				   dashArray: #( 6 4 2 );
				   joinBevel;
				   build);
		  size: 200 @ 200
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> triangleDashedArray [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		  border: (BlBorder builder
				   paint: Color green;
				   width: 15;
				   dashOffset: 0;
				   dashArray: #( 6 4 2 );
				   capButt;
				   build);
		  background: Color lightGreen;
		  outskirts: BlOutskirts centered
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleDashedColorWithBuilder [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color yellow;
		  border: (BlBorder builder
				   width: 5;
				   paint: (Color red alpha: 0.5);
				   dashed;
				   build);
		  size: 100 @ 100
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> triangleDashedNormal [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		  border: (BlBorder builder
				   paint: Color cyan;
				   width: 15;
				   dashed;
				   joinRound;
				   build);
		  background: Color lightCyan;
		  outskirts: BlOutskirts centered
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> triangleDashedSmall [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		  border: (BlBorder builder
				   paint: Color orange;
				   width: 15;
				   dashedSmall;
				   joinRound;
				   build);
		  background: Color lightOrange;
		  outskirts: BlOutskirts centered
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> triangleJoinBevel [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		  border: (BlBorder builder
				   paint: Color green;
				   width: 15;
				   capButt;
				   joinBevel;
				   build);
		  background: Color lightGreen;
		  outskirts: BlOutskirts centered
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> triangleJoinMiter [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		  border: (BlBorder builder
				   paint: Color cyan;
				   width: 15;
				   capSquare;
				   joinMiter;
				   build);
		  background: Color lightCyan;
		  outskirts: BlOutskirts centered
]

{ #category : 'examples - helpers' }
BackgroundAndBorderExperiment class >> triangleJoinRound [
<sampleInstance>
	| box element |

	element := BlElement new
		           geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		           border: (BlBorder builder
				            paint: Color orange;
				            width: 15;
				            capRound;
				            joinRound;
				            build);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.
	^ element
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleSolidColor [

	<sampleInstance>
	^BlElement new
		geometry: (BlTriangleGeometry new
				 matchExtent: 50 @ 100;
				 beLeft);
		background:  Color yellow;
		border: (BlBorder paint: Color red width: 5);
		size: 100 @ 100
]

{ #category : 'examples' }
BackgroundAndBorderExperiment class >> triangleSolidColorWithBuilder [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color yellow;
		  border: (BlBorder builder
				   width: 5;
				   paint: Color red;
				   build);
		  size: 100 @ 100
]

{ #category : 'see class side' }
BackgroundAndBorderExperiment >> seeClassSide [ 
]
