Class {
	#name : 'LettersSorterExamples',
	#superclass : 'Object',
	#category : 'BookletGraphics-BlocDragNDrop',
	#package : 'BookletGraphics',
	#tag : 'BlocDragNDrop'
}

{ #category : 'as yet unclassified' }
LettersSorterExamples class >> labelContainer: anElement with: aText [

	^ BlElement new
		  layout: (BlLinearLayout vertical alignTopCenter cellSpacing: 10);
		  constraintsDo: [ :c |
			  c horizontal matchParent.
			  c vertical matchParent ];
		  addChild: (BlTextElement new text: aText asRopedText);
		  addChild: anElement
]

{ #category : 'as yet unclassified' }
LettersSorterExamples class >> letterFor: aCharacter [

	^ BlElement new
		  layout: BlLinearLayout horizontal alignCenter;
		  size: 30 @ 30;
		  margin: (BlInsets all: 5);
		  background: Color veryVeryLightGray;
		  border: (BlBorder paint: Color veryLightGray width: 1);
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 3);
		  effect: (BlGaussianShadowEffect
				   color: (Color lightGray alpha: 0.4)
				   width: 2
				   offset: 0 @ 0);
		  addChild: (BlTextElement new
				   labelMeasurement;
				   text: aCharacter asString asRopedText)
]

{ #category : 'as yet unclassified' }
LettersSorterExamples class >> lettersSorter [

	<sampleInstance>
	| letters vowels consonants  |
	letters := self lettersSorterContainer.
	
	vowels := self lettersSorterRoundedContainerWithBorder.
	vowels background: Color lightRed.
	vowels addEventHandler: (BlDropHandler new 
			 acceptItemsSuchThat: [ :aDragItem :aDropArea | aDragItem sourceElement parent ~~ aDropArea ];
			 acceptDomainObjectsSuchThat: [ :anObject | anObject isCharacter and: [ anObject isVowel ] ];
			 whenDroppedDo: 
				[ :anItemsDroppedEvent | anItemsDroppedEvent currentTarget addChildren:
						 (anItemsDroppedEvent items collect: 
						[ :eachDragItem | self lettersSorterDraggableLetterFor: eachDragItem domainObject ]) ]).

	consonants := self lettersSorterRoundedContainerWithBorder.
	consonants background: Color lightBlue.
	consonants addEventHandler: (BlDropHandler new
			 acceptItemsSuchThat: [ :aDragItem :aDropArea | aDragItem sourceElement parent ~~ aDropArea ];
			 acceptDomainObjectsSuchThat: [ :anObject | anObject isCharacter and: [ anObject isVowel not ] ];
			 whenDroppedDo: 
					[ :anItemsDroppedEvent | anItemsDroppedEvent currentTarget addChildren:
						 (anItemsDroppedEvent items collect: 
								[ :eachDragItem | self lettersSorterDraggableLetterFor: eachDragItem domainObject ]) ]).

	letters addChildren:
		({ $a. $c. $Q. $o. $j. $E. $y. $Z. $U. $B. $p. $i } collect: [ :each | self lettersSorterDraggableLetterFor: each ]).

	^ BlElement new
		  layout: (BlLinearLayout horizontal cellSpacing: 30);
		  constraintsDo: [ :c |
			  c horizontal matchParent.
			  c vertical matchParent ];
		  addChildren: {
				  (self
					   labelContainer: letters
					   with: 'Letters to sort').
				  (self
					   labelContainer: vowels
					   with: 'Vowel letters').
				  (self
					   labelContainer: consonants
					   with: 'Consonant letters') }; openInNewSpace .
]

{ #category : 'as yet unclassified' }
LettersSorterExamples class >> lettersSorterContainer [

	^ BlElement new
		  layout: BlFlowLayout horizontal;
		  constraintsDo: [ :c |
			  c horizontal matchParent.
			  c vertical matchParent ];
		  padding: (BlInsets all: 10)
]

{ #category : 'as yet unclassified' }
LettersSorterExamples class >> lettersSorterDraggableLetterFor: aCharacter [

	| element  |
	element := self letterFor: aCharacter.
	element
		addEventHandler: (BlDragHandler new liftItem: [ :aSourceElement |
					 BlDragItem new
						 sourceElement: aSourceElement;
						 domainObject: aCharacter;
						 stencil: [ :aDragItem |
							 self letterFor:
									 aDragItem domainObject ] ]);
		addEventHandlerOn: BlAboutToBeDroppedEvent
		do: [ :anEvent | anEvent currentTarget removeFromParent ].

	^ element
]

{ #category : 'as yet unclassified' }
LettersSorterExamples class >> lettersSorterRoundedContainerWithBorder [


	^ self lettersSorterContainer
		  border: (BlBorderBuilder new
				   paint: Color gray;
				   dashed;
				   width: 2;
				   build);
		  geometry: (BlRoundedRectangleGeometry cornerRadius: 5)
]

{ #category : 'see class side' }
LettersSorterExamples >> seeClassSide [ 
]
