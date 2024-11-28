"
Add adapter to the list in the system with

`SpNullApplication class reset`
"
Class {
	#name : 'SpMorphicDieAdapter',
	#superclass : 'SpAbstractMorphicAdapter',
	#instVars : [
		'dieValue'
	],
	#category : 'BookletGraphics-SpecAdapter',
	#package : 'BookletGraphics',
	#tag : 'SpecAdapter'
}

{ #category : 'class initialization' }
SpMorphicDieAdapter class >> initialize [
	"Add adapter to the system by resetAdapterBindings"

	<script: 'self initialize'>
	SpNullApplication reset
]

{ #category : 'factory' }
SpMorphicDieAdapter >> buildWidget [

	| instance |
	instance := DieMorph faces: self presenter faces.
	
	instance eventHandler: (MorphicEventHandler new 
			on: #mouseDown 
			send: #processMouseDown: 
			to: self).
	^ instance
]

{ #category : 'emulating' }
SpMorphicDieAdapter >> clicked [
"used for test, but incomplete if you still see this."
	| evt |
	evt := MouseButtonEvent new
		       setType: #mouseDown
		       position: 0@0
		       which: MouseButtonEvent redButton
		       buttons: MouseButtonEvent redButton
		       hand: nil
		       stamp: nil.

]

{ #category : 'accessing' }
SpMorphicDieAdapter >> dieValue [

	^ dieValue
]

{ #category : 'event handling' }
SpMorphicDieAdapter >> processMouseDown: evt [

	evt redButtonPressed ifFalse: [ ^ self ].
	dieValue := evt handler dieValue.
	self presenter performAction
]
