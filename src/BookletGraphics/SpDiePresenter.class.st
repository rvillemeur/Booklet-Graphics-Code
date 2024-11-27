Class {
	#name : 'SpDiePresenter',
	#superclass : 'SpAbstractWidgetPresenter',
	#traits : 'SpTContextMenu',
	#classTraits : 'SpTContextMenu classTrait',
	#instVars : [
		'#drawBlock => ObservableSlot',
		'#surfaceExtent => ObservableSlot'
	],
	#category : 'BookletGraphics-SpecAdapter',
	#package : 'BookletGraphics',
	#tag : 'SpecAdapter'
}

{ #category : 'specs' }
SpDiePresenter class >> adapterName [
	^ #DieAdapter
]

{ #category : 'documentation' }
SpDiePresenter class >> documentFactoryMethodSelector [

	^ #newDie
]
