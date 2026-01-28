Class {
	#name : 'TagOrdererExamples',
	#superclass : 'Object',
	#category : 'BookletGraphics-BlocDragNDrop',
	#package : 'BookletGraphics',
	#tag : 'BlocDragNDrop'
}

{ #category : 'as yet unclassified' }
TagOrdererExamples class >> tagFor: aString [

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
TagOrdererExamples class >> tagOrdererDraggableTagFor: aString [

	^ (self tagFor: aString)
		  addEventHandler: (BlDragHandler new liftItemBlock: [ :aSourceElement |
					   BlDragItem new
						   sourceElement: aSourceElement;
						   domainObject: aString;
						   stencil: [ :aDragItem | self tagFor: aDragItem domainObject ] ]);
		  addEventHandlerOn: BlAboutToBeDroppedEvent
		  do: [ :anEvent | anEvent currentTarget removeFromParent ]; yourself.
	"	withStylesDo: [ :theStyles |
			theStyles
				addStyle: (BlElementStyle new
					state: BlElementDraggingState uniqueInstance;
					background: Color veryLightGray);
			 	addStyle: (BlElementStyle new
					state: BlElementDraggingState uniqueInstance not;
					background: Color veryVeryLightGray)  ];"
]

{ #category : 'as yet unclassified' }
TagOrdererExamples class >> tagsOrderer [

	<sampleInstance>
	| aContainer |
	aContainer := BlElement new.
	aContainer layout: (BlLinearLayout horizontal cellSpacing: 5).
	aContainer constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	aContainer addEventHandler: (BlDropHandler new
			 acceptOnlyFromThisElement;
			 whenDragOverDo: [ :anItemsDraggedOverEvent |
				 | container locationElement position childPosition |
				 container := anItemsDraggedOverEvent currentTarget.
				 locationElement := container
					                    childWithId: #'drop-area--drop-location'
					                    ifFound: [ :anElement | anElement ]
					                    ifNone: [
						                    | anElement |
						                    anElement := BlElement new
							                                 background: Color orange;
							                                 width: 2;
							                                 constraintsDo: [ :c |
								                                 c ignoreByLayout.
								                                 c vertical matchParent ].

						                    container
							                    addChild: anElement
							                    as: #'drop-area--drop-location'.
						                    anElement ].

				 position := anItemsDraggedOverEvent position x.
				 childPosition := container children accountedByLayout
					                  detect: [ :eachChild |
					                  position < eachChild bounds inParent center x ]
					                  ifFound: [ :eachChild |
					                  eachChild bounds inParent left - 10 ]
					                  ifNone: [
						                  container children accountedByLayout last
							                  bounds inParent right + 10 ].

				 locationElement relocate: childPosition @ 0 ];
			 whenDragLeftDo: [ :anItemsLeftEvent |
				 anItemsLeftEvent currentTarget removeChildWithId:
					 #'drop-area--drop-location' ];
			 whenDroppedDo: [ :anItemsDroppedEvent |
				 | container position childBefore |
				 container := anItemsDroppedEvent currentTarget.
				 position := anItemsDroppedEvent position x.
				 childBefore := container children accountedByLayout
					                detect: [ :eachChild |
					                position < eachChild bounds inParent center x ]
					                ifFound: [ :eachChild | eachChild ]
					                ifNone: [ nil ].

				 (anItemsDroppedEvent items collect: [ :eachDragItem |
					  eachDragItem sourceElement ]) do: [ :each |
					 childBefore
						 ifNil: [ container addChild: each ]
						 ifNotNil: [ container addChild: each before: childBefore ] ] ]).

	aContainer addChildren:
		({ 'One'. 'Two'. 'Three'. 'Four' } collect: [ :eachName |
			 self tagOrdererDraggableTagFor: eachName ]).

	^ aContainer openInNewSpace
]

{ #category : 'see class side' }
TagOrdererExamples >> seeClassSide [ 
]
