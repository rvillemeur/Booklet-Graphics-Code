Class {
	#name : 'AthensExamplePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'paintPresenter'
	],
	#category : 'BookletGraphics-Spec',
	#package : 'BookletGraphics',
	#tag : 'Spec'
}

{ #category : 'layout' }
AthensExamplePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: paintPresenter;
		  yourself
]

{ #category : 'initialization' }
AthensExamplePresenter >> initializePresenters [

	paintPresenter := self instantiate: SpAthensPresenter.
	paintPresenter surfaceExtent: 600 @ 400.
	paintPresenter drawBlock: [ :canvas | self render: canvas ]
]

{ #category : 'rendering' }
AthensExamplePresenter >> render: canvas [
"Canvas is an instance of AthensCairoCanvas"
	canvas setPaint: (canvas surface
			 createLinearGradient: {
					 (0 -> Color white).
					 (1 -> Color black) }
			 start: 0 @ 0
			 stop: canvas surface extent).
	canvas drawShape: (0 @ 0 extent: canvas surface extent)
]

{ #category : 'accessing' }
AthensExamplePresenter >> start [

	<script: 'self new open'>
	
]
