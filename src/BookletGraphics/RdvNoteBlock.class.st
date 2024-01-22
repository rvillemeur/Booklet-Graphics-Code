"
Bloc:

Root: BlElement

Defines
	- geometry and bounds (BlBounds)
	- size

	- background (BlBackground). Paints (BlPaint) are used for background, border, text fill or stroke.
	- border (BlBorder)
	- opacity

	- layout and children composition. (BlLayout, BlChildren, and their children)
	
	- event handling (BlEvent and children)


You can add element with addChild:, and the will be disposed according the 
the layout specified.

UI element model can use Announcer (observer) pattern to tell when their state
change:
	card announcer when: CardFlipped send: #onFlipped to: self.
	card announcer when: CardDisappeared send: #onDisappear to: self.

Drawing is done through method 'drawOnSpartaCanvas', which receive a sparta
(vector) canvas as an argument.

To add event to an element, you first need to subclass 'BlEventListener' and
override the event you want to manage. You then add your event handler to your
bloc element with method 'addEventHandler'. Event are bloc announcement method 
and classes.

You can apply transformation to a BlElement:
* rotation
* translation
* Scaling
* reflection
* etc...

BlSpace is a window in bloc, equivalent of the world in Pharo ??? 
BlElement are added or removed from a BlSpace, which act as a scene graph. 
Spaces are managed through BlUniverse.

We so have
BlUniverse -> BlSpace -> BlElement
					  -> BlEvent and BlBaseEventProcessor
					  -> BlCursor
					  -> BlTime
					  -> BlSpaceFrame
					  
