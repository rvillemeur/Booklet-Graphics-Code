Class {
	#name : 'BlSpaceDragDraggedEvent',
	#superclass : 'BlSpaceEvent',
	#instVars : [
		'delegate',
		'position',
		'element'
	],
	#category : 'BookletGraphics-BlocDragNDrop',
	#package : 'BookletGraphics',
	#tag : 'BlocDragNDrop'
}

{ #category : 'accessing' }
BlSpaceDragDraggedEvent >> delegate [

	^ delegate
]

{ #category : 'accessing' }
BlSpaceDragDraggedEvent >> delegate: anObject [

	delegate := anObject
]

{ #category : 'accessing' }
BlSpaceDragDraggedEvent >> element [

	^ element
]

{ #category : 'accessing' }
BlSpaceDragDraggedEvent >> element: anObject [

	element := anObject
]

{ #category : 'accessing' }
BlSpaceDragDraggedEvent >> position [

	^ position
]

{ #category : 'accessing' }
BlSpaceDragDraggedEvent >> position: anObject [

	position := anObject
]

{ #category : 'sending' }
BlSpaceDragDraggedEvent >> sendTo: anObject [
	anObject spaceDragDraggedEvent: self
]
