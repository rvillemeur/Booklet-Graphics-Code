"
Sample mortage and inspector
"
Class {
	#name : #MortgageExample,
	#superclass : #Object,
	#instVars : [
		'duration',
		'rate',
		'amount'
	],
	#category : #'BookletGraphics-inspector'
}

{ #category : #examples }
MortgageExample class >> example [

	<sampleInstance>
	^ Mortgage  principal: 330000 duration: 12 * 3 rate: 4.5 percent "month" "year"
]

{ #category : #'see class side' }
MortgageExample >> seeClassSide [ 
]
