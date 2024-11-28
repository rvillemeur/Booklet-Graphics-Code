Class {
	#name : 'SpDieMorph',
	#superclass : 'DieMorph',
	#instVars : [
		'model'
	],
	#category : 'BookletGraphics-SpecAdapter',
	#package : 'BookletGraphics',
	#tag : 'SpecAdapter'
}

{ #category : 'as yet unclassified' }
SpDieMorph class >> on: anObject faces: aNumber [

	^ self new model: anObject;faces: aNumber
]

{ #category : 'initialization' }
SpDieMorph >> initialize [
	super initialize.
]

{ #category : 'accessing' }
SpDieMorph >> model [

	^ model
]

{ #category : 'accessing' }
SpDieMorph >> model: anObject [

	model := anObject
]

{ #category : 'event handling' }
SpDieMorph >> mouseDown: anEvent [

	super mouseDown: anEvent.
	model action
]
