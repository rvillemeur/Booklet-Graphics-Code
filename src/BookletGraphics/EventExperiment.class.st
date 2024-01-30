Class {
	#name : #EventExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #accessing }
EventExperiment >> blAnnulusExample [

	<bookExample>
	| tagDict pingCount piAngles fromAngle chart centerLabel element |
	tagDict := {
		           ('A' -> 10).
		           ('B' -> 20).
		           ('C' -> 30).
		           ('D' -> 40) } asDictionary.

	pingCount := tagDict values sum.
	piAngles := tagDict associations collect: [ :assoc |
		            assoc key -> (assoc value / pingCount * 360) ].

	fromAngle := 0.

	chart := BlElement new size: 700 @ 700.

	centerLabel := BlElement new position: 300 @ 300.

	piAngles do: [ :el |
		| start end sec label |
		start := fromAngle.
		end := fromAngle + el value.
		sec := BlAnnulusSectorGeometry new
			       startAngle: start;
			       endAngle: end;
			       innerRadius: 0.5.

		label := BlTextElement new text: el key asRopedText.
		label position: 300 @ 300.

		fromAngle := el value + fromAngle.

		element := BlElement new
			           background: (BlColorPaint color: Color random);
			           size: 400 @ 400;
			           geometry: sec.

		element position: 100 @ 100.

		element
			addEventHandlerOn: BlMouseEnterEvent
			do: [ chart addChild: label as: #centerLabel ].

		element
			addEventHandlerOn: BlMouseLeaveEvent
			do: [ chart removeChildWithId: #centerLabel ].

		chart addChild: element ].
	chart openInNewSpace.

	^ chart
]

{ #category : #accessing }
EventExperiment >> blAnnulusExample2 [
	"you can click on part of the circle to put some action"

	<bookExample>
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
						        addEventHandler: (BlEventHandler
								         on: BlClickEvent
								         do: [ :e | self inform: each key ]);
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

{ #category : #example }
EventExperiment >> blocSpaceIntoMorphicExample [
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

{ #category : #example }
EventExperiment >> effectComposite [

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
EventExperiment >> effectGaussianShadow [

	<bookExample>
	^ BlElement new
		  size: 300 @ 150;
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		  background: (Color blue alpha: 0.5);
		  border: (BlBorder paint: Color red width: 10);
			effect: (BlGaussianShadowEffect color: Color yellow offset: 10@20 width: 5)
		
]

{ #category : #example }
EventExperiment >> effectSimpleShadow [

	<bookExample>
	^ BlElement new
		  size: 300 @ 150;
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
		  background: (Color blue alpha: 0.5);
		  border: (BlBorder paint: Color red width: 10);
			effect: (BlSimpleShadowEffect color: Color yellow offset: 10@20)
		
]

{ #category : #example }
EventExperiment >> effectSimpleShadow2 [

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
EventExperiment >> eventExample [
	"This is a new method"

	<bookExample>
	| elt |
	elt := BlElement new
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
		       border: (BlBorder paint: Color orange width: 4);
		       "layout: BlLinearLayout horizontal alignCenter;""constraintsDo: [:c | c horizontal matchParent. c vertical matchParent.];"
		       outskirts: BlOutskirts outside.

	elt addEventHandler: (BlEventHandler
			 on: BlMouseEnterEvent
			 do: [ :anEvent |
				 anEvent consumed: true.
				 anEvent consumed: true.
				 elt background: (Color red alpha: 0.2) ]).


	elt addEventHandler: (BlEventHandler
			 on: BlMouseLeaveEvent 
			 do: [ :anEvent |
				 anEvent consumed: true.
				 anEvent consumed: true.
				 elt background: (Color blue alpha: 0.2) ]).

	elt openInNewSpace.
	^ elt
]

{ #category : #accessing }
EventExperiment >> eventExampleMouseMove [

	<bookExample>
	| surface elt |
	elt := BlElement new
		       size: 20 @ 20;
		       geometry: (BlPolygonGeometry vertices: {
						        (10 @ 5).
						        (11.5 @ 9).
						        (15 @ 9).
						        (12.5 @ 11).
						        (13.5 @ 15).
						        (10 @ 13).
						        (6.5 @ 15).
						        (7.5 @ 11).
						        (5 @ 9).
						        (8.5 @ 9) });
		       background: (Color red alpha: 0.5);
		       border: (BlBorder paint: Color blue width: 1).

	surface := BlElement new
		           size: 400 @ 400;
		           geometry: BlSquareGeometry new;
		           background: (Color pink alpha: 0.2);
		           border: (BlBorder paint: Color orange width: 4).

	surface addChild: elt.
	elt position: -20 @ -20.

	surface addEventHandler: (BlEventHandler
			 on: BlMouseMoveEvent
			 do: [ :anEvent |
				 anEvent consumed: true.
				 elt position: anEvent localPosition + (10 @ 10) ]).

	surface addEventHandler: (BlEventHandler
			 on: BlMouseLeaveEvent
			 do: [ :anEvent |
				 anEvent consumed: true.
				 elt relocate: -20 @ -20 ]).
	surface openInNewSpace.
	^ surface
]

{ #category : #accessing }
EventExperiment >> exampleDragAndRainbow [

	<bookExample>
	| root stroke wh colors a |
	root := BlElement new
		        size: (wh := 640 @ 480);
		        background: Color black.
	stroke := BlBorder paint: Color black.

	"Draw a rainbow"
	colors := #( #red #orange #yellow #green #blue #purple ).
	1 to: (colors size) do: [ :i |
		| r el |
		r := colors size + 1 - i * 400 ** 0.8.
		el := BlElement new
			      size: r @ r;
			      geometry: (BlAnnulusSectorGeometry new
					       startAngle: 180;
					       endAngle: 360);
			      background: (Color named: (colors at: i));
			      border: stroke;
			      position: root extent + wh - (r @ r) / 2 + (0 @ 120).
		root addChild: el ].

	"Draggable card that says 'Rainbow!'"
	a := BlElement new
		     geometry: BlRectangleGeometry new;
		     size: 65 @ 24;
		     background: Color white;
		     border: stroke.
		     
		a addEventHandlerOn: BlMouseOverEvent
		     do: [ :e | a background: Color lightGray ].
		a addEventHandlerOn: BlMouseOutEvent
		     do: [ :e | a background: Color white ].
		
		a addEventHandler: BlPullHandler new disallowOutOfBounds;
		     addChild: (BlTextElement new
				      position: 5 @ 5;
				      text: ('Rainbow!' asRopedText attributes:
							       { (BlTextForegroundAttribute paint: Color black) })).

	root addChild: a.
	root openInNewSpace.
	^ root
]

{ #category : #accessing }
EventExperiment >> exampleMouseOver [

	<bookExample>
	| elt |
	elt := BlElement new
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
		       border: (BlBorder paint: Color black width: 1).

	elt addEventHandler: (BlEventHandler
			 on: BlMouseOverEvent 
			 do: [ :anEvent |
				 anEvent consumed: true.
				 elt
					 background: (Color blue alpha: 0.2);
					 border: (BlBorder paint: Color purple width: 1) ]).

	elt openInNewSpace.
	^ elt
]

{ #category : #example }
EventExperiment >> exampleWithDragAndDropEvent [
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
EventExperiment >> keyboardKeyAndSimulationExample [

	<bookExample>
	| space hero dxy speed simulatorProcess keyUpBlockByKey keyDownBlockByKey |
	"-- Setup visual properties of space and hero --""from http://ws.stfx.eu/5UQ515CAGRDU "
	space := BlSpace new.
	space
		position: 20 @ 20;
		extent: 640 @ 480;
		show.

	hero := BlElement new
		        size: 64 @ 64;
		        position: space extent // 3;
		        background: Color magenta;
		        yourself.

	space root
		addChild: hero;
		background: Color blue muchDarker.


	"-- Add some keyboard reactions --"

	dxy := 0 @ 0.
	speed := 2.

	keyDownBlockByKey := {
		                     (KeyboardKey up
		                      -> [ dxy := dxy x @ speed negated ]).
		                     (KeyboardKey down -> [ dxy := dxy x @ speed ]).
		                     (KeyboardKey left
		                      -> [ dxy := speed negated @ dxy y ]).
		                     (KeyboardKey right -> [ dxy := speed @ dxy y ]).
		                     (KeyboardKey Q -> [ space close ]) "quit" }
		                     asOrderedDictionary.

	keyUpBlockByKey := {
		                   (KeyboardKey up -> [ dxy := dxy x @ 0 ]).
		                   (KeyboardKey down -> [ dxy := dxy x @ 0 ]).
		                   (KeyboardKey left -> [ dxy := 0 @ dxy y ]).
		                   (KeyboardKey right -> [ dxy := 0 @ dxy y ]) }
		                   asOrderedDictionary.

	space root
		addEventHandler: (BlEventHandler
				 on: BlKeyDownEvent
				 do: [ :evt |
					 keyDownBlockByKey
						 at: evt key
						 ifPresent: [ :aBlock | aBlock value ] ]);
		addEventHandler: (BlEventHandler
				 on: BlKeyUpEvent
				 do: [ :evt |
					 keyUpBlockByKey
						 at: evt key
						 ifPresent: [ :aBlock | aBlock value ] ] yourself).

	hero enqueueTask: (BlRepeatedTaskAction new
			 delay: 0 milliSeconds;
			 action: [
				 dxy isZero ifFalse: [ hero position: hero position + dxy ] ];
			 yourself).

	simulatorProcess := [ "-- Simulate arrows, then quit --"
	                    {
		                    KeyboardKey right.
		                    KeyboardKey down.
		                    KeyboardKey left.
		                    KeyboardKey up } do: [ :simulatedKeyPress |
		                    space root dispatchEvent: (BlKeyDownEvent new
				                     key: simulatedKeyPress;
				                     yourself).
		                    0.75 seconds wait.
		                    space root dispatchEvent: (BlKeyUpEvent new
				                     key: simulatedKeyPress;
				                     yourself) ].

	                    "Quit"
	                    space root dispatchEvent: (BlKeyDownEvent new
			                     key: KeyboardKey Q;
			                     yourself) ] fork
]
