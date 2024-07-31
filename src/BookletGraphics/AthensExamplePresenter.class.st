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
	paintPresenter surfaceExtent: 600 @ 600.
	paintPresenter drawBlock: [ :canvas | self render: canvas ]
]

{ #category : 'rendering' }
AthensExamplePresenter >> render: canvas [
	"Canvas is an instance of AthensCairoCanvas"

	| stroke squarePath circlePath |
	squarePath := canvas createPath: [ :builder |
		              builder
			              absolute;
			              moveTo: 100 @ 100;
			              lineTo: 100 @ 300;
			              lineTo: 300 @ 300;
			              lineTo: 300 @ 100;
			              close ].
	circlePath := canvas createPath: [ :builder |
		              builder
			              absolute;
			              moveTo: 200 @ 100;
			              cwArcTo: 200 @ 300 angle: 180 degreesToRadians;
			              cwArcTo: 200 @ 100 angle: Float pi ].
	canvas setPaint: Color red.
	canvas setPaint: (canvas surface
			 createLinearGradient: {
					 (0 -> Color white).
					 (1 -> Color black) }
			 start: 100 @ 100
			 stop: 300@300).
	canvas drawShape: squarePath.
	stroke := canvas setStrokePaint: Color black.
	stroke
		width: 10;
		joinRound;
		capRound.
	canvas drawShape: squarePath.
	canvas drawShape: circlePath.
	circlePath := canvas createPath: [ :builder |
		              builder
			              relative;
			              moveTo: 175 @ 175;
			              cwArcTo: 50 @ 50 angle: 180 degreesToRadians;
			              cwArcTo: -50 @ -50 angle: Float pi ].
	canvas drawShape: circlePath.
	canvas drawShape: (0 @ 0 extent: canvas surface extent)
]

{ #category : 'accessing' }
AthensExamplePresenter >> start [

	<script: 'self new open'>
	
]
