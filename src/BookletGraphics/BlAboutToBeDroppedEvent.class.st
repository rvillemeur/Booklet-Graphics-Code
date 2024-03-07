Class {
	#name : #BlAboutToBeDroppedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'dropTarget'
	],
	#category : #'BookletGraphics-BlocDragNDrop'
}

{ #category : #accessing }
BlAboutToBeDroppedEvent >> dropTarget [

	^ dropTarget
]

{ #category : #accessing }
BlAboutToBeDroppedEvent >> dropTarget: anObject [

	dropTarget := anObject
]
