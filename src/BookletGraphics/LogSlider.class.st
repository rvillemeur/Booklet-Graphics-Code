"
log slider value and position, idea taken from [stackoverflow](https://stackoverflow.com/questions/846221/logarithmic-slider), 
from a question asked by Enzo in Bloc mailing list.
"
Class {
	#name : 'LogSlider',
	#superclass : 'Object',
	#instVars : [
		'minPos',
		'maxPos',
		'minLogVal',
		'maxLogVal'
	],
	#category : 'BookletGraphics-Toplo',
	#package : 'BookletGraphics',
	#tag : 'Toplo'
}

{ #category : 'accessing' }
LogSlider class >> minPos: aValue maxPos: aValue2 minLogVal: aValue3 maxLogVal: aValue4 [

	^ self new
		  minPos: aValue;
		  maxPos: aValue2;
		  minLogVal: aValue3 ln;
		  maxLogVal: aValue4 ln
]

{ #category : 'accessing' }
LogSlider >> maxLogVal: anObject [

	maxLogVal := anObject
]

{ #category : 'accessing' }
LogSlider >> maxPos: anObject [

	maxPos := anObject
]

{ #category : 'accessing' }
LogSlider >> minLogVal: anObject [

	minLogVal := anObject
]

{ #category : 'accessing' }
LogSlider >> minPos: anObject [

	minPos := anObject
]

{ #category : 'accessing' }
LogSlider >> position: aValue [

	^ minPos + (aValue ln - minLogVal / self scale)
]

{ #category : 'accessing' }
LogSlider >> scale [

	^ maxLogVal - minLogVal / (maxPos - minPos)
]

{ #category : 'accessing' }
LogSlider >> value: position [

	^ (position - minPos * self scale + minLogVal) exp
]
