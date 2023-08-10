Class {
	#name : #RdvLayoutBlock,
	#superclass : #Object,
	#category : #'BookletGraphics-Bloc'
}

{ #category : #accessing }
RdvLayoutBlock >> layout1 [
	"This is a new method"

	<bookExample>
	^ BlElement new
		  layout: BlLinearLayout horizontal;
		  size: 400 @ 300;
		  background: (Color gray alpha: 0.2);
		  addChildren: {
				  (BlElement new
					   size: 100 @ 200;
					   background: (Color red alpha: 0.2)).
				  (BlElement new
					   size: 200 @ 100;
					   background: (Color blue alpha: 0.2)) }
]

{ #category : #accessing }
RdvLayoutBlock >> layout2 [
	"This is a new method"

	<bookExample>
	^ BlElement new
		  layout: BlLinearLayout horizontal alignCenter;
		  size: 400 @ 300;
		  background: (Color gray alpha: 0.2);
		  addChildren: {
				  (BlElement new
					   size: 100 @ 200;
					   background: (Color red alpha: 0.2)).
				  (BlElement new
					   size: 200 @ 100;
					   background: (Color blue alpha: 0.2)) }
]

{ #category : #accessing }
RdvLayoutBlock >> layout3 [
	"This is a new method"

	<bookExample>
	^ BlElement new
		  layout: BlLinearLayout horizontal;
		  size: 400 @ 300;
		  background: (Color gray alpha: 0.2);
		  addChildren: {
				  (BlElement new
					   size: 100 @ 200;
					   background: (Color red alpha: 0.2)).
				  (BlElement new
					   size: 200 @ 100;
					   background: (Color blue alpha: 0.2);
					   constraintsDo: [ :c |
						   c ignoreByLayout.
						   c vertical exact: 200.
						   c horizontal exact: 100.
						   c ignored horizontal alignRight.
						   c ignored vertical alignBottom ]) } "alignCenter"
]

{ #category : #accessing }
RdvLayoutBlock >> layout4 [
	"This is a new method"

	<bookExample>
	^ BlElement new
		  layout: BlLinearLayout horizontal;
		  size: 400 @ 300;
		  background: (Color gray alpha: 0.2);
		  addChildren: {
				  (BlElement new
					   size: 100 @ 200;
					   background: (Color red alpha: 0.2)).
				  (BlElement new
					   size: 200 @ 100;
					   background: (Color blue alpha: 0.2);
					   constraintsDo: [ :c |
						   c ignoreByLayout.
						   c vertical exact: 200.
						   c horizontal exact: 100.
						   c horizontal matchParent.
						   c ignored horizontal alignRight.
						   c ignored vertical alignBottom ]) } "alignCenter"
]

{ #category : #accessing }
RdvLayoutBlock >> layout5 [
	"This is a new method"

	<bookExample>
	^ BlElement new
		  layout: BlLinearLayout horizontal alignCenter;
		  size: 400 @ 300;
		  background: (Color gray alpha: 0.2);
		  addChildren: {
				  (BlElement new
					   size: 100 @ 200;
					   background: (Color red alpha: 0.2)).
				  (BlElement new
					   size: 200 @ 100;
					   background: (Color blue alpha: 0.2);
					   constraintsDo: [ :c | c margin: (BlInsets all: 10) ]) }
]
