"
Isometric tile position code taken from https://pikuma.com/blog/isometric-projection-in-games
"
Class {
	#name : 'IsometricLand',
	#superclass : 'Object',
	#category : 'BookletGraphics-Isometric3D',
	#package : 'BookletGraphics',
	#tag : 'Isometric3D'
}

{ #category : 'examples' }
IsometricLand class >> example1 [

	<sampleInstance>
	^ self new
]

{ #category : 'accessing' }
IsometricLand >> grid [

	^ #( #( 14 23 23 23 23 23 23 23 23 13 )
	     #( 21 32 33 33 28 33 28 33 31 20 )
	     #( 21 34  0  0 25 33 30  1 34 20 ) 
		  #( 21 34  0  0 34  1  1 10 34 20 )
	     #( 21 25 33 33 24 33 33 33 27 20 )
	     #( 21 34  4  7 34 18 17 10 34 20 )
	     #( 21 34  4  7 34 16 19 10 34 20 )
	     #( 21 34  6  8 34 10 10 10 34 20 )
	     #( 21 29 33 33 26 33 33 33 30 20 )
	     #( 11 22 22 22 22 22 22 22 22 12 ) )
]

{ #category : 'inspector' }
IsometricLand >> inspectSprites: aBuilder [

	<inspectorPresentationOrder: 1 title: 'sprites'>
	^ aBuilder newTable
		  addStyle: 'stList';
		  addColumn: (SpStringTableColumn new
				   title: 'id';
				   evaluated: [ :each | each key ];
				   formatted: [ :key | StObjectPrinter asTruncatedTextFrom: key ];
				   beNotExpandable;
					width: 20;
				   beSortable);
		  addColumn: (SpImageTableColumn new
				   title: 'sprite';
				   evaluated: [ :each | each value scaledToSize: 20 @ 20 ];
				   width: 40);
		  items:
			  ((self spriteList associations sorted: #key ascending) collect: [ :e |
				   StInspectorAssociationNode hostObject: e ]);
		  yourself
]

{ #category : 'as yet unclassified' }
IsometricLand >> loadSprites [

	^ (SpriteLoad new
		  importSpritesFrom: self spriteFile
		  position: self spritePosition) sprites
]

{ #category : 'as yet unclassified' }
IsometricLand >> spriteFile [

^ BookletGraphicsGitBridge root / 'assets'
		           / 'landscapeTiles_sheet.png'
]

{ #category : 'as yet unclassified' }
IsometricLand >> spriteList [

	| sprites |
	sprites := self loadSprites.

	^ self tileMapping collect: [ :each |
		        sprites at: each asSymbol ].

]

{ #category : 'as yet unclassified' }
IsometricLand >> spritePosition [

^ BookletGraphicsGitBridge root / 'assets'
		           / 'landscapeTiles_sheet.xml'
]

{ #category : 'accessing' }
IsometricLand >> tileHeight [

	^ 50
]

{ #category : 'as yet unclassified' }
IsometricLand >> tileMapping [
"mapping of code to tile, apply to landscape Tiles example"
^{   0 -> #'landscapeTiles_081.png' .  
    1 -> #'landscapeTiles_067.png' . 
    2 -> #'landscapeTiles_099.png' . 
	 3 -> #'landscapeTiles_029.png' . 
	 4 -> #'landscapeTiles_091.png' . 
    5 -> #'landscapeTiles_021.png' . 
	 6 -> #'landscapeTiles_028.png' . 
	 7 -> #'landscapeTiles_106.png' . 
	 8 -> #'landscapeTiles_036.png' . 
	 9 -> #'landscapeTiles_098.png' . 
	10 -> #'landscapeTiles_059.png' . 
   11 -> #'landscapeTiles_076.png' .
   12 -> #'landscapeTiles_084.png' .
	13 -> #'landscapeTiles_077.png' . 
	14 -> #'landscapeTiles_069.png' .
	15 -> #'landscapeTiles_066.png' .
   16 -> #'landscapeTiles_048.png' .
   17 -> #'landscapeTiles_049.png' . 
   18 -> #'landscapeTiles_055.png' .
   19 -> #'landscapeTiles_056.png' .
   20 -> #'landscapeTiles_058.png' .
	21 -> #'landscapeTiles_051.png' . 
	22 -> #'landscapeTiles_043.png' . 
	23 -> #'landscapeTiles_058.png' .
	24 -> #'landscapeTiles_090.png' .
	25 -> #'landscapeTiles_096.png' .
	26 -> #'landscapeTiles_104.png' .
	27 -> #'landscapeTiles_089.png' .
	28 -> #'landscapeTiles_097.png' .
	29 -> #'landscapeTiles_125.png' .
	30 -> #'landscapeTiles_127.png' .
	31 -> #'landscapeTiles_126.png' .
	32 -> #'landscapeTiles_123.png' .
	33 -> #'landscapeTiles_074.png' .
	34 -> #'landscapeTiles_082.png' 
} asDictionary 
]

{ #category : 'accessing' }
IsometricLand >> tileWidth [

	^ 100
]

{ #category : 'accessing' }
IsometricLand >> xElement [

	^ 10
]

{ #category : 'accessing' }
IsometricLand >> yElement [

	^ 10
]
