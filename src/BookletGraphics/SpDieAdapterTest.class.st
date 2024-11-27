Class {
	#name : 'SpDieAdapterTest',
	#superclass : 'SpAbstractWidgetAdapterTest',
	#category : 'BookletGraphics-SpecAdapter',
	#package : 'BookletGraphics',
	#tag : 'SpecAdapter'
}

{ #category : 'accessing' }
SpDieAdapterTest >> classToTest [
	^ SpDiePresenter 
]

{ #category : 'initialization' }
SpDieAdapterTest >> initializeTestedInstance [
	"presenter drawBlock: [ " "nothing to do""  ].
	presenter surfaceExtent: 800@600"
]
