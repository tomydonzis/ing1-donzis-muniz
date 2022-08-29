!classDefinition: #I category: 'NaturalNumbers'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'NaturalNumbers'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'next' stamp: 'ARM 8/25/2022 20:43:03'!
next
	^II! !


!I class methodsFor: 'operations' stamp: 'TD 8/28/2022 23:03:15'!
* aMultiplier
	^aMultiplier.! !

!I class methodsFor: 'operations' stamp: 'ARM 8/25/2022 21:12:30'!
+ anAdder

	^anAdder next! !

!I class methodsFor: 'operations' stamp: 'ARM 8/25/2022 21:55:45'!
- subtrahend

	self error: 'subtrahend can not be greater than minuend'! !

!I class methodsFor: 'operations' stamp: 'TD 8/28/2022 23:24:05'!
/ aDivisor 
	aDivisor = I ifTrue:[^self].
	
	^self error: 'Dividend should be greater than divisor'.! !


!I class methodsFor: 'order' stamp: 'TD 8/28/2022 23:46:27'!
< aComparer
	^aComparer isNotEqualTo: I.! !

!I class methodsFor: 'order' stamp: 'TD 8/28/2022 23:55:11'!
> aComparer
	^aComparer < self.! !


!classDefinition: #II category: 'NaturalNumbers'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'NaturalNumbers'!
II class
	instanceVariableNames: 'previous next'!

!II class methodsFor: 'next & previous' stamp: 'ARM 8/25/2022 21:23:42'!
next
	next ifNil:[
		next _ II createChildNamed: self name , 'I'.
		next previous: self.
		].
	^next! !

!II class methodsFor: 'next & previous' stamp: 'ARM 8/25/2022 21:21:12'!
previous

	^previous! !

!II class methodsFor: 'next & previous' stamp: 'ARM 8/25/2022 21:25:57'!
previous: aNumber 

	previous := aNumber! !


!II class methodsFor: 'remove all next' stamp: 'ARM 8/25/2022 21:37:56'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!II class methodsFor: 'operations' stamp: 'TD 8/28/2022 23:05:34'!
* aMultiplier 
	^(aMultiplier + (self previous * aMultiplier)).! !

!II class methodsFor: 'operations' stamp: 'ARM 8/25/2022 21:19:09'!
+ anAdder 

	^self previous + anAdder next! !

!II class methodsFor: 'operations' stamp: 'TD 8/28/2022 23:41:39'!
- subtrahend 
	
	subtrahend = I and:[^self previous].
	
	^self previous - subtrahend previous! !


!II class methodsFor: 'order' stamp: 'TD 8/28/2022 23:53:01'!
< aComparer
	^(aComparer isNotEqualTo: I) and: [self previous < aComparer previous].! !

!II class methodsFor: 'order' stamp: 'TD 8/28/2022 23:54:32'!
> aComparer
	^aComparer < self.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 00:06:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := I.
	next := nil.! !

II initializeAfterFileIn!