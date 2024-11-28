Class {
	#name : 'DieExamplePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'diePresenter'
	],
	#category : 'BookletGraphics-SpecAdapter',
	#package : 'BookletGraphics',
	#tag : 'SpecAdapter'
}

{ #category : 'layout' }
DieExamplePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: diePresenter ;
		  yourself
]

{ #category : 'initialization' }
DieExamplePresenter >> initializePresenters [

	diePresenter := self instantiate: SpDiePresenter.
	diePresenter faces: 2.

	diePresenter action: [ self inform: 'die clicked' ]
]

{ #category : 'initialization' }
DieExamplePresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Die morph within spec';
		initialExtent: 120 @ 120
]

{ #category : 'accessing' }
DieExamplePresenter >> start [

	<script: 'self new open'>
]
