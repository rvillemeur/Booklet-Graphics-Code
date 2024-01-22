Class {
	#name : #BlRunningMan,
	#superclass : #Object,
	#instVars : [
		'sprite',
		'position',
		'topLeft',
		'bottomRight',
		'view'
	],
	#category : #'BookletGraphics-Bloc'
}

{ #category : #drawing }
BlRunningMan >> computeNewSpriteBounds [
	"coordinate of next sprite, 32 pixels on the left"

	topLeft := topLeft translateBy: 32 @ 0.
	bottomRight := bottomRight translateBy: 32 @ 0.

	"we move to the next sprite. If we reach the end of one line"
	bottomRight x > 128
		ifTrue: [ bottomRight := 32 @ (bottomRight y + 32).
			topLeft := 0 @ (topLeft y + 32) ].
	"we reach the end of the grid, restart from 0"
	bottomRight y > 128
		ifTrue: [ self initSpritePosition ]
]

{ #category : #accessing }
BlRunningMan >> container [

	^ BlElement new
		  size: (32 * self magnifyFactor)  @ (32 * self magnifyFactor );
		  background: (BlPaintBackground paint: (Color green alpha: 0.2))
]

{ #category : #initialization }
BlRunningMan >> initSpritePosition [
	topLeft := 0 @ 0.
	bottomRight := 32 @ 32.
]

{ #category : #initialization }
BlRunningMan >> initialize [
	super initialize.
	sprite := ZnEasy
		getPng: 'https://opengameart.org/sites/default/files/spritesheet_caveman.png'.

	self initSpritePosition.
	view := (self container) addChild: (self runningMan)
]

{ #category : #initialization }
BlRunningMan >> magnifyFactor [
	^ 5
]

{ #category : #'instance creation' }
BlRunningMan >> open [
	<script: 'self new view openInNewSpace'>
]

{ #category : #'as yet unclassified' }
BlRunningMan >> runningMan [

	| animation |
	animation := BlNumberTransition new
		             from: 0;
		             to: 16;
		             by: 1;
		             beInfinite;
		             duration: 3 seconds;
		             onStepDo: [ :aValue :anElement |
			             self computeNewSpriteBounds . anElement background: self runningManBackground  ].

	^ BlElement new
		  size: 32 * 5 @ (32 * 5);
		  addAnimation: animation
		  
]

{ #category : #'as yet unclassified' }
BlRunningMan >> runningManBackground [

	^ BlImageBackground image:
		  ((sprite contentsOfArea:
			    (Rectangle point: topLeft point: bottomRight)) magnifyBy: 5)
]

{ #category : #accessing }
BlRunningMan >> view [

	^ view
]
