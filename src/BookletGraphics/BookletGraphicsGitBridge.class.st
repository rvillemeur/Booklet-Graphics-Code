Class {
	#name : 'BookletGraphicsGitBridge',
	#superclass : 'GitBridge',
	#category : 'BookletGraphics-GitBridge',
	#package : 'BookletGraphics',
	#tag : 'GitBridge'
}

{ #category : 'class initialization' }
BookletGraphicsGitBridge class >> initialize [
<script: 'self initialize'>
	SessionManager default registerSystemClassNamed: self name
]
