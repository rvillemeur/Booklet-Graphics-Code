Class {
	#name : #BaselineOfBookletGraphics,
	#superclass : #BaselineOf,
	#category : #BaselineOfBookletGraphics
}

{ #category : #baselines }
BaselineOfBookletGraphics >> baseline: spec [

	<baseline>
		spec
			package: 'BookletGraphics'
			with: [ spec requires: #( 'Toplo' ) ].

		spec baseline: 'Toplo' with: [
			spec
				repository: 'github://plantec/Toplo/src';
				onConflictUseIncoming ] ]  


]
