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

	| name sprite |
	name := self spriteNameFrom: node.
	sprite := aSpriteSheet contentsOfArea: (Rectangle
			           origin: (self spriteOriginFrom: node)
			           extent: (self spriteExtentFrom: node)).

	sprites at: name asSymbol put: sprite
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

{ #category : 'inspector' }
SpriteLoad >> inspectSprites: aBuilder [

	<inspectorPresentationOrder: 1 title: 'sprites'>
	^ aBuilder newTable
		  addStyle: 'stList';
		  addColumn: (SpStringTableColumn new
				   title: 'Key';
				   evaluated: [ :each | each key ];
				   formatted: [ :key | StObjectPrinter asTruncatedTextFrom: key ];
				   beNotExpandable;
				   beSortable);
		  addColumn: (SpImageTableColumn new
				   title: 'Value';
				   evaluated: [ :each | each value scaledToSize: 20 @ 20 ];
				   width: 20);
		  items:
			  ((self sprites associations sorted: #key ascending) collect: [ :e |
				   StInspectorAssociationNode hostObject: e ]);
		  yourself
]

{ #category : 'parsing' }
SpriteLoad >> spriteExtentFrom: node [

	^ (node attributeAt: 'width') asNumber
	  @ (node attributeAt: 'height') asNumber
]

{ #category : 'parsing' }
SpriteLoad >> spriteNameFrom: node [

	^ node attributeAt: 'name'
]

{ #category : 'parsing' }
SpriteLoad >> spriteOriginFrom: node [

	^ (node attributeAt: 'x') asNumber @ (node attributeAt: 'y') asNumber
]

{ #category : 'accessing' }
SpriteLoad >> sprites [

	^ sprites
]

{ #category : 'parsing' }
SpriteLoad >> xmlTreeFromFile: aFileName [ 

	^ aFileName asFileReference readStreamDo: [ :stream |
		  (XMLDOMParser parse: stream) document ]
]