Last, Bloc run on a host, being:
- Morphic
- OsWindow
- SDL2.
"
Class {
	#name : #RdvNoteBlock,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #accessing }
RdvNoteBlock >> bigAdaptableText [
<gtExample>
^(BlTextElement new text: 'hello' asRopedText) asScalableElement.
]

{ #category : #accessing }
RdvNoteBlock >> blAnnulusExample [

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
		sec := BlAnnulusSector new
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
			do: [ chart removeChildNamed: #centerLabel ].

		chart addChild: element ].

	^ chart
]

{ #category : #accessing }
RdvNoteBlock >> blAnnulusExample2 [
<bookExample>
"you can click on part of the circle to put some action"
^BlElement new
    size: 400@400;
    addChildren: ({
        (-90 to: 30) -> (Color r: 111 g: 91 b: 149 range: 255).
        (30 to: 60) -> (Color r: 152 g: 138 b: 193 range: 255).
        (60 to: 120) -> (Color r: 237 g: 150 b: 54 range: 255).
        (120 to: 150) -> (Color r: 243 g: 189 b: 55 range: 255).
        (150 to: 230) -> (Color r: 36 g: 174 b: 226 range: 255).
        (230 to: 270) -> (Color r: 99 g: 197 b: 198 range: 255)
    } collect: [ :each |
        BlElement new
            when: BlClickEvent do: [:e | e target phlow spawnObject: each key ];
            geometry: ((BlAnnulusSector new startAngle: each key first; endAngle: each key last));
            background: each value;
            constraintsDo: [ :c |
                c horizontal matchParent.
                c vertical matchParent ] ])
]

{ #category : #accessing }
RdvNoteBlock >> donut [
<bookExample>
^BlElement new
    size: 400@400;
    addChildren: ({
        (-90 to: 30) -> (Color r: 111 g: 91 b: 149 range: 255).
        (30 to: 60) -> (Color r: 152 g: 138 b: 193 range: 255).
        (60 to: 120) -> (Color r: 237 g: 150 b: 54 range: 255).
        (120 to: 150) -> (Color r: 243 g: 189 b: 55 range: 255).
        (150 to: 230) -> (Color r: 36 g: 174 b: 226 range: 255).
        (230 to: 270) -> (Color r: 99 g: 197 b: 198 range: 255)
    } collect: [ :each |
        BlElement new
            geometry: ((BlAnnulusSector new startAngle: each key first; endAngle: each key last));
            background: each value;
            constraintsDo: [ :c |
                c horizontal matchParent.
                c vertical matchParent ] ])
]

{ #category : #accessing }
RdvNoteBlock >> eventExample [
<bookExample>
	"This is a new method"
|toto|
toto := BlDevElement new size:200@200;
geometry:( BlPolygon
		vertices:
			{(100 @ 50).
			(115 @ 90).
			(150 @ 90).
			(125 @ 110).
			(135 @ 150).
			(100 @ 130).
			(65 @ 150).
			(75 @ 110).
			(50 @ 90).
			(85 @ 90)});
background: (Color pink alpha:0.2);
border: (BlBorder paint: Color orange width: 4);
"layout: BlLinearLayout horizontal alignCenter;"
"constraintsDo: [:c | c horizontal matchParent. c vertical matchParent.];"
outskirts: BlOutskirts outside.

toto when: BlMouseEnterEvent do: [ :anEvent |
		anEvent consumed: true.
		toto background: (Color red alpha:0.2) ].
		
 toto when: BlMouseLeaveEvent do: [ :anEvent |
		anEvent consumed: true.
		toto background: (Color blue alpha:0.2) ].
^toto
]

{ #category : #accessing }
RdvNoteBlock >> eventExampleMouseMove [

	<gtExample>
	| surface elt |
	elt := BlElement new
		       size: 20 @ 20;
		       geometry: (BlPolygon vertices: {
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
		           geometry: BlSquare new;
		           background: (Color pink alpha: 0.2);
		           border: (BlBorder paint: Color orange width: 4).

	surface addChild: elt.
	elt position: -20 @ -20.

	surface when: BlMouseMoveEvent do: [ :anEvent |
		anEvent consumed: true.
		elt relocate: anEvent localPosition + (10 @ 10) ].

	surface when: BlMouseLeaveEvent do: [ :anEvent |
		anEvent consumed: true.
		elt relocate: -20 @ -20 ].
	^ surface
]

{ #category : #accessing }
RdvNoteBlock >> eventStyleExample [
<gtExample>
|toto|
toto := BlElement new size: 200 @ 200.
toto styles
	default: [ :aStyle | 
		aStyle
			geometry: (BlPolygon
					vertices: {100 @ 50.
							115 @ 90.
							150 @ 90.
							125 @ 110.
							135 @ 150.
							100 @ 130.
							65 @ 150.
							75 @ 110.
							50 @ 90.
							85 @ 90});
			background: (Color pink alpha: 0.2);
			border: (BlBorder paint: Color black width: 1) ];
		hovered:[ :aStyle | aStyle
			background: (Color blue alpha: 0.2);
			border: (BlBorder paint: Color purple width: 1) ].
			
^toto
]

{ #category : #'as yet unclassified' }
RdvNoteBlock >> periodicEvent [

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
		when: BlKeyDownEvent do: [ :evt |
			keyDownBlockByKey at: evt key ifPresent: [ :aBlock | aBlock value ] ];
		when: BlKeyUpEvent do: [ :evt |
			keyUpBlockByKey at: evt key ifPresent: [ :aBlock | aBlock value ] ]
				yourself.

	hero enqueueTask: (BlRepeatedTaskAction new
			 delay: 0 milliSeconds;
			 action: [
				 dxy isZero ifFalse: [ hero position: hero position + dxy ] ];
			 yourself).



	"-- Simulate arrows, then quit --"

	simulatorProcess := [ "Simulate arrows"
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

{ #category : #accessing }
RdvNoteBlock >> rainbow [

	<bookExample>
	| root stroke wh colors a |
	root := BlElement new
		        size: (wh := 640 @ 480);
		        background: Color black.
	stroke := BlBorder paint: Color black.

	"Draw a rainbow"
	colors := #( #red #orange #yellow #green #blue #purple ).
	(1 to: colors size) do: [ :i |
		| r el |
		r := colors size + 1 - i * 400 ** 0.8.
		el := BlElement new
			      size: r @ r;
			      geometry: (BlAnnulusSector new
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
		     border: stroke;
		     addEventHandlerOn: BlMouseOverEvent
		     do: [ :e | a background: Color lightGray ];
		     addEventHandlerOn: BlMouseOutEvent
		     do: [ :e | a background: Color white ];
		     addEventHandler: BlPullHandler new disallowOutOfBounds;
		     addChild: (BlTextElement new
				      position: 5 @ 5;
				      text: ('Rainbow!' asRopedText attributes:
							       { (BlTextForegroundAttribute paint: Color black) })).

	root addChild: a.
	^ root
]
