Class {
	#name : 'SpDiePresenter',
	#superclass : 'SpAbstractWidgetPresenter',
	#traits : 'SpTContextMenu',
	#classTraits : 'SpTContextMenu classTrait',
	#instVars : [
		'#faces => ObservableSlot',
		'#dieValue => ObservableSlot',
		'#action => ObservableSlot'
	],
	#category : 'BookletGraphics-SpecAdapter',
	#package : 'BookletGraphics',
	#tag : 'SpecAdapter'
}

{ #category : 'specs' }
SpDiePresenter class >> adapterName [
	^ #DieAdapter
]

{ #category : 'accessing' }
SpDiePresenter >> action [

	^ action
]

{ #category : 'accessing' }
SpDiePresenter >> action: anObject [

	action := anObject
]

{ #category : 'public' }
SpDiePresenter >> click [

	"I emulate the click from the presenter point of view.
	Of course if the button is disabled, I do nothing, like in real life!!
	If you want to emulate other stuff use performAction"
	
	^ self performAction
]

{ #category : 'accessing' }
SpDiePresenter >> dieValue [

	^ self adapter dieValue 
]

{ #category : 'accessing' }
SpDiePresenter >> faces [

	^ faces
]

{ #category : 'accessing' }
SpDiePresenter >> faces: anObject [

	faces := anObject
]

{ #category : 'private' }
SpDiePresenter >> performAction [

	self action value.
]
