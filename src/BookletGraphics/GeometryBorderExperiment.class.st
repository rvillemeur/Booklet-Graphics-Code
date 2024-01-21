Class {
	#name : #GeometryBorderExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #shapes }
GeometryBorderExperiment >> TriangleColorDashedMulti [

	<bookExample>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				 matchExtent: 50 @ 100;
				 beLeft);
		  background: Color yellow;
		  border: (BlBorder builder
				   width: 5;
				   paint: (Color red alpha: 1);
					dashOffset: 0;
				dashArray: #(6 4 2);
				   joinBevel  ;
				   build);
		  size: 200 @ 200
]

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> box: element text: aText [

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

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> multipleElementOutskirts [

	<bookExample>
	| container space |
	space := BlSpace new.
	container := BlElement new
	"size: 450 @ 150;"
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 5);
		             padding: (BlInsets all: 5);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 5);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].
	

	container addChild:
		(self box: self outskirtsOutside text: 'outskirts outside').
	container addChild:
		(self box: self outskirtsCentered text: 'outskirts centered').
	container addChild:
		(self box: self outskirtsInside text: 'outskirts inside').
	space root addChild: container.
	space show.
	^space
]

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> multipleElementWithOpacity [

	<bookExample>
	| element1 element2 element3 container box1 box2 box3 |
	container := BlElement new
		             size: 450 @ 150;
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             opacity: 0.5;
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

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> multipleTriangle [

	<bookExample>
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

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> multipleTriangleDashed [

	<bookExample>
	|  container space |
	space := BlSpace new.
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3);
						constraintsDo: [ :c | c horizontal fitContent. c vertical fitContent  ].
	
	container addChild:
		(self box: self triangleDashedSmall  text: 'small dash').
	container addChild:
		(self box: self triangleDashedArray  text: 'dash specified with array').
	container addChild:
		(self box: self triangleDashedNormal  text: 'dash with no parameter').
	space root addChild: container.
	space show.
	^space
]

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> multipleTriangleWithCapAndJoin [

	<bookExample>
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
		            border: (BlBorder  builder paint: (Color orange); width: 15; capRound; joinRound; build);
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
		            border: (BlBorder  builder paint: (Color green); width: 15; capButt; joinBevel; build);
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
		            border: (BlBorder  builder paint: (Color cyan); width: 15; capSquare; joinMiter; build);
		            background: Color lightCyan;
		            outskirts: BlOutskirts centered.

	box3 addChild: element3.
	container addChildren: {
			box1.
			box2.
			box3 }.
	^ container
]

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> outskirtsCentered [

	| box element |
	box := BlElement new
		       size: 150 @ 150;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightYellow;
		       border: (BlBorder paint: Color yellow width: 5).
	element := BlElement new
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
		           border: (BlBorder paint: Color green width: 10);
		           background: Color lightGreen;
		           outskirts: BlOutskirts centered.

	box addChild: element.
	^ box
]

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> outskirtsInside [
|box element|
box := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;

		         background: Color lightBlue;
		        border: (BlBorder paint: Color blue width: 5).
	element := BlElement new
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
		            border: (BlBorder paint: Color cyan width: 10);
		            background: Color lightCyan;
		            outskirts: BlOutskirts inside.

	box addChild: element.
	^box
]

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> outskirtsOutside [

	| box element |
	box := BlElement new
		       size: 150 @ 150;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightRed;
		       border: (BlBorder paint: Color red width: 5).
	element := BlElement new
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
		           border: (BlBorder paint: Color orange width: 10);
		           background: Color lightOrange;
		           outskirts: BlOutskirts outside.

	box addChild: element.
	^ box
]

{ #category : #shapes }
GeometryBorderExperiment >> triangleBackgroundImage [
"not working currently"
	<bookExample>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: (BlImageBackground image: PolymorphSystemSettings pharoLogoForm);
		  border: (BlBorder paint: Color lightGray width: 5);
		  size: 100 @ 100
]

{ #category : #shapes }
GeometryBorderExperiment >> triangleBackgroundLinearColor [
	"not working currently"

	<bookExample>
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

{ #category : #shapes }
GeometryBorderExperiment >> triangleBackgroundRadialColor [
	"not working currently"

	<bookExample>
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

{ #category : #shapes }
GeometryBorderExperiment >> triangleBackgroundSolidColor [
	"not working currently"

	<bookExample>
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

{ #category : #shapes }
GeometryBorderExperiment >> triangleBorderImage [
"not working currently"
	<bookExample>
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

{ #category : #shapes }
GeometryBorderExperiment >> triangleBorderLinearGradient [

	<bookExample>
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

{ #category : #shapes }
GeometryBorderExperiment >> triangleBorderRadialGradient [

	<bookExample>
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

{ #category : #shapes }
GeometryBorderExperiment >> triangleBorderSolidColor [

	<bookExample>
	^BlElement new
		geometry: (BlTriangleGeometry new
				 matchExtent: 50 @ 100;
				 beLeft);
		background:  Color lightGray;
		border: (BlBorder paint: Color red width: 10);
		size: 100 @ 100
]

{ #category : #shapes }
GeometryBorderExperiment >> triangleColorDashed [

	<bookExample>
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

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> triangleDashedArray [

	| box element |
	box := BlElement new
		       size: 450 @ 450;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightYellow;
		       border: (BlBorder paint: Color yellow width: 5).
	element := BlElement new
		           size: 300 @ 300;
		           geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		           border: (BlBorder builder
				            paint: Color green;
				            width: 15;
				            dashOffset: 0;
				            dashArray: #( 6 4 2 );
				            capButt;
				            build);
		           background: Color lightGreen;
		           outskirts: BlOutskirts centered.

	box addChild: element.
	^ box
]

{ #category : #shapes }
GeometryBorderExperiment >> triangleDashedColorWithBuilder [

	<bookExample>
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

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> triangleDashedNormal [

	| box element |
	box := BlElement new
		       size: 450 @ 450;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightBlue;
		       border: (BlBorder paint: Color blue width: 5).
	element := BlElement new
		           size: 300 @ 300;
		           geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		           border: (BlBorder builder
				            paint: Color cyan;
				            width: 15;
				            dashed;
				            joinRound;
				            build);
		           background: Color lightCyan;
		           outskirts: BlOutskirts centered.

	box addChild: element.
	^ box
]

{ #category : #'as yet unclassified' }
GeometryBorderExperiment >> triangleDashedSmall [

	| box element |
	box := BlElement new
		       size: 450 @ 450;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightRed;
		       border: (BlBorder paint: Color red width: 5).
	element := BlElement new
		           size: 300 @ 300;
		           geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		           border: (BlBorder builder
				            paint: Color orange;
				            width: 15;
				            dashedSmall;
				            joinRound;
				            build);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.

	box addChild: element.
	^ box
]

{ #category : #shapes }
GeometryBorderExperiment >> triangleSolidColor [

	<bookExample>
	^BlElement new
		geometry: (BlTriangleGeometry new
				 matchExtent: 50 @ 100;
				 beLeft);
		background:  Color yellow;
		border: (BlBorder paint: Color red width: 5);
		size: 100 @ 100
]

{ #category : #shapes }
GeometryBorderExperiment >> triangleSolidColorWithBuilder [

	<bookExample>
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
