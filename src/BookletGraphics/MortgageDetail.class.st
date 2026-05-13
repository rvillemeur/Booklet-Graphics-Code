"
A placeholder, to contain loan repayment values
"
Class {
	#name : 'MortgageDetail',
	#superclass : 'Object',
	#instVars : [
		'beginningPrincipal',
		'principalPayment',
		'remainingPrincipal',
		'interestPayment'
	],
	#category : 'BookletGraphics-inspector',
	#package : 'BookletGraphics',
	#tag : 'inspector'
}

{ #category : 'accessing' }
MortgageDetail >> beginningPrincipal [

	^ beginningPrincipal
]

{ #category : 'accessing' }
MortgageDetail >> beginningPrincipal: anObject [

	beginningPrincipal := anObject
]

{ #category : 'inspector' }
MortgageDetail >> inspectLoan: aBuilder [

	<inspectorPresentationOrder: 1 title: 'detail'>
	| inspectorBuilder |
	
	(inspectorBuilder := StSimpleInspectorBuilder on: aBuilder)
		key: #beginning value: self beginningPrincipal asString , ' $';
		key: #payment value: self principalPayment asString , ' $';
		key: #'Interest' value: self interestPayment asString , ' $';
		key: #'Remaining' value: self remainingPrincipal asString , ' $'.
	^ inspectorBuilder table
]

{ #category : 'accessing' }
MortgageDetail >> interestPayment [

	^ interestPayment
]

{ #category : 'accessing' }
MortgageDetail >> interestPayment: anObject [

	interestPayment := anObject
]

{ #category : 'accessing' }
MortgageDetail >> principalPayment [

	^ principalPayment
]

{ #category : 'accessing' }
MortgageDetail >> principalPayment: anObject [

	principalPayment := anObject
]

{ #category : 'printing' }
MortgageDetail >> printOn: aStream [

	aStream
		nextPutAll: 'Mortgage detail - Principal: ';
		print: beginningPrincipal ;
		nextPutAll: ' | payment: ';
		print:  principalPayment ;
		nextPutAll: ' | interest: ';
		print: interestPayment ;
		nextPutAll: ' | remaining: ';
		print: remainingPrincipal 
]

{ #category : 'accessing' }
MortgageDetail >> remainingPrincipal [

	^ remainingPrincipal
]

{ #category : 'accessing' }
MortgageDetail >> remainingPrincipal: anObject [

	remainingPrincipal := anObject
]
