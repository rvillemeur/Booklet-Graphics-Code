"
animation experiment and example in Bloc
"
Class {
	#name : 'AnimationExperiment',
	#superclass : 'Object',
	#category : 'BookletGraphics-Bloc',
	#package : 'BookletGraphics',
	#tag : 'Bloc'
}

{ #category : 'examples' }
AnimationExperiment class >> GaussianEffectAnimation [

	<sampleInstance>
	| element animation |
	element := BlElement new
		           size: 150 @ 150;
		           position: 25 @ 25;
		           background: Color yellow;
		           border: (BlBorder paint: Color red width: 3).

	animation := BlGaussianEffectOpacityAnimation new
		             delay: 1 second;
		             color: Color red;
		             width: 25;
		             opacity: 0.9;
		             duration: 300 milliSeconds.

	element addAnimation: animation.
	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> animatedBackground [

	<sampleInstance>
	| element animation |
	element := BlElement new size: 50 @ 50.

	animation := BlNumberTransition new
		             from: 0;
		             to: 1;
		             by: 0.5;
		             beInfinite;
		             duration: 3 seconds;
		             onStepDo: [ :aValue :anElement |
			             aValue < 0.5
				             ifTrue: [ anElement background: Color red ]
				             ifFalse: [ anElement background: Color blue ] ].

	element addAnimation: animation.
	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> animatedBackground2 [

	<sampleInstance>
	| element animation |
	element := BlElement new extent: 50 @ 50.

	animation := BlNumberTransition new
		             from: 0;
		             to: 1;
		             by: 0.5;
		             loops: 5;
		             duration: 3 seconds;
		             "onStepDo: is called on every space pulse. Color are updated at each pulse..."
		             onStepDo: [ :aValue :anElement |
				             aValue < 0.5
					             ifTrue: [ anElement background: Color random ]
					             ifFalse: [ anElement background: Color blue ] ].

	element addAnimation: animation.
	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> crossElement [

	<sampleInstance>
	| cross w h animation |
	w := 200.
	h := 200.
	cross := BlElement new
		         size: w @ h;
		         background: (BlBackground paint: (Color blue alpha: 0.2));
		         border: (BlBorder paint: Color black width: 2);
		         geometry: (BlPolygonGeometry vertices: {
						          (w / 3 @ 0).
						          (w / 3 * 2 @ 0).
						          (w / 3 * 2 @ (h / 3)).
						          (w @ (h / 3)).
						          (w @ (h / 3 * 2)).
						          (w / 3 * 2 @ (h / 3 * 2)).
						          (w / 3 * 2 @ h).
						          (w / 3 @ h).
						          (w / 3 @ (h / 3 * 2)).
						          (0 @ (h / 3 * 2)).
						          (0 @ (h / 3)).
						          (w / 3 @ (h / 3)) });
		         position: 30 @ 30.
	cross addEventHandler: (BlEventHandler
			 on: BlMouseEnterEvent
			 do: [ :anEvent | cross background: (Color red alpha: 0.2) ]).

	cross addEventHandler: (BlEventHandler
			 on: BlMouseLeaveEvent
			 do: [ :anEvent | cross background: (Color yellow alpha: 0.2) ]).

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey up);
			 action: [ :anEvent :aShortcut |
				 cross position: cross position - (0 @ 10) ]).

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey right);
			 action: [ :anEvent :aShortcut |
				 cross position: cross position + (10 @ 0) ]).

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey left);
			 action: [ :anEvent :aShortcut |
				 cross position: cross position - (10 @ 0) ]).

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey down);
			 action: [ :anEvent :aShortcut |
				 cross position: cross position + (0 @ 10) ]).

	animation := BlNumberTransition new
		             from: 0;
		             to: 1;
		             by: 0.5;
		             beInfinite;
		             duration: 3 seconds;
		             onStepDo: [ :aValue :anElement |
			             aValue < 0.5
				             ifTrue: [ anElement background: Color red ]
				             ifFalse: [ anElement background: Color blue ] ].

	cross addAnimation: animation.

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey S);
			 action: [ :anEvent :aShortcut | animation start ]).

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey E);
			 action: [ :anEvent :aShortcut | animation stop ]).

	cross openInNewSpace.
	cross requestFocus.
	^ cross
]

