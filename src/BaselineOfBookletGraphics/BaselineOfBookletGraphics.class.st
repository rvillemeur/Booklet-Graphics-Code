Class {
	#name : 'BaselineOfBookletGraphics',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBookletGraphics',
	#package : 'BaselineOfBookletGraphics'
}

{ #category : 'baselines' }
BaselineOfBookletGraphics >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec
				package: 'BookletGraphics'
				with: [ spec requires: #( 'Toplo' 'GitBridge' ) ].

			spec
				baseline: 'Toplo'
				with: [ spec repository: 'github://pharo-graphics/Toplo:dev/src' ].

			spec
				baseline: 'GitBridge'
				with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ] ]
]
