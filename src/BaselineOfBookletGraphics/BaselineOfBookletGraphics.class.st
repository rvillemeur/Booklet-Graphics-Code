Class {
	#name : #BaselineOfBookletGraphics,
	#superclass : #BaselineOf,
	#category : #BaselineOfBookletGraphics
}

{ #category : #baselines }
BaselineOfBookletGraphics >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec package: 'BookletGraphics' with: [ spec requires: #( 'Bloc' ) ].

		spec
			baseline: 'Bloc'
			with: [
			spec repository: 'github://pharo-graphics/Bloc:dev-1.0/src' ] ]
]
