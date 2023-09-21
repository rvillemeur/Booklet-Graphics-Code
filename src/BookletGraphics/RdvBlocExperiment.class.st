Class {
	#name : #RdvBlocExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #accessing }
RdvBlocExperiment >> animatedIconExample [
<gtExample>

|icon elt|

icon := BrGlamorousVectorIcons transcript asElement.
icon constraintsDo: [ :c | c accountTransformation ].

elt := BlElement new
    background: Color white;
    border: (BlBorder paint: Color gray width: 1);
    geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
    padding: (BlInsets top: 5 left: 10 bottom: 5 right: 10);
    layout: (BlZoomableLayout new addLayout: BlFrameLayout new; defaultScale: 2; animationDuration: 1 second);
    constraintsDo: [ :c |
        c vertical fitContent.
        c horizontal fitContent ];
    addChild: icon;
    yourself.
    
^elt
]

{ #category : #accessing }
RdvBlocExperiment >> example1 [

	<bookExample>
	^ BlElement new
		  size: 200 @ 100;
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		  background: (Color gray alpha: 0.2);
		  border: (BlBorder paint: Color red width: 1);
		  "layout: BlLinearLayout horizontal alignCenter;""constraintsDo: [:c | c horizontal matchParent. c vertical matchParent.];"
		  outskirts: BlOutskirts centered
]

{ #category : #accessing }
RdvBlocExperiment >> example2 [

	<bookExample>
	^ BlElement new
		  size: 22 @ 14;
		  layout: BlFrameLayout new;
		  padding: (BlInsets all: 3);
		  border: (BlBorder builder
				   width: 1;
				   build);
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 8)
]

{ #category : #accessing }
RdvBlocExperiment >> exampleWithEvent [

	<bookExample>
	| element |
	element := BlDevElement new
		           size: 200 @ 200;
		           geometry: (BlPolygon vertices: {
						            (100 @ 50).
						            (115 @ 90).
						            (150 @ 90).
						            (125 @ 110).
						            (135 @ 150).
						            (100 @ 130).
						            (65 @ 150).
						            (75 @ 110).
						            (50 @ 90).
						            (85 @ 90) });
		           background: (Color pink alpha: 0.2);
		           border: (BlBorder paint: Color white width: 1);
		           "layout: BlLinearLayout horizontal alignCenter;""constraintsDo: [:c | c horizontal matchParent. c vertical matchParent.];"
		           outskirts: BlOutskirts inside.

	element when: BlMouseEnterEvent do: [ :anEvent |
		anEvent consumed: true.
		element background: (Color red alpha: 0.2) ].

	element when: BlMouseLeaveEvent do: [ :anEvent |
		anEvent consumed: true.
		element background: (Color blue alpha: 0.2) ].

	^ element
]

{ #category : #accessing }
RdvBlocExperiment >> frameDrawingExample [
<gtExample>
^BlElement new
    layout: (BlGridLayout horizontal columnCount: 3);
    constraintsDo: [ :c |
        c horizontal matchParent.
        c vertical matchParent ];
    addChildren: {
        "top row"
        (BlTextElement new text: '5,0' asRopedText).
        (BlElement new size: 0@0).
        (BlTextElement new text: '13,0' asRopedText).
        
        "middle row"
        (BlElement new size: 0@0).
        (BlElement new
            constraintsDo: [ :c |
                c horizontal matchParent.
                c vertical matchParent ];
            border: (BlBorder paint: Color gray width: 1)).
        (BlElement new size: 0@0).
        
        "bottom row"
        (BlTextElement new text: '5,25' asRopedText).
        (BlElement new size: 0@0).
        (BlTextElement new text: '13,25' asRopedText). }
]

{ #category : #accessing }
RdvBlocExperiment >> helloWorldScene [
	<gtExample>
	| aContainer |
	
	aContainer := BrVerticalPane new
		matchParent;
		alignCenter.
		
	aContainer addChild: (BrLabel new
		aptitude: (BrGlamorousLabelAptitude new fontSize: 30);
		text: 'Hello world!').
		
	^ aContainer
]

{ #category : #accessing }
RdvBlocExperiment >> iconScaleToFitElementExample [
<gtExample>
|icon scaledIcon e|
icon := BrGlamorousVectorIcons transcript asElement.
scaledIcon := icon asScalableElement
    scaleStrategy: (BlScalableFixedStrategy zoom: 2);
    constraintsDo: [ :c |
        c horizontal fitContent.
        c vertical fitContent ].
    
e := BlElement new
    background: Color white;
    border: (BlBorder paint: Color gray width: 1);
    geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
    padding: (BlInsets top: 5 left: 10 bottom: 5 right: 10);
    layout: BlFrameLayout new;
    constraintsDo: [ :c |
        c vertical fitContent.
        c horizontal fitContent ];
    addChild: scaledIcon;
    yourself.
    
^e
]

{ #category : #'as yet unclassified' }
RdvBlocExperiment >> multipleElement [

	<bookExample>
	| element1 element2 element3 container box1 box2 box3 |
	container := BlElement new
		             size: 450 @ 150;
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 1);
		             padding: (BlInsets all: 4);
		             layout: BlLinearLayout horizontal;
		             border: (BlBorder paint: Color black width: 2).
	box2 := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 1);
		        padding: (BlInsets all: 1);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        border: (BlBorder paint: Color red width: 2).
	box3 := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 1);
		        padding: (BlInsets all: 1);
		        layout: BlLinearLayout horizontal;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        border: (BlBorder paint: Color yellow width: 2).
	box1 := BlElement new
		        size: 150 @ 150;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 1);
		        padding: (BlInsets all: 1);
		        layout: BlLinearLayout horizontal;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        border: (BlBorder paint: Color blue width: 2).
	container addChildren: {
			box1.
			box2.
			box3 }.
	element1 := BlElement new
		            size: 150 @ 150;
		            geometry: (BlPolygonGeometry vertices: {
						             (100 @ 50).
						             (115 @ 90).
						             (150 @ 90).
						             (125 @ 110).
						             (135 @ 150).
						             (100 @ 130).
						             (65 @ 150).
						             (75 @ 110).
						             (50 @ 90).
						             (85 @ 90) });
		            background: (Color pink alpha: 0.2);
		            constraintsDo: [ :c |
			            c horizontal matchParent.
			            c vertical matchParent ];
		            border: (BlBorder paint: Color white width: 2);
		            outskirts: BlOutskirts inside.
	box1 addChild: element1.
	element2 := BlElement new
		            size: 150 @ 150;
		            geometry: (BlPolygonGeometry vertices: {
						             (100 @ 50).
						             (115 @ 90).
						             (150 @ 90).
						             (125 @ 110).
						             (135 @ 150).
						             (100 @ 130).
						             (65 @ 150).
						             (75 @ 110).
						             (50 @ 90).
						             (85 @ 90) });
		            background: (Color pink alpha: 0.2);
		            constraintsDo: [ :c |
			            c horizontal matchParent.
			            c vertical matchParent ];
		            border: (BlBorder paint: Color white width: 2);
		            outskirts: BlOutskirts outside.
	box2 addChild: element2.
	element3 := BlElement new
		            size: 150 @ 150;
		            geometry: (BlPolygonGeometry vertices: {
						             (100 @ 50).
						             (115 @ 90).
						             (150 @ 90).
						             (125 @ 110).
						             (135 @ 150).
						             (100 @ 130).
						             (65 @ 150).
						             (75 @ 110).
						             (50 @ 90).
						             (85 @ 90) });
		            background: (Color pink alpha: 0.2);
		            constraintsDo: [ :c |
			            c horizontal matchParent.
			            c vertical matchParent ];
		            border: (BlBorder paint: Color white width: 2);
		            outskirts: BlOutskirts centered.
	box3 addChild: element3.

	^ container
]

{ #category : #accessing }
RdvBlocExperiment >> openSpaceInNewWindowExample [
<bookExample>
	| aSpace |
	
	aSpace := BlSpace new
		addChild: self helloWorldScene;
		extent: 800@600;
		title: 'Hello World'.

	^ aSpace show
]
