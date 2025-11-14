Class {
	#name : 'AlbumExperiment',
	#superclass : 'BlTextStyler',
	#category : 'BookletGraphics-Toplo',
	#package : 'BookletGraphics',
	#tag : 'Toplo'
}

{ #category : 'examples' }
AlbumExperiment class >> hideMarkupInText [

	<sampleInstance>
	"note: raise space exception as of 14 of nov 2025 - to review later when event handling will stabilized in Album"
	| text leftMarker rightMarker subText |
	text := 'Move cursor **here** to show markup' asRopedText fontSize:
		        20.

	(text from: 15 to: 18) bold.

	(text from: 13 to: 14)
		foreground: Color red;
		attribute: (leftMarker := AlbTextInvisibleMarkerAttribute new).

	(text from: 19 to: 20)
		foreground: Color red;
		attribute: (rightMarker := AlbTextInvisibleMarkerAttribute new).

	subText := text from: 11 to: 22.
	subText
		findAttributes: {
				leftMarker.
				rightMarker }
		indicesDo: [ :aMarkupStart :aMarkupEnd |
				(subText from: aMarkupStart to: aMarkupEnd) attribute:
					AlbTextHideAttribute new ].
	"(text from: 11 to: 22)
		onCursorEnter: [ :aTextEditor :anEvent :aFromIndex :aToIndex | 
			| aSubText |
			(aSubText := aTextEditor text from: aFromIndex to: aToIndex)
				findAttributes: { 
						leftMarker.
						rightMarker }
				indicesDo: [ :aMarkupStart :aMarkupEnd | 
					(aSubText from: aMarkupStart to: aMarkupEnd) 
						clearAttributesOfClass: AlbTextHideAttribute ] ]
		leave: [ :aTextEditor :anEvent :aFromIndex :aToIndex | 
			| aSubText |
			(aSubText := aTextEditor text from: aFromIndex to: aToIndex)
				findAttributes: { 
						leftMarker.
						rightMarker }
				indicesDo: [ :aMarkupStart :aMarkupEnd | 
					(aSubText from: aMarkupStart to: aMarkupEnd) attribute:
						AlbTextHideAttribute new ] ]."

	^ (AlbEditorElement new text: text) openInSpace
]

{ #category : 'examples' }
AlbumExperiment class >> textAttributeExperimentWithMouse [
<sampleInstance>
"note: raise space exception as of 14 of nov 2025 - to review later when event handling will stabilized in Album"
	| text editorElement space clickText hoverText |
	clickText := '	<Clik here>'.
	hoverText := '<<<Mouse over here >>>'.
	text := (clickText , ' ' , hoverText) asRopedText.
	editorElement := AlbEditorElement new text: text.

	editorElement text
		attributes: {
				(BlTextBackgroundAttribute new paint: Color lightBlue).
				(AlbTextEventHandlerAttribute new addEventHandler:
					 (BlEventHandler
						  on: BlClickEvent
						  do: [ :anEvent |
								  self inform: anEvent asString.
								  anEvent consumed: true ])) }
		from: 3
		to: 11.

	editorElement text
		attributes: {
				(BlTextBackgroundAttribute new paint: Color yellow).
				(AlbTextEventHandlerAttribute new addEventHandler:
					 (BlEventHandler
						  on: BlMouseEnterEvent
						  do: [ :anEvent |
								  self inform: anEvent asString.
								  anEvent consumed: true ])).
				(AlbTextEventHandlerAttribute new
					 addEventHandlerOn: BlMouseLeaveEvent doOnce: [ :anEvent |
							 self inform: anEvent asString.
							 anEvent consumed: true ];
					 yourself) }
		from: 17
		to: 30.

	space := BlSpace new.
	space root addChild: editorElement.
	space show
]

{ #category : 'see class side' }
AlbumExperiment >> seeClassSide [
]
