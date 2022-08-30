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


!I class methodsFor: 'auxiliary methods' stamp: 'TD 8/29/2022 20:53:40'!
subtractFrom: aMinuend
	^aMinuend previous.! !


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

!II class methodsFor: 'next & previous' stamp: 'TD 8/29/2022 21:35:47'!
nameOfNext
	(self name endsWith:'CMDCCCCIX') ifTrue: [^(self name withoutSuffix:'CMDCCCCIX'), 'M'].
	(self name endsWith:'DCCCXCIX') ifTrue: [^(self name withoutSuffix:'DCCCXCIX'), 'CM'].
	(self name endsWith:'CDXCIX') ifTrue: [^(self name withoutSuffix:'CDXCIX'), 'D'].
	(self name endsWith:'CCCXCIX') ifTrue: [^(self name withoutSuffix:'CCCXCIX'), 'CD'].
	(self name endsWith:'XCIX') ifTrue: [^(self name withoutSuffix:'XCIX'), 'C'].
	(self name endsWith:'LXXXIX') ifTrue: [^(self name withoutSuffix:'LXXXIX'), 'XC'].
	(self name endsWith:'XLIX') ifTrue: [^(self name withoutSuffix:'XLIX'), 'L'].
	(self name endsWith:'XXXIX') ifTrue: [^(self name withoutSuffix:'XXXIX'), 'XL'].
	(self name endsWith:'VIII') ifTrue: [^(self name withoutSuffix:'VIII'), 'IX'].
	(self name endsWith:'IX') ifTrue: [^(self name withoutSuffix:'IX'), 'X'].
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix:'III') , 'IV'].
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix:'IV'), 'V'].
	^self name , 'I'.! !

!II class methodsFor: 'next & previous' stamp: 'TD 8/29/2022 21:17:34'!
next
	next ifNil:[
		next _ II createChildNamed: self nameOfNext.
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


!II class methodsFor: 'operations' stamp: 'TD 8/29/2022 21:10:54'!
* aMultiplier 
	^(aMultiplier + (self previous * aMultiplier)).! !

!II class methodsFor: 'operations' stamp: 'ARM 8/25/2022 21:19:09'!
+ anAdder 

	^self previous + anAdder next! !

!II class methodsFor: 'operations' stamp: 'TD 8/29/2022 20:52:06'!
- subtrahend 
	
	^subtrahend subtractFrom: self! !

!II class methodsFor: 'operations' stamp: 'TD 8/29/2022 19:07:33'!
/ aDivisor
	((self > aDivisor) not or: [self - aDivisor < aDivisor]) and: [^I].
	
	^I + (self - aDivisor / aDivisor).! !


!II class methodsFor: 'order' stamp: 'TD 8/29/2022 18:02:02'!
< aComparer
	^(aComparer isNotEqualTo: I) and: [self previous < aComparer previous].! !

!II class methodsFor: 'order' stamp: 'TD 8/28/2022 23:54:32'!
> aComparer
	^aComparer < self.! !


!II class methodsFor: 'auxiliary methods' stamp: 'TD 8/29/2022 20:52:15'!
subtractFrom: aMinuend
	^aMinuend previous - self previous.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := I.
	next := III.! !

		
II initializeAfterFileIn!
