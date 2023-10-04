Class {
	#name : #GeometryExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #examples }
GeometryExperiment >> annulus [

	<bookExample>
	^BlElement new
		geometry: (BlAnnulusSectorGeometry new
			startAngle: 225;
			endAngle: 360;
			innerRadius: 0.3;
			outerRadius: 0.9);
		size: 100 @ 100;
		background: Color yellow;
		outskirts: (BlOutskirts centered );
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build)
]

{ #category : #examples }
GeometryExperiment >> bezier [

	<bookExample>
	^BlElement new
		geometry: (BlBezierCurveGeometry controlPoints: { 5@0. 25@80. 75@30. 95@100 });
		size: 100 @ 100;
		background: Color yellow;
		outskirts: (BlOutskirts centered );
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build)
]

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

	<bookExample>
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

	<bookExample>
	^BlElement new
		geometry: (BlLineGeometry from: 0@0 to: 50@50);
		size: 100 @ 100;
		background: Color yellow;
		outskirts: (BlOutskirts centered );
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build)
]

{ #category : #examples }
GeometryExperiment >> polygon [

	<bookExample>
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

	<bookExample>
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

	<bookExample>
	^BlElement new
		geometry: (BlRectangleGeometry  new);
		background: Color orange;
		border: (BlBorder builder
				 paint: Color red;
				 width: 10;
				 build);
		size: 100 @ 100
]

{ #category : #examples }
GeometryExperiment >> roundedRectangle [

	<bookExample>
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

	<bookExample>
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

	<bookExample>
	^BlElement new
		geometry: (BlTriangleGeometry new
				 matchExtent: 50 @ 100;
				 beTop);
		background: Color orange;
		border: (BlBorder paint: Color red width: 10);
		size: 100 @ 100
]
