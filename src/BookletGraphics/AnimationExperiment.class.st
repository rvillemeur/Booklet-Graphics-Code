"
animation experiment and example in Bloc
"
Class {
	#name : #AnimationExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #examples }
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

{ #category : #examples }
AnimationExperiment class >> animatedBackground2 [

	<sampleInstance>
	| element animation |
	element := BlElement new size: 50 @ 50.

	animation := BlNumberTransition new
		             from: 0;
		             to: 1;
		             by: 0.5;
		             beInfinite;
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

{ #category : #examples }
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

{ #category : #'see class side' }
AnimationExperiment >> seeClassSide [ 
]
