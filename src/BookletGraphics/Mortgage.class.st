"
Simple mortgage calculator, based on article: [mortgage](https://www.cpajournal.com/2018/11/21/mortgage-amortization-revisited)

This was to illustrate inspector extension with custom view
- key/value pair
- Spec2 component
- Roassal graph

You can inspect:

```
Mortgage principal: 330000 duration: 12 ""month"" * 3 ""year""rate: 4.5 percent.  
```


"
Class {
	#name : 'Mortgage',
	#superclass : 'Object',
	#instVars : [
		'duration',
		'rate',
		'amount'
	],
	#category : 'BookletGraphics-inspector',
	#package : 'BookletGraphics',
	#tag : 'inspector'
}

{ #category : 'instance creation' }
Mortgage class >> principal: anAmount duration: aDuration rate: aRate [

	^ self new
		  amount: anAmount;
		  duration: aDuration;
		  rate: aRate;
		  yourself
]

{ #category : 'api' }
Mortgage >> amortizationTable [

	| beginningPrincipal remainingPrincipal payment elements |
	beginningPrincipal := self amount.
	payment := self payment.
	elements := OrderedCollection new.

	1 to: self duration do: [ :each |
		remainingPrincipal := self principalRemainingAtPeriod: each.
		elements add: (MortgageDetail new
				 beginningPrincipal: beginningPrincipal;
				 remainingPrincipal: remainingPrincipal;
				 principalPayment:
					 (beginningPrincipal - remainingPrincipal round: 2);
				 interestPayment:
					 (payment - (beginningPrincipal - remainingPrincipal) round: 2)).
		beginningPrincipal := remainingPrincipal ].
	^ elements
]

{ #category : 'accessing' }
Mortgage >> amount [

	^ amount
]

{ #category : 'accessing' }
Mortgage >> amount: anObject [

	amount := anObject
]

{ #category : 'accessing' }
Mortgage >> duration [

	^ duration
]

{ #category : 'accessing' }
Mortgage >> duration: anObject [

	duration := anObject
]

{ #category : 'inspector' }
Mortgage >> formatAmount: anAmount [

	| displayAmount integer fractionnal formatedInteger remainder |
	displayAmount := anAmount asString.

	"extract fractionnal part or use empty string"
	integer := displayAmount withoutPeriodSuffix.
	fractionnal := displayAmount withoutLeadingDigits.

	"Split integer by group of 3 digit."
	remainder := integer size \\\ 3.
	formatedInteger := (integer last: integer size - remainder) groupsOf: 3.
	formatedInteger addFirst: (integer first: remainder).

	displayAmount := (String streamContents: [ :s |
			                  formatedInteger
				                  do: [ :each | s << each ]
				                  separatedBy: [ s << ' ' ].
			                  s << fractionnal ]) trimBoth.

	^ displayAmount
]

{ #category : 'inspector' }
Mortgage >> inspectAmortization: aBuilder [
"aBuilder being an instance of SpPresenterBuilder"
	<inspectorPresentationOrder: 2 title: 'amortization table'>
	| table |
	table := aBuilder newTable
		         beResizable;
		         items: self amortizationTable;
		         addColumn: (SpStringTableColumn
				          title: 'Beginning Balance'
				          evaluated: [ :each |
					          self formatAmount: each beginningPrincipal ]);
		         addColumn: (SpStringTableColumn
				          title: 'Interest Paid'
				          evaluated: [ :each |
					          self formatAmount: each interestPayment ]);
		         addColumn: (SpStringTableColumn
				          title: 'Principal Paid'
				          evaluated: [ :each |
					          self formatAmount: each principalPayment ]);
		         addColumn: (SpStringTableColumn
				          title: 'Remaining Principal'
				          evaluated: [ :each |
					          self formatAmount: each remainingPrincipal ]);
		         yourself.
	^ table
]

{ #category : 'inspector' }
Mortgage >> inspectAmortizationChart: aBuilder [

	<inspectorPresentationOrder: 3 title: 'amortization'>
	| chart  interestPlot principalPlot  legend  interestPaid principalPaid size presenter |
	presenter := aBuilder instantiate: SpRoassalInspectorPresenter.
	interestPaid := self amortizationTable collect: [ :each | each interestPayment ].
	principalPaid := self amortizationTable collect: [ :each | each principalPayment ].
	size := 4.
	
	chart := RSCompositeChart new.
	chart title: 'Payment'.
	chart extent: 300 @ 200.
	
	principalPlot := RSBarPlot new color: Color orange; barSize: size; barOffset: size* -0.5.
	principalPlot y: principalPaid.
	chart add: principalPlot.
	
	interestPlot  := RSBarPlot new color: Color blue; barSize: size; barOffset: size* 0.5.
	interestPlot y: interestPaid .
	chart add: interestPlot.

	chart addDecoration: RSVerticalTick new .
	chart build.
	
	legend := RSLegend new.
	legend layout vertical.
	legend title: 'legend'.
	
	#('principal paid' 'interest paid') doWithIndex: [ :lbl :index |
		legend text: lbl withBoxColor: (chart plots at: index) computeColor ].
	legend container: chart canvas.
	legend location right middle offset: 5.
	legend build.


	^ presenter
		  canvas: chart canvas;
		  yourself
]

{ #category : 'inspector' }
Mortgage >> inspectAmortizationChartContext: aContext [

	^ aContext active: rate > 0
]

{ #category : 'inspector' }
Mortgage >> inspectAmortizationContext: aContext [

	^ aContext active: rate > 0
]

{ #category : 'inspector' }
Mortgage >> inspectLoan: aBuilder [

	<inspectorPresentationOrder: 1 title: 'detail'>
	| inspectorBuilder |
	
	(inspectorBuilder := StSimpleInspectorBuilder on: aBuilder)
		key: #Principal value: (self formatAmount: self amount) , ' $';
		key: #Duration value: self duration asString , ' months';
		key: #'Nominal Rate' value: (self rate * 100) asString , ' %';
		key: #'Monthly rate' value: (self monthlyRate * 100) asString , ' %';
		key: #'Monthly payment' value: (self formatAmount: self payment asString) , ' $'.
	self rate < 0 ifTrue: [
		inspectorBuilder key: #Warning value: 'rate cannot be negative' ].

	^ inspectorBuilder table
]

{ #category : 'api' }
Mortgage >> monthlyRate [

	^ rate / 12
]

{ #category : 'api' }
Mortgage >> payment [

	^ amount * self monthlyRate
	  / (1 - (1 + self monthlyRate raisedTo: duration negated)) round: 2
]

{ #category : 'api' }
Mortgage >> principalRemainingAtPeriod: anInteger [

	^ 1 - (1 / (1 + self monthlyRate) raisedTo: duration - anInteger)
	  / self monthlyRate * self payment round: 2
]

{ #category : 'accessing' }
Mortgage >> rate [

	^ rate
]

{ #category : 'accessing' }
Mortgage >> rate: anObject [

	rate := anObject
]
