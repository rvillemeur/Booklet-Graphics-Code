Class {
	#name : 'BlItemsLeftEvent',
	#superclass : 'BlEvent',
	#instVars : [
		'position'
	],
	#category : 'BookletGraphics-BlocDragNDrop',
	#package : 'BookletGraphics',
	#tag : 'BlocDragNDrop'
}

{ #category : 'accessing' }
BlItemsLeftEvent >> position [

	^ position
]

{ #category : 'accessing' }
BlItemsLeftEvent >> position: anObject [

	position := anObject
]

{ #category : 'sending' }
BlItemsLeftEvent >> sendTo: anObject [
	anObject itemsLeftEvent: self
]