{ #category : 'examples' }
AnimationExperiment class >> dashArrayCircleAnimation [

	<sampleInstance>
	| element animation circomference extent |
	extent := 400 @ 400.
	circomference := Float pi * extent x.
	element := BlElement new
		           extent: extent;
		           geometry: BlCircleGeometry new;
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.

	animation := BlNumberTransition new
		             from: 0.05;
		             to: 0.25;
		             duration: 1 seconds;
		             onStepDo: [ :point |
				             | length |
				             length := circomference * point.
				             element border: (BlBorder builder
							              paint: (Color r: 0.7 g: 0.2 b: 348);
							              width: 16;
							              "dashOffset: anEvent progress * 32;"
											  dashArray: { 0 . length . 0};
							              capRound;
							              build) ].
	element addAnimation: animation.
	"animation := BlAnimation new
		             beInfinite;
						duration: 1 seconds.

	

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationStepEvent
			 do: [ :anEvent |
					 element border: (BlBorder builder
							  paint: (Color r: 0.7 g: 0.2 b: 348);
							  width: 16;
							  dashOffset: anEvent progress * 32;
							  dashArray: #( 0 24 0);
							  capRound;
							  build) ])."


	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> dashOffsetAnimation [

	<sampleInstance>
	| element animation |
	element := BlElement new
		           extent: 400 @ 400;
		           geometry: (BlCircleGeometry new matchExtent: 400 @ 400);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.

	animation := BlAnimation new
		             beInfinite;
		             duration: 1 seconds.

	element addAnimation: animation.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationStepEvent
			 do: [ :anEvent |
					 element border: (BlBorder builder
							  paint: (Color r: 0.9 g: 0.2 b: 179);
							  width: 10;
							  dashOffset: anEvent progress * 30;
							  dashArray: #( 0 20 45 20 );
							  capSquare;
							  build) ]).

	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> dashOffsetPolyLineAnimation [

	<sampleInstance>
	| element animation vertices |
	vertices := {
		            (50 @ 50).
		            (150 @ 50).
		            (150 @ 150).
		            (200 @ 200).
		            (200 @ 250).
		            (300 @ 300).
		            (400 @ 400) }.
	element := BlElement new
		           extent: 400 @ 400;
		           geometry: (BlPolylineGeometry new vertices: vertices);
		           outskirts: BlOutskirts centered.

	animation := BlAnimation new
		             beInfinite;
		             duration: 1 seconds.

	element addAnimation: animation.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationStepEvent
			 do: [ :anEvent |
					 element border: (BlBorder builder
							  paint: (Color r: 0.7 g: 0.2 b: 348);
							  width: 16;
							  dashOffset: -1 *  anEvent progress * 32; "-1 to reverse the flow"
							  dashArray: #( 0 17 0 17 );
							  capRound;
							  build) ]).

	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> dashOffsetTriangleAnimation [

	<sampleInstance>
	| element animation |
	element := BlElement new
		           extent: 400 @ 400;
		           geometry: (BlTriangleGeometry new matchExtent: 200 @ 400; beLeft);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.

	animation := BlAnimation new
		             beInfinite;
						duration: 1 seconds.

	element addAnimation: animation.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationStepEvent
			 do: [ :anEvent |
					 element border: (BlBorder builder
							  paint: (Color r: 0.7 g: 0.2 b: 348);
							  width: 16;
							  dashOffset: anEvent progress * 32;
							  dashArray: #( 0 17 0 17 );
							  capRound;
							  build) ]).

	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> dashStarOffsetAnimation [

	<sampleInstance>
	| element animation |
	element := BlElement new
		           extent: 100 @ 100;
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
				           c vertical matchParent ];
		           border: (BlBorder paint: Color orange width: 5);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.

	animation := BlAnimation new
		             beInfinite;
		             duration: 1 seconds.

	element addAnimation: animation.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationStepEvent
			 do: [ :anEvent |
					 element border: (BlBorder builder
							  paint: (Color r: 0.7 g: 0.2 b: 348);
							  width: 5;
							  dashOffset: anEvent progress * 10;
							  dashArray: #( 0 5 0 5 );
							  capRound;
							  build) ]).
	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> dashStarOffsetAnimation2 [

	<sampleInstance>
	| element animation circumference|
	element := BlElement new
		           extent: 100 @ 100;
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
				           c vertical matchParent ];
		           border: (BlBorder paint: Color orange width: 5);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.

	animation := BlAnimation new duration: 5 seconds.

	element addAnimation: animation.

"The clever trick here is that we have a single dash that is the same length as the entire circumference of our shape (380, in this particular case), and a huge gap between each dash (500). Circumference has been guessed here by trial and error"
	circumference := 380.
	animation addEventHandler: (BlEventHandler
			 on: BlAnimationStepEvent
			 do: [ :anEvent |
					 element border: (BlBorder builder
							  paint: (Color r: 0.7 g: 0.2 b: 348);
							  width: 5;
							  dashOffset: anEvent progress * circumference;
							  dashArray: { circumference . circumference*2 . 0 };
							  capRound;
							  build) ]).
	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> dashStarOffsetAnimation3 [

	<sampleInstance>
	| element animation circumference|
	element := BlElement new
		           extent: 100 @ 100;
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
				           c vertical matchParent ];
		           border: (BlBorder paint: Color orange width: 5);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.

	animation := BlAnimation new duration: 5 seconds.

	element addAnimation: animation.

