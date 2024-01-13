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
RdvBlocExperiment >> effectComposite [

	<bookExample>
	
	| compositeEffect|
	
	compositeEffect := BlCompositeEffect effects: {
		BlGaussianShadowEffect color: Color red width: 3 offset: 7 @ 11.
		BlGaussianShadowEffect color: Color green width: 7 offset: -5 @ 7.
		BlGaussianShadowEffect color: Color blue width: 11 offset: 7 @ -5 }.
	^ BlElement new
		  size: 300 @ 150;
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		  background: (Color blue alpha: 0.5);
		  border: (BlBorder paint: Color red width: 10);
			effect: compositeEffect
		
]

{ #category : #accessing }
RdvBlocExperiment >> effectGaussianShadow [

	<bookExample>
	^ BlElement new
		  size: 300 @ 150;
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		  background: (Color blue alpha: 0.5);
		  border: (BlBorder paint: Color red width: 10);
			effect: (BlGaussianShadowEffect color: Color yellow offset: 10@20 width: 5)
		
]

{ #category : #accessing }
RdvBlocExperiment >> effectSimpleShadow [

	<bookExample>
	^ BlElement new
		  size: 300 @ 150;
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		  background: (Color blue alpha: 0.5);
		  border: (BlBorder paint: Color red width: 10);
			effect: (BlSimpleShadowEffect color: Color yellow offset: 10@20)
		
]

{ #category : #accessing }
RdvBlocExperiment >> effectSimpleShadow2 [

	<bookExample>
	^ BlElement new
		  size: 200 @ 100;
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		  background: (Color red alpha: 0.2);
		  border: (BlBorder paint: Color yellow width: 1);
		  "layout: BlLinearLayout horizontal alignCenter;""constraintsDo: [:c | c horizontal matchParent. c vertical matchParent.];"
		  outskirts: BlOutskirts centered;
		  effect:
			  (BlSimpleShadowEffect color: Color orange offset: -10 @ -20)
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
	| element space |
	space := BlSpace new.

	element := BlElement new
		           size: 200 @ 200;
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
		           border: (BlBorder paint: Color white width: 1);
		           outskirts: BlOutskirts inside.

	element addEventHandler: (BlEventHandler
			 on: BlMouseEnterEvent
			 do: [ :anEvent |
				 anEvent consumed: true.
				 element background: (Color red alpha: 0.2) ]).

	element addEventHandler: (BlEventHandler
			 on: BlMouseLeaveEvent
			 do: [ :anEvent |
				 anEvent consumed: true.
				 element background: (Color blue alpha: 0.2) ]).

	space root addChild: element.
	space show.

	^ space
]

{ #category : #'as yet unclassified' }
RdvBlocExperiment >> exampleWithEvent2 [
	<bookExample>
	| space elt offset |
	space := BlSpace new.

	elt := BlElement new
		       background: Color purple;
		       size: 100 @ 100.

	elt
		addEventHandlerOn: BlBaseDragEvent
		do: [ elt background: Color random ].

	elt addEventHandlerOn: BlDragStartEvent do: [ :event |
		event consumed: true.
		offset := event position - elt position ].

	elt
		addEventHandlerOn: BlDragEvent
		do: [ :event | elt position: event position - offset ].


	space root addChild: elt.
	space show.
	^space.
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
