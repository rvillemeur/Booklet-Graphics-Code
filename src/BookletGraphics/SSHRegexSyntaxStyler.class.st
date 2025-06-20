Class {
	#name : 'SSHRegexSyntaxStyler',
	#superclass : 'BlTextStyler',
	#instVars : [
		'regexToTextAttribute',
		'styleTable'
	],
	#category : 'BookletGraphics-Toplo',
	#package : 'BookletGraphics',
	#tag : 'Toplo'
}

{ #category : 'adding' }
SSHRegexSyntaxStyler >> addKeyword: aString withAttribute: aTextAttribute [

	self
		addRegex: '(^|\W)' , aString , '($|\W)'
		withAttribute: aTextAttribute
]

{ #category : 'adding' }
SSHRegexSyntaxStyler >> addKeywords: aCollectionOfKeywords withAttribute: aTextAttribute [

	aCollectionOfKeywords do: [ :keyword |
		self addKeyword: keyword withAttribute: aTextAttribute ]
]

{ #category : 'adding' }
SSHRegexSyntaxStyler >> addRegex: aString withAttribute: aTextAttribute [

	self addRegex: aString withAttributes: { aTextAttribute }
]

{ #category : 'adding' }
SSHRegexSyntaxStyler >> addRegex: aString withAttributes: anArrayOfTextAttributes [

	self regexToTextAttribute at: aString put: anArrayOfTextAttributes
]

{ #category : 'initialization' }
SSHRegexSyntaxStyler >> initialize [

	super initialize.
	self regexToTextAttribute: Dictionary new
]

{ #category : 'private' }
SSHRegexSyntaxStyler >> privateStyle: aText [

	| str |
	str := aText asString.
	self regexToTextAttribute keysAndValuesDo: [ :regex :attributes |
			(str allRangesOfRegexMatches: regex) do: [ :interval |
					attributes do: [ :attribute |
						aText
							attribute: attribute
							from: interval first
							to: interval last ] ] ].
	^aText
]

{ #category : 'accessing' }
SSHRegexSyntaxStyler >> regexToTextAttribute [

	^ regexToTextAttribute
]

{ #category : 'accessing' }
SSHRegexSyntaxStyler >> regexToTextAttribute: anObject [

	regexToTextAttribute := anObject
]

{ #category : 'accessing' }
SSHRegexSyntaxStyler >> styleTable [
	"note: only for compatility reason
When we add a styler to ToAlbum, it will add stamp e hasStamp: #'sh-styled'
This refer to the styleTable of the styler, which could be an array, a dictionnary, 
whatever fit your style representation..."

	^ Dictionary new
]

{ #category : 'accessing' }
SSHRegexSyntaxStyler >> styleTable: aStyle [

	styleTable := aStyle
]
