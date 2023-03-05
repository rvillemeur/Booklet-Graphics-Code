"
combination rules noted on Form class side: 

1: And ""Answer the integer denoting the logical 'and' combination rule.""
3: over ""Answer the integer denoting mode over.""
4: erase ""Answer the integer denoting mode erase.""
6: reverse 	""Answer the integer denoting mode reverse.""
7: under 	""Answer the integer denoting mode under.""
16: oldPaint ""Answer the integer denoting the 'paint' combination rule.""
17: oldErase1bitShape ""Answer the integer denoting mode erase.""

24: Blend ""Answer the integer denoting BitBlt's alpha blend combination rule.""
25: paint ""Answer the integer denoting the 'paint' combination rule.""
26: erase1bitShape 	""Answer the integer denoting mode erase.""
30: blendAlpha ""Answer the integer denoting BitBlt's blend-with-constant-alpha rule.""
31: paintAlpha 	""Answer the integer denoting BitBlt's paint-with-constant-alpha rule.""

--------------------------------------------------------------
The combination rule whose value is 0 through 15 programs the transfer to produce 1 or 0 according to its 4-bit representation as follows:
8:	if source is 0 and destination is 0
4:	if source is 0 and destination is 1
2:	if source is 1 and destination is 0
1:	if source is 1 and destination is 1.
At each pixel the corresponding bits of the source and destination pixel values determine one of these conditions;  if the combination rule has a 1 in the corresponding bit position, then the new destination value will be 1, otherwise it will be zero.  Forms may be of different depths, see the comment in class Form.

base combination rule - produce 1 or 0 -> apply to 1bit graphics ?

0: 0000 -> always return 0 ?
1: 0001 -> source is 1 and destination is 1 => 1
2: 0010 -> source is 1 and destination is 0 => 1
3: 0011 
4: 0100 -> source is 0 and destination is 1 => 1
5: 0101
6: 0110
7: 0111
8: 1000 -> source is 0 and destination is 0 => 1
9: 1001
10: 1010
11: 1011
12: 1100
13: 1101
14: 1110
15: 1111 -> always return 1 ?

if the combination rule has a 1 in the corresponding bit position, then the new destination value will be 1, otherwise it will be zero. 

In addition to the original 16 combination rules, this BitBlt supports
16	fails (to simulate paint bits)
17	fails (to simulate erase bits)
18	sourceWord + destinationWord
19	sourceWord - destinationWord
20	rgbAdd: sourceWord with: destinationWord.  Sum of color components
21	rgbSub: sourceWord with: destinationWord.  Difference of color components
22	OLDrgbDiff: sourceWord with: destinationWord.  Sum of abs of differences in components
23	OLDtallyIntoMap: destinationWord.  Tallies pixValues into a colorMap
these old versions don't do bitwise dest clipping.  Use 32 and 33 now.
24	alphaBlend: sourceWord with: destinationWord.  32-bit source and dest only
25	pixPaint: sourceWord with: destinationWord.  Wherever the sourceForm is non-zero, it replaces the destination.  Can be used with a 1-bit source color mapped to (0, FFFFFFFF), and a fillColor to fill the dest with that color wherever the source is 1.
26	pixMask: sourceWord with: destinationWord.  Like pixPaint, but fills with 0.
27	rgbMax: sourceWord with: destinationWord.  Max of each color component.
28	rgbMin: sourceWord with: destinationWord.  Min of each color component.
29	rgbMin: sourceWord bitInvert32 with: destinationWord.  Min with (max-source)
30	alphaBlendConst: sourceWord with: destinationWord.  alpha is an arg. works in 16 bits.
31	alphaPaintConst: sourceWord with: destinationWord.  alpha is an arg. works in 16 bits.
32	rgbDiff: sourceWord with: destinationWord.  Sum of abs of differences in components
33	tallyIntoMap: destinationWord.  Tallies pixValues into a colorMap
34	alphaBlendScaled: srcWord with: dstWord. Alpha blend of scaled srcWord and destWord.
"
Class {
	#name : #BitBltExperiment,
	#superclass : #Object,
	#category : #'BookletGraphics-bitblt'
}

{ #category : #tests }
BitBltExperiment >> test1 [
<gtExample>

|initForm destForm blt|

initForm := (Form extent: 3@3 depth: 32)
 initFromArray: #( 16rffff0000 "red" 	 16rff000000 "black" 16rff0000ff "blue"
						 16rff000000 "black" 16rffffffff "white" 16rff000000 "black" 
						 16rff00ff00 "green" 16rff000000 "black" 16rffffff00 "yello").
						
destForm := Form extent: 3@3 depth: 32.
						
blt := BitBlt toForm: destForm .

blt
		sourceForm: initForm;
		destOrigin: 0@0;
		sourceOrigin: 0@0;
		halftoneForm: nil;
		combinationRule: 18;
		width: initForm width;
		height: initForm height;
		copyBits .
		
^destForm magnifyBy: 15
]

{ #category : #tests }
BitBltExperiment >> test2 [
<gtExample>

|initForm destForm halfForm blt|

initForm := (Form extent: 3@3 depth: 32)
 initFromArray: #( 16rffff0000 "red" 	 16rff000000 "black" 16rff0000ff "blue"
						 16rff000000 "black" 16rffffffff "white" 16rff000000 "black" 
						 16rff00ff00 "green" 16rff000000 "black" 16rffffff00 "yello").
						
halfForm := (Form extent: 3@3 depth: 32)
 initFromArray: #( 16rffffff00 	 16rffffff00  16rffffff00
						 16rffffff00 16rffffff00 16rffffff00 
						 16rffffff00  16rffffff00 16rffffff00 ).
						
destForm := Form extent: 3@3 depth: 32.
						
blt := BitBlt toForm: destForm .

blt
		sourceForm: initForm;
		destOrigin: 0@0;
		sourceOrigin: 0@0;
		halftoneForm: halfForm;
		combinationRule: 18;
		width: initForm width;
		height: initForm height;
		copyBits .
		
^destForm magnifyBy: 15
]