"The clever trick here is that we have a single dash that is the same length as the entire circumference of our shape (380, in this particular case), and a huge gap between each dash (500). Circumference has been guessed here by trial and error"
	circumference := 380.
	animation addEventHandler: (BlEventHandler
			 on: BlAnimationStepEvent
			 do: [ :anEvent |
					 element border: (BlBorder builder
							  paint: (Color r: 0.7 g: 0.2 b: 348);
							  width: 5;
							  dashOffset: circumference - (anEvent progress * circumference);
							  dashArray: { circumference . circumference * 2 . 0 };
							  capRound;
							  build) ]).
	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> dashStarOffsetAnimation4 [

	<sampleInstance>
	| element animation circumference|
	element := BlElement new
		           extent: 100 @ 100;
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
				           c vertical matchParent ];
		           border: (BlBorder paint: Color orange width: 5);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.

	animation := BlAnimation new duration: 5 seconds.

	element addAnimation: animation.

"The clever trick here is that we have a single dash that is the same length as the entire circumference of our shape (380, in this particular case), and a huge gap between each dash (500). Circumference has been guessed here by trial and error"
	circumference := 380.
	animation addEventHandler: (BlEventHandler
			 on: BlAnimationStepEvent
			 do: [ :anEvent |
					 element border: (BlBorder builder
							  paint: (Color r: 0.7 g: 0.2 b: 348);
							  width: 5;
							  dashOffset: anEvent progress * circumference;
							  dashArray: { 0 .  circumference  . circumference *2 . 0 };
							  capRound;
							  build) ]).
	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> minimalAnimation [

	<sampleInstance>
	| element animation |
	element := BlElement new
		           extent: 150 @ 150;
		           background: Color red.

	animation := BlAnimation new
		             beInfinite;
		             delay: 10 seconds;
		             duration: 5 seconds.

	element addAnimation: animation.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationLoopDoneEvent
			 do: [ :anEvent | element opacity: 0.0 ]).

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationStepEvent
			 do: [ :anEvent | element opacity: anEvent progress ]).

	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> opacityAnimation [

	<sampleInstance>
	| element animation |
	element := BlElement new
		           extent: 150 @ 150;
		           background: Color yellow;
		           border: (BlBorder paint: Color red width: 3).

	animation := BlOpacityAnimation new
		             delay: 1 second;
		             opacity: 0.1;
		             duration: 300 milliSeconds.

	element addAnimation: animation.
	element openInNewSpace.
	^ element
]

{ #category : 'examples' }
AnimationExperiment class >> rotateAnimationExample [

	<sampleInstance>
	| elt frame container anim |
	elt := BlElement new
		       background: (Color red alpha: 0.5);
		       position: 100 asPoint;
		       extent: 100 asPoint.
	frame := BlElement new
		         background: Color yellow;
		         position: 100 asPoint;
		         size: 100 asPoint.
	container := BlElement new
		             background: Color lightGreen;
		             size: 500 asPoint;
		             addChildren: {
				             frame.
				             elt }.

	anim := BlRotateAnimation new
		        angle: 90;
		        duration: 1 second.

	elt
		addEventHandlerOn: BlClickEvent
		do: [ elt addAnimation: anim copy ].

	container openInSpace.
	^ container
]

{ #category : 'examples' }
AnimationExperiment class >> sequentialBounceIn [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlEasing bounceIn ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlEasing bounceIn;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : 'examples' }
AnimationExperiment class >> sequentialBounceInOut [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlEasing bounceInOut ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlEasing bounceInOut ;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : 'examples' }
AnimationExperiment class >> sequentialBounceOut [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlEasing bounceOut;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlEasing bounceOut;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : 'examples' }
AnimationExperiment class >> sequentialElastic [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlEasingElastic new ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlEasingElastic new;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : 'examples' }
AnimationExperiment class >> sequentialQuad [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlEasingQuad new ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlEasingQuad new;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : 'examples' }
AnimationExperiment class >> sequentialQuintic [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlQuinticInterpolator new ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlQuinticInterpolator new;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : 'examples' }
AnimationExperiment class >> sequentialSine [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlSineInterpolator new ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlSineInterpolator new;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : 'examples' }
AnimationExperiment class >> sequentialViscousFluid [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlViscousFluidInterpolator new ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlViscousFluidInterpolator new;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : 'see class side' }
AnimationExperiment >> seeClassSide [ 
]
