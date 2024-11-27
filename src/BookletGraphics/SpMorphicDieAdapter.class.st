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

{ #category : 'factory' }
SpMorphicDieAdapter >> buildWidget [

	| instance |
	instance := DieMorph new.
	"self presenter whenDrawBlockChangedDo: [ :newBlock | 
		instance drawBlock: newBlock ].
	self presenter whenExtentChangedDo: [ :newExtent | 
		instance extent: newExtent ].
	instance extent: self presenter surfaceExtent.
	instance drawBlock: self presenter drawBlock.
	instance setBalloonText: self model help.
	self presenter whenHelpChangedDo: [ 
		instance setBalloonText: self model help ]."
	^ instance
]
