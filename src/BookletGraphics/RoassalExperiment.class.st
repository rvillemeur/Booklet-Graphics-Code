Class {
	#name : 'RoassalExperiment',
	#superclass : 'Object',
	#category : 'BookletGraphics-roassal',
	#package : 'BookletGraphics',
	#tag : 'roassal'
}

{ #category : 'as yet unclassified' }
RoassalExperiment >> barAndLineChartExample [

	<bookExample>
	| c x y |
	x := 0.0 to: 2 count: 10.
	y := (x raisedTo: 2) - 2.
	c := RSCompositeChart new.

	c add: (RSBarPlot new x: x y: y).
	c add: (RSLinePlot new
			 x: x y: y;
			 color: Color red).

	c addDecoration: RSHorizontalTick new asFloat.
	c addDecoration: (RSVerticalTick new
			 numberOfTicks: 10;
			 asFloat).
	c xlabel: 'X Axis'.
	c ylabel: 'Y Axis'.
	c title: 'Bar char'.
	c build.
	^c canvas
]

{ #category : 'as yet unclassified' }
RoassalExperiment >> barChartExample1 [

	<bookExample>
	| c p p2 p3 p4 x y size |
	x := 0.0 to: 2 count: 10.
	y := (x raisedTo: 2) - 2.
	size := 4.

	c := RSCompositeChart new.
	c
		extent: 200 @ 200;
		addDecoration: (RSChartTitleDecoration new title: 'hello'; fontSize: 20);
		addDecoration: (RSXLabelDecoration new title: 'My X Axis'; fontSize: 10);
		addDecoration: (RSYLabelDecoration new title: 'My Y Axis'; fontSize: 10).

	p := RSBarPlot new
		     x: x y: #( 1 2 3 4 5 6 7 8 9 10 );
		     barSize: size;
		     color: Color red;
		     gapRatio: 0.5;
		     barOffset: size * -1.
	p2 := RSBarPlot new
		      x: x y: #( 2 4 6 8 10 12 14 16 18 20 );
		      barSize: size;
		      color: Color blue;
		      barOffset: size * 0.
	p3 := RSBarPlot new
		      x: x y: #( 3 6 9 12 15 18 21 24 27 30 );
		      barSize: size;
		      color: Color orange;
		      barOffset: size * 1.
	p4 := RSBarPlot new
		      x: x y: #( 4 8 12 16 20 24 28 32 36 40 );
		      barSize: size;
		      color: Color purple;
		      barOffset: size * 2.

	c
		addAll: {
				p.
				p2.
				p3.
				p4 };
		build.
	"p bars @ RSPopup."

	^ c canvas
]

{ #category : 'as yet unclassified' }
RoassalExperiment >> barChartExample2 [

	<bookExample>
	| c p p2 p3 p4 x y size |
	x := 1 to: 10.
	y := (x raisedTo: 2) - 2.
	size := 4.

	c := RSCompositeChart new.
	c
		extent: 200 @ 200;
		addDecoration: (RSChartTitleDecoration new title: 'hello'; fontSize: 20);
		removeHorizontalTicks;
		removeVerticalTicks;
		addDecoration: (RSHorizontalTick new fromNames: #( 1 2 3 4 5 6 7 8 9 10 ));
		addDecoration: RSVerticalTick new integer;
		ylabel: 'Scores';
		xlabel: 'data'.

	p := RSBarPlot new
		     x: x y: #( 1 2 3 4 5 6 7 8 9 10 );
		     barSize: size;
		     color: Color red;
		     gapRatio: 0.5;
		     barOffset: size * -1.
	p2 := RSBarPlot new
		      x: x y: #( 2 4 6 8 10 12 14 16 18 20 );
		      barSize: size;
		      color: Color blue;
		      barOffset: size * 0.
	p3 := RSBarPlot new
		      x: x y: #( 3 6 9 12 15 18 21 24 27 30 );
		      barSize: size;
		      color: Color orange;
		      barOffset: size * 1.
	p4 := RSBarPlot new
		      x: x y: #( 4 8 12 16 20 24 28 32 36 40 );
		      barSize: size;
		      color: Color purple;
		      barOffset: size * 2.

	c
		addAll: {
				p.
				p2.
				p3.
				p4 };
		build.
	"p bars @ RSPopup."

	^ c canvas
]

{ #category : 'as yet unclassified' }
RoassalExperiment >> barChartWithLegendExample [

	<bookExample>
	| c p p2 p3 p4 lb x y size |
	x := 1 to: 10.
	y := (x raisedTo: 2) - 2.
	size := 4.

	c := RSCompositeChart new.
	c
		extent: 300 @ 200;
		addDecoration: (RSChartTitleDecoration new title: 'sample bar chart'; fontSize: 20);
		removeHorizontalTicks;
		removeVerticalTicks;
		addDecoration: (RSHorizontalTick new fromNames: #( 1 2 3 4 5 6 7 8 9 10 ));
		addDecoration: RSVerticalTick new integer;
		"add it after decoration so their space is computed correctly"
		ylabel: 'Scores';
		xlabel: 'data'.

	p := RSBarPlot new
		     x: x y: #( 1 2 3 4 5 6 7 8 9 10 );
		     barSize: size;
		     color: Color red;
		     gapRatio: 0.5;
		     barOffset: size * -1.
	p2 := RSBarPlot new
		      x: x y: #( 2 4 6 8 10 12 14 16 18 20 );
		      barSize: size;
		      color: Color blue;
		      barOffset: size * 0.
	p3 := RSBarPlot new
		      x: x y: #( 3 6 9 12 15 18 21 24 27 30 );
		      barSize: size;
		      color: Color orange;
		      barOffset: size * 1.
	p4 := RSBarPlot new
		      x: x y: #( 4 8 12 16 20 24 28 32 36 40 );
		      barSize: size;
		      color: Color purple;
		      barOffset: size * 2.

	c
		addAll: {
				p.
				p2.
				p3.
				p4 };
		build.

	lb := RSLegend new.
	lb layout vertical.
	lb title: 'legend'.

	#( p1 p2 p3 p4 ) doWithIndex: [ :lbl :index |
		lb text: lbl withBoxColor: (c plots at: index) computeColor ].
	lb container: c canvas.
	lb location right middle offset: 20.
	lb build.

	"p bars @ RSPopup."

	^ c canvas
]

{ #category : 'as yet unclassified' }
RoassalExperiment >> franceSvgShape [
<bookExample>
|c svg svgPath|
svgPath := 'm 482.92875,298.0884 0.167,-0.049 0.283,-0.176 0.236,-0.056 0.135,0.135 0.076,0.077 0.148,0.304 0.042,0.316 0.066,0.263 0.12,0.106 0.451,0.035 0.333,0.097 0.088,0.088 0.114,0.582 0.062,0.082 0.083,-0.068 0.082,-0.096 0.114,-0.015 0.195,0.037 0.257,0.012 0.265,0.064 0.366,0.328 -0.014,0.108 -0.071,0.189 -0.025,0.151 0.063,0.061 0.097,0.156 -0.023,0.18 -0.094,0.126 -0.038,0.104 0,0.067 0.035,0.056 0.075,0.049 0.541,0.066 0.495,-0.066 0.312,-0.184 0.053,-0.194 0.088,-0.218 0.186,-0.184 0.128,-0.062 0.118,0.075 -0.198,0.769 0.145,0.196 0.021,0.292 0.052,0.256 0.177,-0.005 0.214,0.047 0.152,0.094 0.177,0.152 0.255,0.14 0.179,0.049 0.065,0.116 0.145,0.135 0.228,0.282 0.204,0.188 0.099,0 0.19,-0.074 0.282,-0.047 0.222,0.004 0.095,0.143 0.219,0.066 0.077,0.053 0.086,0.099 0.146,0.04 0.176,-0.04 0.128,-0.131 0.171,-0.06 0.172,0.02 0.099,0.072 0.188,0.107 0.106,-0.023 0.213,0.066 0.214,0.208 0.09,0.208 0.023,0.114 0.092,0.124 0.359,0.558 0.114,0.027 0.125,-0.084 0.081,-0.12 0.117,-0.024 0.188,0.056 0.121,0.063 0.058,0.241 0.041,0.046 0.081,-0.052 0.145,-0.011 0.232,0.059 0.318,-0.068 0.255,-0.101 0.13,0.004 0.21,0.281 0.24,0.105 0.528,0.085 0.567,0.132 0.223,0.107 0.152,0.053 0.016,0.371 -0.046,0.056 -0.565,0.742 -0.238,0.265 -0.121,0.377 -0.083,0.578 -0.167,0.547 -0.25,0.518 -0.091,0.388 0.068,0.258 -0.043,0.405 -0.153,0.551 -0.026,0.415 0.102,0.28 0.141,0.057 -0.339,0.188 -0.077,0.165 -0.133,0.217 -0.216,0.091 -0.217,0.03 -0.176,-0.028 -0.1,-0.087 0.005,-0.081 -0.093,-0.069 -0.231,0.002 -0.239,0.149 -0.191,0.244 0.059,0.136 0.176,0.036 0.046,0.054 0,0.07 -0.062,0.084 -0.074,0.144 -0.369,0.428 -0.372,0.431 -0.06,0.13 -0.118,0.091 -0.473,0.23 -0.049,0.092 -0.027,0.383 -0.053,0.314 -0.351,0.295 -0.349,0.293 -0.087,0.179 -0.063,0.207 -0.109,0.234 -0.022,0.124 0.177,0.201 -0.021,0.166 -0.056,0.236 -0.167,0.167 -0.186,0.095 0.004,0.256 0.099,0.036 0.224,-0.019 0.317,-0.186 0.207,-0.24 -0.122,-0.227 -0.015,-0.044 0.03,-0.054 0.245,-0.248 0.3,-0.149 0.419,-0.028 0.505,0.088 0.05,0.037 -0.024,0.152 0.047,0.224 0.091,0.157 -0.125,0.445 0.095,0.139 0.147,0.167 0.11,0.152 0.158,0.139 0.141,0.235 0.048,0.133 -0.226,0.23 -0.382,0.216 -0.043,0.139 0.005,0.157 0.043,0.124 0.211,0.159 0.227,0.359 0.144,0.32 0.315,0.306 0.077,0.091 -0.02,0.076 -0.083,0.13 -0.108,0.434 -0.129,0.068 -0.144,0.028 -0.39,0.317 -0.174,-0.039 -0.247,0.004 -0.181,0.104 0.02,0.197 0.159,0.18 0.093,0.196 0.038,0.204 0.176,0.151 0.248,0.09 0.142,0.006 0.092,0.054 0.056,0.07 0.107,0.436 -0.064,0.109 -0.134,0.046 -0.08,0.179 -0.159,0.263 -0.09,0.211 0.1,0.186 0.042,0.138 -0.053,0.142 0.071,0.22 0.188,0.218 0.511,0.306 0.475,0.249 0.147,0.041 0.642,-0.16 0.106,0.014 0.078,0.19 0.034,0.128 -0.072,0.192 -0.177,0.271 -0.188,0.211 -0.114,0.179 0.024,0.163 0.007,0.216 -0.153,0.064 -0.005,-0.042 -0.063,-0.037 -0.054,0.021 -0.042,0.047 -0.006,0.083 -0.326,0.138 -0.225,0.143 -0.889,0.852 -0.416,0.249 -0.082,0.15 -0.085,0.28 -0.244,0.24 -0.214,0.114 -0.529,0.117 -0.532,0.254 -0.24,-0.11 -0.62,0.012 -0.387,-0.306 -0.744,-0.194 -0.242,-0.447 -0.339,-0.029 -0.222,0.014 -0.133,-0.068 -0.034,-0.153 -0.003,-0.147 -0.235,0.068 -0.18,0 -0.107,0.059 -0.084,0.068 -0.1,-0.043 -0.058,0.015 0.005,0.086 -0.216,0.022 -0.235,-0.053 -0.615,-0.231 -0.094,-0.036 -0.427,-0.089 -0.172,-0.093 -0.14,-0.229 -0.106,-0.072 -0.063,-0.043 -0.398,0.116 -0.138,0.18 -0.215,0.211 -1.476,1.032 -0.27,0.431 -0.312,0.633 -0.024,0.295 0.134,0.94 0.3,0.492 0.038,0.114 -0.167,10e-4 -0.279,-0.062 -0.231,-0.076 -0.221,0.042 -0.212,0.102 -0.186,0.062 -0.134,0.017 -0.089,0.059 -0.043,0.117 -0.008,0.082 -0.235,-0.02 -0.543,-0.168 -0.488,-0.116 -0.287,0.132 -0.184,0.123 -0.129,-0.019 -0.099,-0.13 -0.066,-0.127 -0.191,-0.117 -0.432,-0.175 0.022,-0.084 0.074,-0.118 -0.002,-0.073 -0.083,-0.108 -0.398,-0.116 -0.188,-0.029 -0.119,0.08 -0.086,0.098 -0.221,-0.36 -0.158,-0.074 -0.238,-0.012 -0.273,-0.11 -0.284,-0.141 -0.689,-0.225 -0.189,-0.027 -0.076,0.036 -0.051,0.135 -0.027,0.38 -0.029,0.042 -0.32,0.013 -0.394,-0.053 -0.181,0.026 -0.161,10e-4 -0.152,-0.101 -0.681,0.115 -0.113,-0.056 -0.164,-0.171 -0.184,-0.139 -0.142,-0.071 -0.122,-0.082 -0.11,-0.013 -0.168,0.079 -0.232,0.034 -0.192,-0.01 -0.103,0.011 -0.432,-0.422 -0.063,-0.115 -0.215,-0.032 -0.266,-0.005 -0.678,-0.274 -0.309,-0.147 -0.045,-0.088 0.004,-0.071 -0.053,0.016 -0.095,0.125 -0.05,0.102 -0.066,0.019 -0.097,-0.016 -0.09,-0.058 -0.055,-0.074 0.059,-0.129 0.104,-0.169 0.043,-0.184 -0.01,-0.165 -0.171,-0.106 -0.252,-0.044 -0.185,-0.013 -0.24,-0.094 -0.114,-0.068 -0.11,-0.184 -0.004,-0.134 0.457,-0.118 0.411,-0.485 0.39,-1.768 0.282,-2.109 0.209,-0.4 0.264,-0.11 -0.213,-0.292 -0.133,0.148 -0.056,0.157 -0.07,0.079 0.157,-1.955 0.112,-0.72 0.191,-0.756 0.391,0.3 0.324,0.305 0.167,0.264 0.212,0.876 0.161,0.184 0.24,0.184 -0.095,-0.201 -0.165,-0.154 -0.258,-1.169 -0.162,-0.333 -0.252,-0.28 -0.812,-0.591 -0.073,-0.115 -0.04,-0.226 0.269,0.01 0.232,0.11 -0.027,-0.126 -0.069,-0.132 -0.108,-0.481 -0.09,-1.127 0.012,-0.193 -0.04,-0.238 -0.26,-0.053 -0.208,-0.009 -0.224,-0.094 -1.106,-0.668 -0.378,-0.692 -0.387,-0.512 -0.093,-0.224 0.006,-0.227 0.201,-0.48 -0.177,-0.304 -0.173,-0.06 -0.15,-0.151 0.136,-0.251 0.113,-0.161 0.227,-0.043 0.297,0.053 0.282,0.146 0.221,0.039 -0.653,-0.391 -1.06,0.132 -0.229,-0.05 -0.192,-0.087 -0.076,-0.288 0.151,-0.129 0.136,-0.24 -0.154,-0.168 -0.2,-0.064 -0.314,0.003 -0.293,0.051 -0.074,-0.097 0.179,-0.268 -0.152,-0.098 -0.203,0.046 -0.294,0.055 -0.281,-0.084 -0.266,-0.305 -0.176,0.002 -0.121,0.038 -0.179,-0.118 -0.189,-0.029 -0.135,0.039 -0.179,-0.175 -1.104,-0.352 -0.476,-0.043 -0.437,0.159 -0.241,-0.055 -0.177,-0.228 -0.148,-0.382 -0.704,-0.295 0.139,-0.194 0.328,-0.046 0.377,-0.134 0.136,-0.173 -0.295,-0.201 -0.218,-0.05 -0.09,-0.072 -0.092,-0.181 0.13,-0.083 0.092,0.044 0.266,0.026 0.454,-0.044 -0.169,-0.183 -0.176,-0.041 -0.081,-0.046 -0.37,-0.02 -0.168,0.063 -0.378,-0.024 -0.082,-0.197 -0.04,-0.17 0.117,-0.378 0.532,-0.339 1.326,-0.371 0.57,0.054 0.395,-0.067 0.474,-0.234 0.209,-0.201 0.674,-0.118 0.64,0.213 0.59,0.804 0.282,0.272 0.691,-0.472 1.029,0.014 0.212,0.266 0.086,-0.224 0.189,-0.263 0.151,0.12 0.077,0.163 1.086,-0.046 0.171,-0.047 -0.292,-0.191 -0.238,-0.458 -0.05,-1.693 -0.301,-0.475 -0.345,-0.761 -0.159,-0.453 -0.015,-0.157 0.053,-0.227 0.424,0.012 0.328,0.058 0.625,-0.171 0.3,0.117 -0.018,0.354 0.092,0.446 0.104,0.216 0.159,0.245 0.503,-0.022 0.543,0.144 0.687,0.022 1.003,0.248 0.427,-0.144 0.414,-0.307 0.788,-0.202 0.063,-0.106 -0.454,0.042 -0.416,-0.195 -0.056,-0.211 0.048,-0.19 0.169,-0.438 1.206,-0.693 0.864,-0.205 0.902,-0.383 0.454,-0.393 0.3,-0.509 0.097,-0.112 0.125,-0.094 -0.116,-0.183 0.078,-1.96 0.084,-0.355 0.176,-0.291 0.268,-0.225 0.406,-0.244 1.497,-0.337 0.222,-0.137 0.031,0.212 0.109,0.271 0.075,0.148 -0.063,0.193 0.049,0.159 0.203,0.286 0.253,0.269 0.226,0.172 0.069,-0.026 z m -11.34,20.266 -0.099,0.352 -0.188,-0.324 -0.248,-0.284 -0.057,-0.263 0,-0.07 0.291,0.192 0.301,0.397 z m 29.913,12.125 -0.073,0.559 0.053,0.163 0.102,0.114 0.047,0.125 0.085,1.482 -0.016,0.118 -0.343,0.593 -0.077,0.173 -0.017,0.732 -0.058,0.196 -0.122,0.193 -0.217,0.624 -0.188,0.28 -0.514,-0.342 -0.303,-0.148 -0.148,-0.159 -0.097,-0.11 0.063,-0.147 0.138,-0.153 0.022,-0.121 -0.325,-0.136 -0.149,-0.091 0.002,-0.16 0.112,-0.249 -0.051,-0.206 -0.188,0.01 -0.146,-0.031 -0.019,-0.107 0.107,-0.137 0.138,-0.179 -0.004,-0.198 -0.167,-0.085 -0.151,-0.161 -0.061,-0.219 0.117,-0.15 0.19,-0.096 -0.14,-0.225 -0.094,-0.005 -0.075,-0.049 0.062,-0.104 0.147,-0.156 0.205,-0.467 0.285,-0.221 0.506,-0.142 0.137,-0.063 0.125,-0.165 0.139,-0.106 0.169,0.014 0.156,0.063 0.096,0.068 0.072,-0.071 0.07,-0.205 -0.043,-0.18 0.022,-0.495 0.09,-0.281 0.146,-0.016 0.134,0.155 -0.006,0.137 0.05,0.324 0.005,0.213 z'.

c := RSCanvas new.
svg := RSSVGPath new svgPath: svgPath ; color: Color blue.
c addShape: svg.
c@RSCanvasController.
^c.
]

{ #category : 'as yet unclassified' }
RoassalExperiment >> highLightBoxes [

	<bookExample>
	| canvas box label interactionForLines interactionForNodes |
	canvas := RSCanvas new.

	($A to: $Z) do: [ :each |
		box := RSBox new.
		label := RSLabel new text: each.
		box position: label position.
		box extent: label extent + 5.
		box borderColor: 'black'.
		box cornerRadius: 2.
		canvas add: ({
				 box.
				 label } asShapeFor: each) ].
	RSLineBuilder arrowedLine
		withBorderAttachPoint;
		canvas: canvas;
		useAssociations: {
				($M -> $I).
				($I -> $L).
				($L -> $T).
				($T -> $O).
				($O -> $N) }.
	interactionForLines := RSHighlightable red.
	interactionForLines highlightShapes: [ :composite |
		composite connectedLines ].

	interactionForNodes := RSHighlightable red.
	interactionForNodes highlightShapes: [ :composite |
		Array with: composite children first "box" ].

	canvas nodes @ interactionForLines @ interactionForNodes.

	canvas @ RSForceLayoutSteppingInteraction.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : 'as yet unclassified' }
RoassalExperiment >> lineChartExample1 [
	<bookExample>
	| c p p2 p3 p4 x y |
	x := 0.0 to: 2 count: 10.
	y := (x raisedTo: 2) - 2.
	
	c := RSCompositeChart  new.
	c extent: 200@200.
	c addDecoration: (RSChartTitleDecoration new title: 'hello'; fontSize: 20).
	c addDecoration: (RSXLabelDecoration new title: 'My X Axis'; fontSize: 10).
	c addDecoration: (RSYLabelDecoration new title: 'My Y Axis'; fontSize: 10).
	
	p := RSLinePlot  new x: x y: #(1 2 3 4 5 6 7 8 9 10); color: Color red.
	p2 := RSLinePlot new x: x y: #(2 4 6 8 10 12 14 16 18 20); color: Color blue.
	p3 := RSLinePlot new x: x y: #(3 6 9 12 15 18 21 24 27 30); color: Color orange.
	p4 := RSLinePlot new x: x y: #(4 8 12 16 20 24 28 32 36 40); color: Color purple.
	
	c addAll: {p. p2. p3 .p4}; build.
	"p bars @ RSPopup."

	^ c canvas
]

{ #category : 'as yet unclassified' }
RoassalExperiment >> stackedBar [

	<bookExample>
	| c menMeans womenMeans lb |
	menMeans := #( 20 35 30 35 27 ).
	womenMeans := #( 25 32 34 20 25 ).

	c := RSCompositeChart new.
	c
		extent: 300 @ 200;
		removeHorizontalTicks;
		removeVerticalTicks;
		addDecoration: (RSHorizontalTick new fromNames: #( Day1 Day2 Day3 Day4 Day5 ));
		addDecoration: RSVerticalTick new integer;
		ylabel: 'Scores';
		title: 'Mens vs Women comparison';
		add: (RSBarPlot new x: (1 to: menMeans size) y: menMeans);
		add: (RSBarPlot new x: (1 to: womenMeans size) y: womenMeans; bottom: menMeans);
		build.

	lb := RSLegend new.
	lb layout horizontal.
	#( Men Women ) doWithIndex: [ :lbl :index |
		lb text: lbl withBoxColor: (c plots at: index) computeColor ].
	lb container: c canvas.
	lb build.
	^ c canvas
]

{ #category : 'as yet unclassified' }
RoassalExperiment >> svgShape [

	<bookExample>
	| c svg |
	c := RSCanvas new.
	svg := RSSVGPath new
		       svgPath: 'M 100 350 q 150 -300 300 0';
		       yourself.
	c addShape: svg.
	c @ RSCanvasController.
	^ c
]

{ #category : 'as yet unclassified' }
RoassalExperiment >> twoBoxes [

	<bookExample>
	| c blueBox redBox |
	c := RSCanvas new.
	blueBox := RSBox new
		           size: 80;
		           color: #blue.
	redBox := RSBox new
		          size: 80;
		          color: #red.
	c
		add: blueBox;
		add: redBox.
	blueBox translateBy: 40 @ 20.
	^ c
]
