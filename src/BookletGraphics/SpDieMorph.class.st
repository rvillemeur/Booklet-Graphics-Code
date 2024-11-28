"
This class could be avoided if we add accessor dieValue to DieMorph. Everything else can be through messages
"
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

{ #category : 'accessing' }
SpDieMorph >> dieValue [

	^ dieValue
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
	model dieValue: self dieValue.
	model action
]
