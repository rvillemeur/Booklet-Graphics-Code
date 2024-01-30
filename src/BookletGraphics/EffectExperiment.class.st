Class {
	#name : #EffectExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #example }
EffectExperiment >> exampleWithEvent [

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
