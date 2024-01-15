Class {
	#name : #RdvLayoutBlock,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #'as yet unclassified' }
RdvLayoutBlock >> basicLayoutExample [

	<bookExample>
	| space root elt1 elt2 |
	space := BlSpace new.

	"BlBasicLayout let you position your children at the position you want them to be
	Layout constraint are irrelevant for this layout, you should specify the size of 
	each child element to be added. Those child can them implement their own layout strategy"
	root := BlElement new
		        border: (BlBorder paint: Color red width: 1);
		        background: (Color red alpha: 0.2);
		        "not necessary, except for reminder, this is the default layout"
				  "layout: BlBasicLayout new;"
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ].

	elt1 := BlElement new
		        border: (BlBorder paint: Color blue width: 1);
		        size: 40 @ 80;
		        background: (Color blue alpha: 0.2);
		        position: 50 @ 40.
	elt2 := BlElement new
		        border: (BlBorder paint: Color yellow width: 1);
		        size: 40 @ 80;
		        background: (Color yellow alpha: 0.2);
		        position: 60 @ 60.

	root addChildren: {
			elt1.
			elt2 }.
	space root addChild: root.
	space show.
	^ space
]

{ #category : #'as yet unclassified' }
RdvLayoutBlock >> flowLayoutExample [

	<bookExample>
	| space root |
	space := BlSpace new.

	root := BlElement new
		        border: (BlBorder paint: Color red width: 1);
		        background: (Color red alpha: 0.2);
		        layout: BlFlowLayout horizontal;
				constraintsDo: [ :c |
			           c horizontal matchParent .
			           c vertical fitContent  ].
	"Child need to specify their size. If they use constraint, the last one will hide previous one.
	They will fit available space + move to next line if necessary"

	50 timesRepeat: [
		| elt |
		elt := BlElement new
			       size: 40 @ 80;
			       border: (BlBorder paint: Color blue width: 1);
			       background: (Color blue alpha: 0.2);
			       margin: (BlInsets all: 5).
		root addChild: elt ].

	space root addChild: root.
	space show.
	^ space
]

{ #category : #'as yet unclassified' }
RdvLayoutBlock >> gridLayoutExample [

	<bookExample>
	| space container e1 e2 e3 e4 e5 |
	space := BlSpace new.

	e1 := BlElement new
		      constraintsDo: [ :c |
			      c horizontal matchParent.
			      c vertical matchParent ];
		      background: (Color red alpha: 0.2);
		      border: (BlBorder paint: Color red width: 1).

	e2 := BlElement new
		      constraintsDo: [ :c |
			      c horizontal matchParent.
			      c vertical matchParent ];
		      background: (Color yellow alpha: 0.2);
		      border: (BlBorder paint: Color yellow width: 1).
	e3 := BlElement new
		      constraintsDo: [ :c |
			      c horizontal matchParent.
			      c vertical matchParent ];
		      background: (Color blue alpha: 0.2);
		      border: (BlBorder paint: Color blue width: 1).

	e4 := BlElement new
		      constraintsDo: [ :c |
			      c horizontal matchParent.
			      c vertical matchParent ];
		      background: (Color green alpha: 0.2);
		      margin: (BlInsets all: 5);
		      border: (BlBorder paint: Color green width: 1).

	e5 := BlElement new
		      constraintsDo: [ :c |
			      c horizontal matchParent.
			      c vertical matchParent.
			      c grid horizontal span: 4 ];
		      background: (Color purple alpha: 0.2);
		      border: (BlBorder paint: Color purple width: 1).

	container := BlElement new
		             layout: (BlGridLayout new
				              columnCount: 4;
				              cellSpacing: 10);
		             background: Color veryLightGray;
		             border: (BlBorder paint: Color gray width: 3);
		             constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical matchParent ];
		             addChildren: {
				             e1.
				             e2.
				             e3.
				             e4.
				             e5 };
		             yourself.
	space root addChild: container.

	space show.
	^ space
]

{ #category : #accessing }
RdvLayoutBlock >> layout1 [
	"This is a new method"

	<bookExample>
	^ BlElement new
		  layout: BlLinearLayout horizontal;
		  size: 400 @ 300;
		  background: (Color gray alpha: 0.2);
		  addChildren: {
				  (BlElement new
					   size: 100 @ 200;
					   background: (Color red alpha: 0.2)).
				  (BlElement new
					   size: 200 @ 100;
					   background: (Color blue alpha: 0.2)) }
]

{ #category : #accessing }
RdvLayoutBlock >> layout2 [
	"This is a new method"

	<bookExample>
	^ BlElement new
		  layout: BlLinearLayout horizontal alignCenter;
		  size: 400 @ 300;
		  background: (Color gray alpha: 0.2);
		  addChildren: {
				  (BlElement new
					   size: 100 @ 200;
					   background: (Color red alpha: 0.2)).
				  (BlElement new
					   size: 200 @ 100;
					   background: (Color blue alpha: 0.2)) }
]

{ #category : #accessing }
RdvLayoutBlock >> layout3 [
	"This is a new method"

	<bookExample>
	^ BlElement new
		  layout: BlLinearLayout horizontal;
		  size: 400 @ 300;
		  background: (Color gray alpha: 0.2);
		  addChildren: {
				  (BlElement new
					   size: 100 @ 200;
					   background: (Color red alpha: 0.2)).
				  (BlElement new
					   size: 200 @ 100;
					   background: (Color blue alpha: 0.2);
					   constraintsDo: [ :c |
						   c ignoreByLayout.
						   c vertical exact: 200.
						   c horizontal exact: 100.
						   c ignored horizontal alignRight.
						   c ignored vertical alignBottom ]) } "alignCenter"
]

{ #category : #accessing }
RdvLayoutBlock >> layout4 [
	"This is a new method"

	<bookExample>
	^ BlElement new
		  layout: BlLinearLayout horizontal;
		  size: 400 @ 300;
		  background: (Color gray alpha: 0.2);
		  addChildren: {
				  (BlElement new
					   size: 100 @ 200;
					   background: (Color red alpha: 0.2)).
				  (BlElement new
					   size: 200 @ 100;
					   background: (Color blue alpha: 0.2);
					   constraintsDo: [ :c |
						   c ignoreByLayout.
						   c vertical exact: 200.
						   c horizontal exact: 100.
						   c horizontal matchParent.
						   c ignored horizontal alignRight.
						   c ignored vertical alignBottom ]) } "alignCenter"
]

{ #category : #accessing }
RdvLayoutBlock >> layout5 [
	"This is a new method"

	<bookExample>
	^ BlElement new
		  layout: BlLinearLayout horizontal alignCenter;
		  size: 400 @ 300;
		  background: (Color gray alpha: 0.2);
		  addChildren: {
				  (BlElement new
					   size: 100 @ 200;
					   background: (Color red alpha: 0.2)).
				  (BlElement new
					   size: 200 @ 100;
					   background: (Color blue alpha: 0.2);
					   constraintsDo: [ :c | c margin: (BlInsets all: 10) ]) }
]

{ #category : #'as yet unclassified' }
RdvLayoutBlock >> linearLayoutExample [

	<bookExample>
	| space root |
	space := BlSpace new.

	root := BlElement new
		        border: (BlBorder paint: Color red width: 1);
		        background: (Color red alpha: 0.2);
		        layout: BlLinearLayout horizontal ;
				  constraintsDo: [ :c |
			           c horizontal fitContent.
			           c vertical fitContent  ].

	"Child can use dynamic size with constraints. The number of element will then fit its 
	parents available space. 	If you specify their size, and the total is over its parents, 
	they will be hidden. need to specify their size. If they use constraint, the last one 
	will hide previous one. They will fit available space + move to next line if necessary"
	
	50 timesRepeat:  [  |elt| elt := BlElement new border: (BlBorder paint: Color blue width: 1);
					size: 40@80;
		           background: (Color blue alpha: 0.2);
		           margin: (BlInsets all: 5);
		           padding: (BlInsets all: 5).

			root addChild: elt. ].


	space root addChild: root.
	space show.
	^ space
]

{ #category : #'as yet unclassified' }
RdvLayoutBlock >> multipleElement [

	<bookExample>
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
		            border: (BlBorder  paint: (Color orange) width: 5);
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
RdvLayoutBlock >> multipleElement2 [

	<bookExample>
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
		        "layout: BlLinearLayout horizontal alignCenter ;"
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        background: Color lightRed;
		        border: (BlBorder paint: Color red width: 5).
	element1 := BlElement new
						size: 100@100;
						position: 50@50;
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
						geometryBounds: (BlBounds origin: 0@0 extent: 50@50 );
		            border: (BlBorder paint: Color orange width: 5);
		            background: Color lightOrange;
		            outskirts: BlOutskirts centered.

		box1 addChild: element1.
	"element1 position: 100@50; forceLayout."
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
RdvLayoutBlock >> multipleElementAlignments [

	<bookExample>
	| element1 element2 element3 container box1 box2 box3 |
	container := BlElement new
		             size: 450 @ 150;
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal alignCenter;
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
						constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent  ];
		            border: (BlBorder paint: Color orange width: 5);
		            background: Color lightOrange;
		            outskirts: BlOutskirts centered.

	box1 addChild: element1.
	box2 := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter  ;
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
		        layout: BlLinearLayout horizontal alignBottomLeft  ;
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
RdvLayoutBlock >> multipleElementFitParameter [

	<bookExample>
	| element1 element2 element3 container box1 box2 box3 |
	container := BlElement new
		             size: 450 @ 150;
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal alignCenter ;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3).
	box1 := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal fitContent   .
			        c vertical fitContent ];
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
			        c horizontal fitContent.
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
			        c vertical fitContent  ];
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
RdvLayoutBlock >> multipleElementFitParameter2 [

	<bookExample>
	| element1 element2 element3 container box1 box2 box3 |
	container := BlElement new
		             size: 450 @ 150;
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal alignCenter ;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3).
	box1 := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal fitContent   .
			        c vertical fitContent ];
		        background: Color lightRed;
		        border: (BlBorder paint: Color red width: 5).
	element1 := BlElement new
		            size: 20 @ 20;
		            geometry: (BlPolygonGeometry vertices: {
						              (10 @ 0).
						              (13 @ 8).
						              (20 @ 8).
						              (15 @ 12).
						              (17 @ 20).
						              (10 @ 16).
						              (3 @ 20).
						              (5 @ 12).
						              (0 @ 8).
						              (7 @ 8) });
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
		            size: 20 @ 20;
		            geometry: (BlPolygonGeometry vertices: {
						              (10 @ 0).
						              (13 @ 8).
						              (20 @ 8).
						              (15 @ 12).
						              (17 @ 20).
						              (10 @ 16).
						              (3 @ 20).
						              (5 @ 12).
						              (0 @ 8).
						              (7 @ 8) });
		            border: (BlBorder paint: Color green width: 5);
						transformDo: [ :t | t "BlTransformationBuilder" scaleBy: (BlVector x: 4 y: 2 z: 1) ];
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
			        c vertical fitContent  ];
		         background: Color lightBlue;
		        border: (BlBorder paint: Color blue width: 5).
	element3 := BlElement new
		            size: 20 @ 20;
		            geometry: (BlPolygonGeometry vertices: {
						              (10 @ 0).
						              (13 @ 8).
						              (20 @ 8).
						              (15 @ 12).
						              (17 @ 20).
						              (10 @ 16).
						              (3 @ 20).
						              (5 @ 12).
						              (0 @ 8).
						              (7 @ 8) });
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
RdvLayoutBlock >> spacingAndPaddindExampleWithTriangleGeometry [

	<bookExample>
	| space root element child |
	space := BlSpace new.

	root := BlElement new
		        size: 400 @ 500;
		        geometry: BlTriangleGeometry new;
		        border: (BlBorder paint: Color red width: 1);
		        background: (Color red alpha: 0.2);
		        layout: BlFlowLayout horizontal alignCenter.

	element := BlElement new
		           border: (BlBorder paint: Color blue width: 1);
		           geometry: BlTriangleGeometry new;
		           background: (Color blue alpha: 0.2);
		           margin: (BlInsets all: 15);
		           padding: (BlInsets all: 25);
		           layout: BlFlowLayout horizontal alignCenter;
		           constraintsDo: [ :c |
			           c horizontal matchParent.
			           c vertical matchParent ].

	root addChild: element.


	child := BlElement new
		         border: (BlBorder paint: Color yellow width: 1);
		         geometry: BlTriangleGeometry new;
		         background: (Color yellow alpha: 0.2);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical matchParent ].
	element addChild: child.
	space root addChild: root.
	space show.
	^ space
]

{ #category : #'as yet unclassified' }
RdvLayoutBlock >> spacingAndPaddingdExample [

	<bookExample>
	| space root element child |
	space := BlSpace new.

	root := BlElement new
				 "no dynamic constraints, we specify element size"
		        size: 400 @ 400;
		        border: (BlBorder paint: Color red width: 1);
		        background: (Color red alpha: 0.2);
		        layout: BlFlowLayout horizontal alignCenter.

	element := BlElement new
		           border: (BlBorder paint: Color blue width: 1);
		           background: (Color blue alpha: 0.2);
		           margin: (BlInsets all: 15);
		           padding: (BlInsets all: 35);
					  "element has a child, specify its layoutSpec: "
		           layout: BlFlowLayout horizontal alignCenter;
					 "dynamic size computed relatively to its parent"
		           constraintsDo: [ :c |
			           c horizontal matchParent.
			           c vertical matchParent ].

	root addChild: element.

	child := BlElement new
		         border: (BlBorder paint: Color yellow width: 1);
		         background: (Color yellow alpha: 0.2);
					"dynamic size computed relatively to its parent"
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical matchParent ].
	element addChild: child.
	space root addChild: root.
	space show.
	^ space
]

{ #category : #accessing }
RdvLayoutBlock >> squareSurroundedByNumbers [

	<bookExample>
	^ BlElement new
		  layout: (BlGridLayout horizontal columnCount: 3);
		  constraintsDo: [ :c |
			  c horizontal matchParent.
			  c vertical matchParent ];
		  addChildren: {
				  (BlTextElement new text: '5,0' asRopedText).
				  (BlElement new size: 0 @ 0).
				  (BlTextElement new text: '13,0' asRopedText).

				  "middle row"
				  (BlElement new size: 0 @ 0).
				  (BlElement new
					   constraintsDo: [ :c |
						   c horizontal matchParent.
						   c vertical matchParent ];
					   border: (BlBorder paint: Color gray width: 1)).
				  (BlElement new size: 0 @ 0).

				  "bottom row"
				  (BlTextElement new text: '5,25' asRopedText).
				  (BlElement new size: 0 @ 0).
				  (BlTextElement new text: '13,25' asRopedText) }
	"top row"
]

{ #category : #accessing }
RdvLayoutBlock >> zoomLayoutExample [

	<bookExample>
	| container elt space |
	space := BlSpace new.

	elt := BlElement new
				size: 200@200;
		       background: (Color blue alpha: 0.2);
		       border: (BlBorder paint: Color blue width: 1);
		constraintsDo: [ :c | c accountTransformation ].

	container := BlElement new
		             background: Color white;
		             border: (BlBorder paint: Color gray width: 1);
		             geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
		             padding: (BlInsets
				              top: 10
				              left: 10
				              bottom: 10
				              right: 10);
		             layout: (BlZoomableLayout new
				              addLayout: BlFrameLayout new;
				              defaultScale: 2;
				              animationDuration: 1 second);
		             constraintsDo: [ :c |
			             c vertical fitContent.
			             c horizontal fitContent ];
		             addChild: elt;
		             yourself.

	space root addChild: container.
	space show.
	^ space
]
