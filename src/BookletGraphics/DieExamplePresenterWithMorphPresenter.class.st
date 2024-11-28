Class {
	#name : 'DieExamplePresenterWithMorphPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'diePresenter'
	],
	#category : 'BookletGraphics-SpecAdapter',
	#package : 'BookletGraphics',
	#tag : 'SpecAdapter'
}

{ #category : 'layout' }
DieExamplePresenterWithMorphPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: diePresenter ;
		  yourself
]

{ #category : 'initialization' }
DieExamplePresenterWithMorphPresenter >> initializePresenters [

	diePresenter := SpMorphPresenter new 
		morph: (DieMorph faces: 8);
		yourself.

	diePresenter morph eventHandler: (MorphicEventHandler new 
			on: #mouseDown 
			send: #processMouseDown: 
			to: self).
]

{ #category : 'initialization' }
DieExamplePresenterWithMorphPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Die morph within spec';
		initialExtent: 120 @ 120
]

{ #category : 'event handling' }
DieExamplePresenterWithMorphPresenter >> processMouseDown: evt [
	"dieMorph does not expose dieValue. If it would, we could expose its value"

	evt redButtonPressed ifTrue: [ self inform: 'dice clicked. value: ', evt handler dieValue asString  ]
]

{ #category : 'accessing' }
DieExamplePresenterWithMorphPresenter >> start [

	<script: 'self new open'>
]
