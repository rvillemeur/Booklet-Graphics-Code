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

{ #category : 'tests' }
SpDieAdapterTest >> testClickExecuteAction [
	| actionExecuted |	

	actionExecuted := false.
	presenter action: [  actionExecuted := true].

	self emulateLeftClick.
	self assert: actionExecuted
]
