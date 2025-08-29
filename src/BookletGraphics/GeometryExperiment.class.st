"
examples of geometry bonds and possibility within Bloc
"
Class {
	#name : 'GeometryExperiment',
	#superclass : 'Object',
	#category : 'BookletGraphics-Bloc',
	#package : 'BookletGraphics',
	#tag : 'Bloc'
}

{ #category : 'examples' }
GeometryExperiment class >> annulus [

	<sampleInstance>

	^ BlElement new
		  geometry: (BlAnnulusSectorGeometry new
				   startAngle: 225;
				   endAngle: 360;
				   innerRadius: 0.3;
				   outerRadius: 0.9);
		  size: 100 @ 100;
		  background: BlocPresentationHelper background;
		  border: BlocPresentationHelper border
]

{ #category : 'examples' }
GeometryExperiment class >> basicBorder [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: BlocPresentationHelper background;
		  border: (BlBorder paint: Color red width: 5);
		  extent: 100 @ 100
]

{ #category : 'examples' }
GeometryExperiment class >> bezier [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlBezierCurveGeometry controlPoints: {
						   (5 @ 0).
						   (25 @ 80).
						   (75 @ 30).
						   (95 @ 100) });
		  extent: 100 @ 100;
		  background: BlocPresentationHelper background;
		  outskirts: BlOutskirts centered;
		  border: BlocPresentationHelper border
]

{ #category : 'examples' }
GeometryExperiment class >> builderBorder [

	<sampleInstance>

	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: BlocPresentationHelper background;
		  border: (BlBorder builder
				   paint: Color red;
				   width: 5;
				   build);
		  size: 100 @ 100
]

{ #category : 'examples' }
GeometryExperiment class >> builderCapButtBorder [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 100 @ 200;
				   beLeft);
		  background: BlocPresentationHelper background;
		  border: (BlBorder builder
				   paint: Color red;
				   width: 5;
				   lineCap: BlStrokeLineCap butt;
				   lineJoin: BlStrokeLineJoin bevel;
				   miterLimit: 2.0;
				   dashArray: #( 10 5 );
				   dashOffset: 0;
				   build);
		  extent: 200 @ 200
]

{ #category : 'examples' }
GeometryExperiment class >> builderOpacityBorder [

	<sampleInstance>

	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: BlocPresentationHelper background;
		  border: (BlBorder builder
				   paint: Color red;
				   width: 5;
				   opacity: 0.1;
				   build);
		  size: 100 @ 100
]

{ #category : 'examples' }
GeometryExperiment class >> circle [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlCircleGeometry new matchExtent: 100 @ 50);
		  extent: 100 @ 100;
		  background: BlocPresentationHelper background;
		  border: BlocPresentationHelper border
]

{ #category : 'examples' }
GeometryExperiment class >> donutAnnulusGeometry [

	<sampleInstance>
	| elt |
	elt := BlElement new
		       size: 400 @ 400;
		       addChildren: ({
				        ((-90 to: 30) -> (Color
						          r: 111
						          g: 91
						          b: 149
						          range: 255)).
				        ((30 to: 60) -> (Color
						          r: 152
						          g: 138
						          b: 193
						          range: 255)).
				        ((60 to: 120) -> (Color
						          r: 237
						          g: 150
						          b: 54
						          range: 255)).
				        ((120 to: 150) -> (Color
						          r: 243
						          g: 189
						          b: 55
						          range: 255)).
				        ((150 to: 230) -> (Color
						          r: 36
						          g: 174
						          b: 226
						          range: 255)).
				        ((230 to: 270) -> (Color
						          r: 99
						          g: 197
						          b: 198
						          range: 255)) } collect: [ :each |
					        BlElement new
						        geometry: (BlAnnulusSectorGeometry new
								         startAngle: each key first;
								         endAngle: each key last);
						        background: each value;
						        constraintsDo: [ :c |
							        c horizontal matchParent.
							        c vertical matchParent ] ]).
	elt openInNewSpace.
	^ elt
]

{ #category : 'examples' }
GeometryExperiment class >> ellipse [

	<sampleInstance>

	^ BlElement new
		  geometry: (BlEllipseGeometry new matchExtent: 100 @ 50);
		  size: 100 @ 50;
		  background: BlocPresentationHelper background;
		  border: BlocPresentationHelper border
]

{ #category : 'examples' }
GeometryExperiment class >> line [

	<sampleInstance>

	^ BlElement new
		  geometry: (BlLineGeometry from: 10 @ 10 to: 90 @ 90);
		  size: 100 @ 100;
		  background: BlocPresentationHelper background;
		  outskirts: BlOutskirts centered;
		  border: BlocPresentationHelper border
]

{ #category : 'examples' }
GeometryExperiment class >> polygon [

	<sampleInstance>

	^ BlElement new
		  geometry: (BlPolygonGeometry vertices: {
						   (10 @ 10).
						   (10 @ 90).
						   (50 @ 50).
						   (90 @ 90).
						   (90 @ 10) });
		  size: 100 @ 100;
		  background: BlocPresentationHelper background;
		  border: BlocPresentationHelper border
]

{ #category : 'examples' }
GeometryExperiment class >> polyline [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlPolylineGeometry vertices: {
						   (10 @ 10).
						   (10 @ 90).
						   (50 @ 50).
						   (90 @ 90).
						   (90 @ 10) });
		  extent: 100 @ 100;
		  background: BlocPresentationHelper background;
		  border: BlocPresentationHelper border
]

{ #category : 'examples' }
GeometryExperiment class >> rectangle [

	<sampleInstance>

	^ BlElement new
		  geometry: BlRectangleGeometry new;
		  background: BlocPresentationHelper background;
		  border: BlocPresentationHelper border;
		  size: 100 @ 70
]

{ #category : 'examples' }
GeometryExperiment class >> roundedRectangle [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 20);
		  background: BlocPresentationHelper background;
		  border: BlocPresentationHelper border;
		  extent: 100 @ 70
]

{ #category : 'examples' }
GeometryExperiment class >> square [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlSquareGeometry new matchExtent: 70 @ 70);
		  size: 100 @ 100;
		  background: BlocPresentationHelper background;
		  border: BlocPresentationHelper border
]

{ #category : 'examples' }
GeometryExperiment class >> triangle [

	<sampleInstance>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: BlocPresentationHelper background;
		  border: BlocPresentationHelper border;
		  extent: 100 @ 100
]

{ #category : 'see class side' }
GeometryExperiment >> seeClassSide [ 
]
