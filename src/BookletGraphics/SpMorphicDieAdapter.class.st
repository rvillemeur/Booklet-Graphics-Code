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

{ #category : 'accessing' }
SpMorphicDieAdapter >> action [
	self presenter performAction
]

{ #category : 'factory' }
SpMorphicDieAdapter >> buildWidget [

	| instance |
	instance := SpDieMorph on: self faces: self presenter faces.
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

{ #category : 'accessing' }
SpMorphicDieAdapter >> dieValue: anObject [

	dieValue := anObject.
]
