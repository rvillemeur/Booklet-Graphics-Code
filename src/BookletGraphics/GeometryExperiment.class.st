Class {
	#name : #GeometryExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #examples }
GeometryExperiment >> circle [

	<bookExample>
	^BlElement new
		geometry: (BlCircleGeometry new matchExtent: 100 @ 50);
		size: 100 @ 50;
		background: Color yellow;
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build)
]

{ #category : #examples }
GeometryExperiment >> ellipse [

	<script: 'self new ellipse inspect'>
	^BlElement new
		geometry: (BlEllipseGeometry new matchExtent: 100 @ 50);
		size: 100 @ 50;
		background: Color yellow;
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build)
]

{ #category : #examples }
GeometryExperiment >> line [

	<gtExample>
	^BlElement new
		geometry: (BlLineGeometry from: 0@0 to: 50@50);
		size: 100 @ 100;
		background: Color yellow;
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build)
]

{ #category : #examples }
GeometryExperiment >> polygon [

	<gtExample>
	^BlElement new
		geometry: (BlPolygonGeometry vertices: {
						 (10 @ 10).
						 (10 @ 90).
						 (50 @ 50).
						 (90 @ 90).
						 (90 @ 10) });
		size: 100 @ 50;
		background: Color yellow;
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build)
]

{ #category : #examples }
GeometryExperiment >> polyline [

	<gtExample>
	^BlElement new
		geometry: (BlPolylineGeometry vertices: {
						 (10 @ 10).
						 (10 @ 90).
						 (50 @ 50).
						 (90 @ 90).
						 (90 @ 10) });
		size: 100 @ 90;
		background: Color yellow;
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build)
]

{ #category : #examples }
GeometryExperiment >> rectangle [

	<gtExample>
	^BlElement new
		geometry: (BlRoundedRectangleGeometry cornerRadius: 20);
		background: Color orange;
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build);
		size: 100 @ 100
]

{ #category : #examples }
GeometryExperiment >> square [

	<gtExample>
	^BlElement new
		geometry: (BlSquareGeometry new matchExtent: 70 @ 70);
		size: 100 @ 90;
		background: Color yellow;
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build)
]

{ #category : #examples }
GeometryExperiment >> triangle [

	<gtExample>
	^BlElement new
		geometry: (BlTriangleGeometry new
				 matchExtent: 50 @ 100;
				 beTop);
		background: Color orange;
		size: 100 @ 100
]
