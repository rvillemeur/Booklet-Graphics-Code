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
			with: [ spec requires: #( 'Toplo' ) ].

		spec
			baseline: 'Toplo'
			"with: [ spec repository: 'github://pharo-graphics/Toplo:dev/src' ] ]"
			with: [ spec repository: 'github://rvillemeur/Bloc:dev/src' ] ]
]
