"
Extension of Raw Theme to include clock element that can be customized.

"
Class {
	#name : 'ToRawClockTheme',
	#superclass : 'ToRawTheme',
	#category : 'BookletGraphics-Clock',
	#package : 'BookletGraphics',
	#tag : 'Clock'
}

{ #category : 'accessing' }
ToRawClockTheme class >> defaultTokenProperties [

	^ super defaultTokenProperties , {
		  (ToTokenProperty
			   name: #'background-color'
			   value: (Color green)).
	}
]
