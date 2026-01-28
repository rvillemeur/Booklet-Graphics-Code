Class {
	#name : 'TagSlidingOrdererExamples',
	#superclass : 'Object',
	#category : 'BookletGraphics-BlocDragNDrop',
	#package : 'BookletGraphics',
	#tag : 'BlocDragNDrop'
}

{ #category : 'as yet unclassified' }
TagSlidingOrdererExamples class >> tagFor: aString [

	^ BlElement new
		  layout: BlLinearLayout horizontal alignCenter;
		  constraintsDo: [ :c |
			  c horizontal fitContent.
			  c vertical fitContent ];
		  margin: (BlInsets all: 5);
		  padding: (BlInsets all: 10);
		  background: Color veryVeryLightGray;
		  border: (BlBorder paint: Color veryLightGray width: 1);
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 3);
		  effect: (BlGaussianShadowEffect
				   color: (Color lightGray alpha: 0.4)
				   width: 2
				   offset: 0 @ 0);
		  addChild: (BlTextElement new
				   labelMeasurement;
				   text: aString asString asRopedText)
]

{ #category : 'as yet unclassified' }
TagSlidingOrdererExamples class >> tagOrdererSlidingTagFor: aString [

	^ (self tagFor: aString)
		  addEventHandler: (BlDragHandler new
				   dragArea: [ :aSourceElement | aSourceElement parent ];
				   liftItemBlock: [ :aSourceElement |
					   BlDragItem new
						   sourceElement: aSourceElement;
						   domainObject: aString;
						   stencil: [ :aDragItem | self tagFor: aDragItem domainObject ] ]);
		  addEventHandlerOn: BlAboutToBeDroppedEvent
		  do: [ :anEvent | anEvent currentTarget removeFromParent ];
		  yourself
	"withStylesDo: [ :theStyles |
			theStyles
				addStyle: (BlElementStyle new
					state: BlElementDraggingState uniqueInstance;
					visibility: BlVisibility hidden);
			 	addStyle: (BlElementStyle new
					state: BlElementDraggingState uniqueInstance not;
					visibility: BlVisibility visible)  ];"
]

{ #category : 'as yet unclassified' }
TagSlidingOrdererExamples class >> tagsSlidingOrderer [

	<sampleInstance>
	| aContainer  |
	aContainer := BlElement new.
	aContainer layout: (BlLinearLayout horizontal cellSpacing: 5).
	aContainer constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	aContainer addEventHandler: (BlDropHandler new
			 acceptOnlyFromThisElement;
			 whenHorizontalSlideOverDo: [  ];
			 whenDroppedDo: [ :anItemsDroppedEvent |
				 | container position childBefore |
				 container := anItemsDroppedEvent currentTarget.
				 position := anItemsDroppedEvent position x.
				 childBefore := container children accountedByLayout
					                detect: [ :eachChild |
						                position
						                < (eachChild bounds inParent center x - 5) ]
					                ifFound: [ :eachChild | eachChild ]
					                ifNone: [ nil ].

				 (anItemsDroppedEvent items collect: [ :eachDragItem |
						  eachDragItem sourceElement ]) do: [ :each |
						 childBefore
							 ifNil: [ container addChild: each ]
							 ifNotNil: [ container addChild: each before: childBefore ] ] ]).

	aContainer addChildren:
		({ 'One'. 'Two'. 'Three'. 'Four' } collect: [ :eachName |
			 self tagOrdererSlidingTagFor: eachName ]).

	^ aContainer openInNewSpace 
]

{ #category : 'see class side' }
TagSlidingOrdererExamples >> seeClassSide [ 
]
