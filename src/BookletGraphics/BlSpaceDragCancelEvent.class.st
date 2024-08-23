Class {
	#name : 'BlSpaceDragCancelEvent',
	#superclass : 'BlSpaceEvent',
	#instVars : [
		'position'
	],
	#category : 'BookletGraphics-BlocDragNDrop',
	#package : 'BookletGraphics',
	#tag : 'BlocDragNDrop'
}

{ #category : 'accessing' }
BlSpaceDragCancelEvent >> position [
	^ position
]

{ #category : 'accessing' }
BlSpaceDragCancelEvent >> position: anObject [
	position := anObject
]

{ #category : 'sending' }
BlSpaceDragCancelEvent >> sendTo: anObject [
	anObject spaceDragCancelEvent: self
]
