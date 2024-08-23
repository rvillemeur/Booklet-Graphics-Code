"
I handle Bloc space events (`BlSpaceEvent`).

Initial class declaration
```
BlEventListener << #BlSpaceEventListener
	slots: { #space };
	tag: 'Space - Events';
	package: 'Bloc'
```
"
Class {
	#name : 'BlSpaceEventListener',
	#superclass : 'BlEventListener',
	#instVars : [
		'space',
		'mouseDragListener',
		'dragContainerElement'
	],
	#category : 'BookletGraphics-BlocDragNDrop',
	#package : 'BookletGraphics',
	#tag : 'BlocDragNDrop'
}

{ #category : 'instance creation' }
BlSpaceEventListener class >> space: aStage [
	^ self new
		space: aStage;
		yourself
]

{ #category : 'accessing' }
BlSpaceEventListener >> focusProcessor [
	^ self space focusProcessor
]

{ #category : 'keyboard handlers' }
BlSpaceEventListener >> keyDownEvent: anEvent [
	self keyboardProcessor processKeyDown: anEvent
]

{ #category : 'keyboard handlers' }
BlSpaceEventListener >> keyUpEvent: anEvent [
	self keyboardProcessor processKeyUp: anEvent
]

{ #category : 'accessing' }
BlSpaceEventListener >> keyboardProcessor [
	^ self space keyboardProcessor
]

{ #category : 'mouse handlers' }
BlSpaceEventListener >> mouseDownEvent: anEvent [

	self mouseProcessor handleMouseDown: anEvent.
	self focusProcessor handleMouseDown: anEvent
]

{ #category : 'other handlers' }
BlSpaceEventListener >> mouseEvent: anEvent [
	
]

{ #category : 'mouse handlers' }
BlSpaceEventListener >> mouseMoveEvent: anEvent [
	self mouseProcessor handleMouseMove: anEvent
]

{ #category : 'accessing' }
BlSpaceEventListener >> mouseProcessor [

	^ self space mouseProcessor
]

{ #category : 'mouse handlers' }
BlSpaceEventListener >> mouseUpEvent: anEvent [

	self mouseProcessor handleMouseUp: anEvent
]

{ #category : 'mouse handlers' }
BlSpaceEventListener >> mouseWheelEvent: anEvent [

	self mouseProcessor processMouseScroll: anEvent
]

{ #category : 'accessing' }
BlSpaceEventListener >> space [
	^ space
]

{ #category : 'accessing' }
BlSpaceEventListener >> space: aBlSpace [
	space := aBlSpace
]

{ #category : 'window handlers' }
BlSpaceEventListener >> spaceCloseRequest: anEvent [
	self space close
]

{ #category : 'window handlers' }
BlSpaceEventListener >> spaceClosedEvent: anEvent [
	self mouseProcessor onSpaceClosed
]

{ #category : 'as yet unclassified' }
BlSpaceEventListener >> spaceDragCancelEvent: anEvent [
	| aDragDelegate |
	self space removeEventHandler: mouseDragListener.

	dragContainerElement ifNil: [ ^ self ].

	aDragDelegate := dragContainerElement userData at: #dragDelegate.
	
	aDragDelegate
		cancel: dragContainerElement
		at: anEvent position
		in: self space root.

	dragContainerElement ifNotNil: [ :anElement | anElement removeFromParent ].
	dragContainerElement := nil.
]

{ #category : 'as yet unclassified' }
BlSpaceEventListener >> spaceDragDraggedEvent: anEvent [
	| aDropDelegate aDragDelegate aPosition |

	aDropDelegate := anEvent delegate.
	aPosition := anEvent position.

	dragContainerElement ifNil: [ ^ self ].

	aDragDelegate := dragContainerElement userData at: #dragDelegate.
	aDropDelegate
		dragged: dragContainerElement
		items: aDragDelegate items
		at: aPosition
		offset: aDragDelegate offset
		in: anEvent element
]

{ #category : 'as yet unclassified' }
BlSpaceEventListener >> spaceDragDropEnterEvent: anEvent [
	| aDropDelegate aDragDelegate aPosition |
	
	anEvent consumed: true.

	aDropDelegate := anEvent delegate.
	aPosition := anEvent position.

	dragContainerElement ifNil: [ ^ self ].

	aDragDelegate := dragContainerElement userData at: #dragDelegate.
	aDropDelegate
		enter: aDragDelegate items
		at: aPosition
		in: anEvent element
]

{ #category : 'as yet unclassified' }
BlSpaceEventListener >> spaceDragDropEvent: anEvent [
	| aDropDelegate aDragDelegate aPosition theRejectedItems|

	aDropDelegate := anEvent delegate.
	aPosition := anEvent position.

	dragContainerElement ifNil: [ ^ self ].

	aDragDelegate := dragContainerElement userData at: #dragDelegate.

	theRejectedItems := aDropDelegate
		drop: aDragDelegate items
		at: aPosition
		in: anEvent element.
	aDragDelegate items: theRejectedItems
]

{ #category : 'as yet unclassified' }
BlSpaceEventListener >> spaceDragLiftEvent: anEvent [
	| aDragDelegate aPosition aDragArea |

	aDragDelegate := anEvent delegate.
	aPosition := anEvent position.
	
	dragContainerElement ifNotNil: [ :anElement | anElement removeFromParent ].
	dragContainerElement := aDragDelegate liftAt: aPosition.
	dragContainerElement userData at: #dragDelegate put: aDragDelegate.
	dragContainerElement preventMeAndChildrenMouseEvents.
	
	aDragDelegate
		drag: dragContainerElement
		to: (dragContainerElement globalPointToParent: aPosition).

	aDragArea := aDragDelegate hasDragArea
		ifTrue: [ aDragDelegate dragArea ]
		ifFalse: [ self space root ].

	aDragArea addChild: dragContainerElement.

	mouseDragListener := BlEventHandler
		on: BlMouseMoveEvent
		do: [ :aMouseMoveEvent |
			aDragDelegate
				drag: dragContainerElement
				to: (dragContainerElement globalPointToParent: aMouseMoveEvent position) ].

	self space addEventHandler: mouseDragListener
]

{ #category : 'window handlers' }
BlSpaceEventListener >> spaceEventsProcessedEvent: anEvent [
	self space keyboardProcessor handleSpaceEventProcessedEvent: anEvent
]

{ #category : 'window handlers' }
BlSpaceEventListener >> spaceFocusInEvent: anEvent [

	self focusProcessor processWindowFocusIn: anEvent
]

{ #category : 'window handlers' }
BlSpaceEventListener >> spaceFocusOutEvent: anEvent [
	self focusProcessor processWindowFocusOut: anEvent.
	self keyboardProcessor processWindowFocusOut: anEvent
]

{ #category : 'window handlers' }
BlSpaceEventListener >> spaceMouseEnterEvent: anEvent [
	self mouseProcessor handleMouseEntered: anEvent
]

{ #category : 'window handlers' }
BlSpaceEventListener >> spaceMouseLeaveEvent: anEvent [

	self mouseProcessor handleMouseLeft: anEvent
]

{ #category : 'window handlers' }
BlSpaceEventListener >> spaceMovedEvent: anEvent [

  self space setPosition: anEvent position
]

{ #category : 'window handlers' }
BlSpaceEventListener >> spaceResizedEvent: anEvent [
	"Is sent after window size was changed"

	self space setExtent: anEvent extent
]

{ #category : 'keyboard handlers' }
BlSpaceEventListener >> textInputEvent: anEvent [

	self keyboardProcessor processTextInput: anEvent
]
