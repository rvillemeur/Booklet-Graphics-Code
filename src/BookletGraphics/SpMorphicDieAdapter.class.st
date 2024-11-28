"
Add adapter to the list in the system with

`SpNullApplication class reset`
"
Class {
	#name : 'SpMorphicDieAdapter',
	#superclass : 'SpAbstractMorphicAdapter',
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
	self model performAction
]

{ #category : 'factory' }
SpMorphicDieAdapter >> buildWidget [

	| instance |
	instance := SpDieMorph on: self faces: self presenter faces.
	^ instance
]

{ #category : 'emulating' }
SpMorphicDieAdapter >> clicked [

	| evt |
	evt := MouseButtonEvent new
		       setType: #mouseDown
		       position: 0@0
		       which: MouseButtonEvent redButton
		       buttons: MouseButtonEvent redButton
		       hand: nil
		       stamp: nil.

]
