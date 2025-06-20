Class {
	#name : 'SSHSQLSyntaxStylerExample',
	#superclass : 'Object',
	#category : 'BookletGraphics-Toplo',
	#package : 'BookletGraphics',
	#tag : 'Toplo'
}

{ #category : 'examples' }
SSHSQLSyntaxStylerExample class >> example [

<sampleInstance>
|text album space|
text := 'SELECT * FROM table WHERE id = 42 AND property = foo ORDER BY name;' asRopedText.
album := ToAlbum new.
album styler: (SSHSQLSyntaxStyler new).
album text: text.
album withRowNumbers.

space := BlSpace new.
space root addChild: album.
space show
]

{ #category : 'see class side' }
SSHSQLSyntaxStylerExample >> seeClassSide [ 
]
