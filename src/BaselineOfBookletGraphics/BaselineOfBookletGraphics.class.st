Class {
	#name : #BaselineOfBookletGraphics,
	#superclass : #BaselineOf,
	#category : #BaselineOfBookletGraphics
}

{ #category : #baselines }
BaselineOfBookletGraphics >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			package: 'BookletGraphics'
			with: [ spec requires: #( 'Toplo' ) ].

		spec baseline: 'Toplo' with: [
			spec
				repository: 'github://pharo-graphics/Bloc:dev-1.0/src';
				onConflictUseIncoming; ignoreImage; 
				on: MCMergeOrLoadWarning
		do: [ :warning | warning load ] ]  


]
