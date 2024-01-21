Class {
	#name : #RdvBlocExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #example }
RdvBlocExperiment >> blocSpaceIntoMorphicExample [
<bookExample>
	| spacePresenter aSpace |
	
	"copy this example from bloc-spec2. It's really cool to open a bloc space window into morphic"
	spacePresenter := SpBlSpaceInMorphPresenter new.

	"The space is ready to play with it"
	aSpace := spacePresenter space.

	aSpace root
		background: Color paleBlue;
		layout: BlFlowLayout horizontal.

	50 timesRepeat: [ 
		aSpace root addChild:
			(BlElement new
				background: Color random translucent;
				addEventHandlerOn: BlMouseEnterEvent
					do: [ :evt | evt target
						background: Color random ];
				yourself) ].

	spacePresenter open.

	^ spacePresenter
]

{ #category : #'as yet unclassified' }
RdvBlocExperiment >> centerAndSize [

	<bookExample>
	| centersAndSizes container |
	centersAndSizes := {
		                   {
			                   (50 @ 10).
			                   (100 @ 10) }.
		                   {
			                   (50 @ 10).
			                   (80 @ 15) } }.
	container := BlElement new
		             size: 200 @ 100;
		             yourself.
	centersAndSizes do: [ :c |
		container addChild: (BlElement new
				 background: (Color random alpha: 0.5);
				 position: c first - (c second / 2);
				 size: c second;
				 yourself) ].
	^container
]

{ #category : #example }
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

{ #category : #example }
RdvBlocExperiment >> effectGaussianShadow [

	<bookExample>
	^ BlElement new
		  size: 300 @ 150;
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		  background: (Color blue alpha: 0.5);
		  border: (BlBorder paint: Color red width: 10);
			effect: (BlGaussianShadowEffect color: Color yellow offset: 10@20 width: 5)
		
]

{ #category : #example }
RdvBlocExperiment >> effectSimpleShadow [

	<bookExample>
	^ BlElement new
		  size: 300 @ 150;
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		  background: (Color blue alpha: 0.5);
		  border: (BlBorder paint: Color red width: 10);
			effect: (BlSimpleShadowEffect color: Color yellow offset: 10@20)
		
]

{ #category : #example }
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

{ #category : #example }
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

{ #category : #example }
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

{ #category : #example }
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

{ #category : #example }
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

{ #category : #'as yet unclassified' }
RdvBlocExperiment >> transformExample [

	<bookExample>
	| aContainer node space |
	space := BlSpace new.
	aContainer := BlElement new
		              layout: BlFrameLayout new;
		              constraintsDo: [ :c |
			              c horizontal fitContent.
			              c vertical fitContent ];
		              padding: (BlInsets all: 20);
		              background: (Color gray alpha: 0.2).

	node := BlElement new
		        geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
		        border: (BlBorder paint: Color black width: 2);
		        background: Color white;
		        constraintsDo: [ :c |
			        c frame horizontal alignCenter.
			        c frame vertical alignBottom ];
		        size: 20 @ 20.

	aContainer transformDo: [ :t |
		t
			scaleBy: 2.0;
			rotateBy: 69;
			translateBy: 50 @ 50 ].
	aContainer addChild: node.

	aContainer forceLayout.

	space root addChild: aContainer.
	space show.
	^ space
]
