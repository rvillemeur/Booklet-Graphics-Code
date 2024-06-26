Class {
	#name : 'LogSliderTest',
	#superclass : 'TestCase',
	#category : 'BookletGraphics-Toplo',
	#package : 'BookletGraphics',
	#tag : 'Toplo'
}

{ #category : 'tests' }
LogSliderTest >> testLogSliderPosition [

	| slider |
	slider := LogSlider
		          minPos: 0
		          maxPos: 100
		          minLogVal: 100
		          maxLogVal: 10000000.
	self assert: (slider position: 100) closeTo: 0 precision: 2.
	self assert: (slider position: 316.22) closeTo: 10 precision: 2.
	self assert: (slider position: 1000) closeTo: 20 precision: 2.
	self assert: (slider position: 10000) closeTo: 40  precision: 2.
	self assert: (slider position: 100000) closeTo: 60  precision: 2.
	self assert: (slider position: 10000000) closeTo: 100 precision: 2
]

{ #category : 'tests' }
LogSliderTest >> testLogSliderValue [

	| slider |
	slider := LogSlider
		          minPos: 0
		          maxPos: 100
		          minLogVal: 100
		          maxLogVal: 10000000.
	self assert: (slider value: 0) closeTo: 100 precision: 2.
	self assert: (slider value: 10) closeTo: 316.22 precision: 2.
	self assert: (slider value: 20) closeTo: 1000 precision: 2.
	self assert: (slider value: 40) closeTo: 10000 precision: 2.
	self assert: (slider value: 60) closeTo: 100000 precision: 2.
	self assert: (slider value: 100) closeTo: 10000000 precision: 2
]
