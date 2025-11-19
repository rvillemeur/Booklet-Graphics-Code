"
A helper class to load sprite from a sprite sheet.
Asset in example are coming from: 
- https://www.kenney.nl/assets/isometric-landscape
- https://www.kenney.nl/assets/isometric-vehicles-1
- https://www.kenney.nl/assets/isometric-buildings-1

You can find other asset on this fantastic web site.
"
Class {
	#name : 'SpriteLoad',
	#superclass : 'Object',
	#instVars : [
		'sprites'
	],
	#category : 'BookletGraphics-Isometric3D',
	#package : 'BookletGraphics',
	#tag : 'Isometric3D'
}

{ #category : 'examples' }
SpriteLoad class >> example1 [

	<sampleInstance>
	| sprites |
	sprites := self new
		           importSpritesFrom:
		           BookletGraphicsGitBridge root / 'assets'
		           / 'buildingTiles_sheet.png'
		           position:
		           BookletGraphicsGitBridge root / 'assets'
		           / 'buildingTiles_sheet.xml'.
	^ sprites
]

{ #category : 'examples' }
SpriteLoad class >> example2 [

	<sampleInstance>
	| sprites |
	sprites := self new
		           importSpritesFrom:
		           BookletGraphicsGitBridge root / 'assets'
		           / 'sheet_allCars.png'
		           position:
		           BookletGraphicsGitBridge root / 'assets'
		           / 'sheet_allCars.xml'.
	^ sprites
]

{ #category : 'examples' }
SpriteLoad class >> example3 [

	<sampleInstance>
	| sprites |
	sprites := self new
		           importSpritesFrom:
		           BookletGraphicsGitBridge root / 'assets'
		           / 'landscapeTiles_sheet.png'
		           position:
		           BookletGraphicsGitBridge root / 'assets'
		           / 'landscapeTiles_sheet.xml'.
	^ sprites
]

{ #category : 'parsing' }
SpriteLoad >> importSpriteFromSheet: aSpriteSheet at: node [

	| name x y width height sprite |
	name := node attributeAt: 'name'.
	x := (node attributeAt: 'x') asNumber.
	y := (node attributeAt: 'y') asNumber.
	width := (node attributeAt: 'width') asNumber.
	height := (node attributeAt: 'height') asNumber.

	sprite := aSpriteSheet contentsOfArea:
		          (Rectangle point: x @ y point: x + width @ (y + height)).

	sprites at: name asSymbol put: sprite.
]

{ #category : 'parsing' }
SpriteLoad >> importSpritesFrom: aSpriteSheet position: aPositionReference [
|spriteSheet|

spriteSheet := PNGReadWriter formFromFileNamed: aSpriteSheet.

	(self xmlTreeFromFile: aPositionReference) nodes first nodes do: [
			:node |
			node class = XMLElement ifTrue: [
				self importSpriteFromSheet: spriteSheet at: node ] ]
]

{ #category : 'initialization' }
SpriteLoad >> initialize [

	super initialize.
	sprites := Dictionary new
]

{ #category : 'parsing' }
SpriteLoad >> xmlTreeFromFile: aFileName [ 

	^ aFileName asFileReference readStreamDo: [ :stream |
		  (XMLDOMParser parse: stream) document ]
]
