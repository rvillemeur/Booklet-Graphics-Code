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

	diePresenter := self instantiate: SpDiePresenter .
]

{ #category : 'initialization' }
DieExamplePresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Die morph within spec';
		initialExtent: 60 @ 80
]

{ #category : 'accessing' }
DieExamplePresenter >> start [

	<script: 'self new open'>
]
