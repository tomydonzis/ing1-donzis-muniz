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

!I class methodsFor: 'next' stamp: 'TD 8/30/2022 00:05:15'!
next

	^II! !


!I class methodsFor: 'operations' stamp: 'TD 8/30/2022 00:04:22'!
* aMultiplier

	^aMultiplier.! !

!I class methodsFor: 'operations' stamp: 'TD 8/30/2022 00:04:29'!
+ anAdder

	^anAdder next! !

!I class methodsFor: 'operations' stamp: 'TD 8/30/2022 00:17:59'!
- subtrahend

	^self error: 'negativeNumbersNotSupportedErrorDescription'! !

!I class methodsFor: 'operations' stamp: 'TD 8/30/2022 00:14:43'!
/ aDivisor
	aDivisor = I ifTrue: [^self].

	^self error: 'canNotDivideByBiggerNumberErrorDescription'.! !


!I class methodsFor: 'order' stamp: 'TD 8/30/2022 00:05:01'!
< aComparer

	^aComparer isNotEqualTo: I.! !

!I class methodsFor: 'order' stamp: 'TD 8/30/2022 00:05:05'!
> aComparer

	^aComparer < self.! !


!I class methodsFor: 'auxiliary methods' stamp: 'TD 8/30/2022 00:05:10'!
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

!II class methodsFor: 'next & previous' stamp: 'TD 8/30/2022 00:03:17'!
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

!II class methodsFor: 'next & previous' stamp: 'TD 8/30/2022 00:05:33'!
next
	next ifNil:[
		next _ II createChildNamed: self nameOfNext.
		next previous: self.
		].
	
	^next! !

!II class methodsFor: 'next & previous' stamp: 'TD 8/30/2022 00:05:39'!
previous

	^previous! !

!II class methodsFor: 'next & previous' stamp: 'TD 8/30/2022 00:05:45'!
previous: aNumber

	previous := aNumber! !


!II class methodsFor: 'remove all next' stamp: 'TD 8/30/2022 00:06:00'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!II class methodsFor: 'operations' stamp: 'TD 8/30/2022 00:06:05'!
* aMultiplier 

	^(aMultiplier + (self previous * aMultiplier)).! !

!II class methodsFor: 'operations' stamp: 'TD 8/30/2022 00:06:09'!
+ anAdder 

	^self previous + anAdder next! !

!II class methodsFor: 'operations' stamp: 'TD 8/30/2022 00:06:14'!
- subtrahend 

	^subtrahend subtractFrom: self! !

!II class methodsFor: 'operations' stamp: 'TD 8/30/2022 00:18:07'!
/ aDivisor
	
	(self < aDivisor) and: [^self error: 'canNotDivideByBiggerNumberErrorDescription'].

	((self > aDivisor) not or: [self - aDivisor < aDivisor]) and: [^I].
	
	^I + (self - aDivisor / aDivisor).! !


!II class methodsFor: 'order' stamp: 'TD 8/30/2022 00:06:27'!
< aComparer

	^(aComparer isNotEqualTo: I) and: [self previous < aComparer previous].! !

!II class methodsFor: 'order' stamp: 'TD 8/30/2022 00:06:30'!
> aComparer

	^aComparer < self.! !


!II class methodsFor: 'auxiliary methods' stamp: 'TD 8/30/2022 00:06:36'!
subtractFrom: aMinuend

	^aMinuend previous - self previous.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/30/2022 00:20:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := I.
	next := III.! !


!classDefinition: #III category: 'NaturalNumbers'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'NaturalNumbers'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/30/2022 00:20:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := II.
	next := IV.! !


!classDefinition: #IV category: 'NaturalNumbers'!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: 'NaturalNumbers'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/30/2022 00:20:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := III.
	next := nil.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!