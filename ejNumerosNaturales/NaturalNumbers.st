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


!classDefinition: #C category: 'NaturalNumbers'!
II subclass: #C
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'C class' category: 'NaturalNumbers'!
C class
	instanceVariableNames: ''!

!C class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XCIX.
	next := CI.! !


!classDefinition: #CC category: 'NaturalNumbers'!
II subclass: #CC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CC class' category: 'NaturalNumbers'!
CC class
	instanceVariableNames: ''!

!CC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXCIX.
	next := CCI.! !


!classDefinition: #CCC category: 'NaturalNumbers'!
II subclass: #CCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCC class' category: 'NaturalNumbers'!
CCC class
	instanceVariableNames: ''!

!CCC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXCIX.
	next := CCCI.! !


!classDefinition: #CCCI category: 'NaturalNumbers'!
II subclass: #CCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCI class' category: 'NaturalNumbers'!
CCCI class
	instanceVariableNames: ''!

!CCCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCC.
	next := CCCII.! !


!classDefinition: #CCCII category: 'NaturalNumbers'!
II subclass: #CCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCII class' category: 'NaturalNumbers'!
CCCII class
	instanceVariableNames: ''!

!CCCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCI.
	next := CCCIII.! !


!classDefinition: #CCCIII category: 'NaturalNumbers'!
II subclass: #CCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIII class' category: 'NaturalNumbers'!
CCCIII class
	instanceVariableNames: ''!

!CCCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCII.
	next := CCCIV.! !


!classDefinition: #CCCIV category: 'NaturalNumbers'!
II subclass: #CCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIV class' category: 'NaturalNumbers'!
CCCIV class
	instanceVariableNames: ''!

!CCCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCIII.
	next := CCCV.! !


!classDefinition: #CCCIX category: 'NaturalNumbers'!
II subclass: #CCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIX class' category: 'NaturalNumbers'!
CCCIX class
	instanceVariableNames: ''!

!CCCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCVIII.
	next := CCCX.! !


!classDefinition: #CCCL category: 'NaturalNumbers'!
II subclass: #CCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCL class' category: 'NaturalNumbers'!
CCCL class
	instanceVariableNames: ''!

!CCCL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXLIX.
	next := CCCLI.! !


!classDefinition: #CCCLI category: 'NaturalNumbers'!
II subclass: #CCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLI class' category: 'NaturalNumbers'!
CCCLI class
	instanceVariableNames: ''!

!CCCLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCL.
	next := CCCLII.! !


!classDefinition: #CCCLII category: 'NaturalNumbers'!
II subclass: #CCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLII class' category: 'NaturalNumbers'!
CCCLII class
	instanceVariableNames: ''!

!CCCLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLI.
	next := CCCLIII.! !


!classDefinition: #CCCLIII category: 'NaturalNumbers'!
II subclass: #CCCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIII class' category: 'NaturalNumbers'!
CCCLIII class
	instanceVariableNames: ''!

!CCCLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLII.
	next := CCCLIV.! !


!classDefinition: #CCCLIV category: 'NaturalNumbers'!
II subclass: #CCCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIV class' category: 'NaturalNumbers'!
CCCLIV class
	instanceVariableNames: ''!

!CCCLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLIII.
	next := CCCLV.! !


!classDefinition: #CCCLIX category: 'NaturalNumbers'!
II subclass: #CCCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIX class' category: 'NaturalNumbers'!
CCCLIX class
	instanceVariableNames: ''!

!CCCLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLVIII.
	next := CCCLX.! !


!classDefinition: #CCCLV category: 'NaturalNumbers'!
II subclass: #CCCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLV class' category: 'NaturalNumbers'!
CCCLV class
	instanceVariableNames: ''!

!CCCLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLIV.
	next := CCCLVI.! !


!classDefinition: #CCCLVI category: 'NaturalNumbers'!
II subclass: #CCCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVI class' category: 'NaturalNumbers'!
CCCLVI class
	instanceVariableNames: ''!

!CCCLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLV.
	next := CCCLVII.! !


!classDefinition: #CCCLVII category: 'NaturalNumbers'!
II subclass: #CCCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVII class' category: 'NaturalNumbers'!
CCCLVII class
	instanceVariableNames: ''!

!CCCLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLVI.
	next := CCCLVIII.! !


!classDefinition: #CCCLVIII category: 'NaturalNumbers'!
II subclass: #CCCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVIII class' category: 'NaturalNumbers'!
CCCLVIII class
	instanceVariableNames: ''!

!CCCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLVII.
	next := CCCLIX.! !


!classDefinition: #CCCLX category: 'NaturalNumbers'!
II subclass: #CCCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLX class' category: 'NaturalNumbers'!
CCCLX class
	instanceVariableNames: ''!

!CCCLX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLIX.
	next := CCCLXI.! !


!classDefinition: #CCCLXI category: 'NaturalNumbers'!
II subclass: #CCCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXI class' category: 'NaturalNumbers'!
CCCLXI class
	instanceVariableNames: ''!

!CCCLXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLX.
	next := CCCLXII.! !


!classDefinition: #CCCLXII category: 'NaturalNumbers'!
II subclass: #CCCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXII class' category: 'NaturalNumbers'!
CCCLXII class
	instanceVariableNames: ''!

!CCCLXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXI.
	next := CCCLXIII.! !


!classDefinition: #CCCLXIII category: 'NaturalNumbers'!
II subclass: #CCCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIII class' category: 'NaturalNumbers'!
CCCLXIII class
	instanceVariableNames: ''!

!CCCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXII.
	next := CCCLXIV.! !


!classDefinition: #CCCLXIV category: 'NaturalNumbers'!
II subclass: #CCCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIV class' category: 'NaturalNumbers'!
CCCLXIV class
	instanceVariableNames: ''!

!CCCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXIII.
	next := CCCLXV.! !


!classDefinition: #CCCLXIX category: 'NaturalNumbers'!
II subclass: #CCCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIX class' category: 'NaturalNumbers'!
CCCLXIX class
	instanceVariableNames: ''!

!CCCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXVIII.
	next := CCCLXX.! !


!classDefinition: #CCCLXV category: 'NaturalNumbers'!
II subclass: #CCCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXV class' category: 'NaturalNumbers'!
CCCLXV class
	instanceVariableNames: ''!

!CCCLXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXIV.
	next := CCCLXVI.! !


!classDefinition: #CCCLXVI category: 'NaturalNumbers'!
II subclass: #CCCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVI class' category: 'NaturalNumbers'!
CCCLXVI class
	instanceVariableNames: ''!

!CCCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXV.
	next := CCCLXVII.! !


!classDefinition: #CCCLXVII category: 'NaturalNumbers'!
II subclass: #CCCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVII class' category: 'NaturalNumbers'!
CCCLXVII class
	instanceVariableNames: ''!

!CCCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXVI.
	next := CCCLXVIII.! !


!classDefinition: #CCCLXVIII category: 'NaturalNumbers'!
II subclass: #CCCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVIII class' category: 'NaturalNumbers'!
CCCLXVIII class
	instanceVariableNames: ''!

!CCCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXVII.
	next := CCCLXIX.! !


!classDefinition: #CCCLXX category: 'NaturalNumbers'!
II subclass: #CCCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXX class' category: 'NaturalNumbers'!
CCCLXX class
	instanceVariableNames: ''!

!CCCLXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXIX.
	next := CCCLXXI.! !


!classDefinition: #CCCLXXI category: 'NaturalNumbers'!
II subclass: #CCCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXI class' category: 'NaturalNumbers'!
CCCLXXI class
	instanceVariableNames: ''!

!CCCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXX.
	next := CCCLXXII.! !


!classDefinition: #CCCLXXII category: 'NaturalNumbers'!
II subclass: #CCCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXII class' category: 'NaturalNumbers'!
CCCLXXII class
	instanceVariableNames: ''!

!CCCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXI.
	next := CCCLXXIII.! !


!classDefinition: #CCCLXXIII category: 'NaturalNumbers'!
II subclass: #CCCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIII class' category: 'NaturalNumbers'!
CCCLXXIII class
	instanceVariableNames: ''!

!CCCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXII.
	next := CCCLXXIV.! !


!classDefinition: #CCCLXXIV category: 'NaturalNumbers'!
II subclass: #CCCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIV class' category: 'NaturalNumbers'!
CCCLXXIV class
	instanceVariableNames: ''!

!CCCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXIII.
	next := CCCLXXV.! !


!classDefinition: #CCCLXXIX category: 'NaturalNumbers'!
II subclass: #CCCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIX class' category: 'NaturalNumbers'!
CCCLXXIX class
	instanceVariableNames: ''!

!CCCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXVIII.
	next := CCCLXXX.! !


!classDefinition: #CCCLXXV category: 'NaturalNumbers'!
II subclass: #CCCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXV class' category: 'NaturalNumbers'!
CCCLXXV class
	instanceVariableNames: ''!

!CCCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXIV.
	next := CCCLXXVI.! !


!classDefinition: #CCCLXXVI category: 'NaturalNumbers'!
II subclass: #CCCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVI class' category: 'NaturalNumbers'!
CCCLXXVI class
	instanceVariableNames: ''!

!CCCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXV.
	next := CCCLXXVII.! !


!classDefinition: #CCCLXXVII category: 'NaturalNumbers'!
II subclass: #CCCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVII class' category: 'NaturalNumbers'!
CCCLXXVII class
	instanceVariableNames: ''!

!CCCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXVI.
	next := CCCLXXVIII.! !


!classDefinition: #CCCLXXVIII category: 'NaturalNumbers'!
II subclass: #CCCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVIII class' category: 'NaturalNumbers'!
CCCLXXVIII class
	instanceVariableNames: ''!

!CCCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXVII.
	next := CCCLXXIX.! !


!classDefinition: #CCCLXXX category: 'NaturalNumbers'!
II subclass: #CCCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXX class' category: 'NaturalNumbers'!
CCCLXXX class
	instanceVariableNames: ''!

!CCCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXIX.
	next := CCCLXXXI.! !


!classDefinition: #CCCLXXXI category: 'NaturalNumbers'!
II subclass: #CCCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXI class' category: 'NaturalNumbers'!
CCCLXXXI class
	instanceVariableNames: ''!

!CCCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXX.
	next := CCCLXXXII.! !


!classDefinition: #CCCLXXXII category: 'NaturalNumbers'!
II subclass: #CCCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXII class' category: 'NaturalNumbers'!
CCCLXXXII class
	instanceVariableNames: ''!

!CCCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXXI.
	next := CCCLXXXIII.! !


!classDefinition: #CCCLXXXIII category: 'NaturalNumbers'!
II subclass: #CCCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIII class' category: 'NaturalNumbers'!
CCCLXXXIII class
	instanceVariableNames: ''!

!CCCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXXII.
	next := CCCLXXXIV.! !


!classDefinition: #CCCLXXXIV category: 'NaturalNumbers'!
II subclass: #CCCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIV class' category: 'NaturalNumbers'!
CCCLXXXIV class
	instanceVariableNames: ''!

!CCCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXXIII.
	next := CCCLXXXV.! !


!classDefinition: #CCCLXXXIX category: 'NaturalNumbers'!
II subclass: #CCCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIX class' category: 'NaturalNumbers'!
CCCLXXXIX class
	instanceVariableNames: ''!

!CCCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXXVIII.
	next := CCCXC.! !


!classDefinition: #CCCLXXXV category: 'NaturalNumbers'!
II subclass: #CCCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXV class' category: 'NaturalNumbers'!
CCCLXXXV class
	instanceVariableNames: ''!

!CCCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXXIV.
	next := CCCLXXXVI.! !


!classDefinition: #CCCLXXXVI category: 'NaturalNumbers'!
II subclass: #CCCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVI class' category: 'NaturalNumbers'!
CCCLXXXVI class
	instanceVariableNames: ''!

!CCCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXXV.
	next := CCCLXXXVII.! !


!classDefinition: #CCCLXXXVII category: 'NaturalNumbers'!
II subclass: #CCCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVII class' category: 'NaturalNumbers'!
CCCLXXXVII class
	instanceVariableNames: ''!

!CCCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXXVI.
	next := CCCLXXXVIII.! !


!classDefinition: #CCCLXXXVIII category: 'NaturalNumbers'!
II subclass: #CCCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVIII class' category: 'NaturalNumbers'!
CCCLXXXVIII class
	instanceVariableNames: ''!

!CCCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXXVII.
	next := CCCLXXXIX.! !


!classDefinition: #CCCV category: 'NaturalNumbers'!
II subclass: #CCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCV class' category: 'NaturalNumbers'!
CCCV class
	instanceVariableNames: ''!

!CCCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCIV.
	next := CCCVI.! !


!classDefinition: #CCCVI category: 'NaturalNumbers'!
II subclass: #CCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVI class' category: 'NaturalNumbers'!
CCCVI class
	instanceVariableNames: ''!

!CCCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCV.
	next := CCCVII.! !


!classDefinition: #CCCVII category: 'NaturalNumbers'!
II subclass: #CCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVII class' category: 'NaturalNumbers'!
CCCVII class
	instanceVariableNames: ''!

!CCCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCVI.
	next := CCCVIII.! !


!classDefinition: #CCCVIII category: 'NaturalNumbers'!
II subclass: #CCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVIII class' category: 'NaturalNumbers'!
CCCVIII class
	instanceVariableNames: ''!

!CCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCVII.
	next := CCCIX.! !


!classDefinition: #CCCX category: 'NaturalNumbers'!
II subclass: #CCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCX class' category: 'NaturalNumbers'!
CCCX class
	instanceVariableNames: ''!

!CCCX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCIX.
	next := CCCXI.! !


!classDefinition: #CCCXC category: 'NaturalNumbers'!
II subclass: #CCCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXC class' category: 'NaturalNumbers'!
CCCXC class
	instanceVariableNames: ''!

!CCCXC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCLXXXIX.
	next := CCCXCI.! !


!classDefinition: #CCCXCI category: 'NaturalNumbers'!
II subclass: #CCCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCI class' category: 'NaturalNumbers'!
CCCXCI class
	instanceVariableNames: ''!

!CCCXCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXC.
	next := CCCXCII.! !


!classDefinition: #CCCXCII category: 'NaturalNumbers'!
II subclass: #CCCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCII class' category: 'NaturalNumbers'!
CCCXCII class
	instanceVariableNames: ''!

!CCCXCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXCI.
	next := CCCXCIII.! !


!classDefinition: #CCCXCIII category: 'NaturalNumbers'!
II subclass: #CCCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIII class' category: 'NaturalNumbers'!
CCCXCIII class
	instanceVariableNames: ''!

!CCCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXCII.
	next := CCCXCIV.! !


!classDefinition: #CCCXCIV category: 'NaturalNumbers'!
II subclass: #CCCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIV class' category: 'NaturalNumbers'!
CCCXCIV class
	instanceVariableNames: ''!

!CCCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXCIII.
	next := CCCXCV.! !


!classDefinition: #CCCXCIX category: 'NaturalNumbers'!
II subclass: #CCCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIX class' category: 'NaturalNumbers'!
CCCXCIX class
	instanceVariableNames: ''!

!CCCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXCVIII.
	next := CD.! !


!classDefinition: #CCCXCV category: 'NaturalNumbers'!
II subclass: #CCCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCV class' category: 'NaturalNumbers'!
CCCXCV class
	instanceVariableNames: ''!

!CCCXCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXCIV.
	next := CCCXCVI.! !


!classDefinition: #CCCXCVI category: 'NaturalNumbers'!
II subclass: #CCCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVI class' category: 'NaturalNumbers'!
CCCXCVI class
	instanceVariableNames: ''!

!CCCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXCV.
	next := CCCXCVII.! !


!classDefinition: #CCCXCVII category: 'NaturalNumbers'!
II subclass: #CCCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVII class' category: 'NaturalNumbers'!
CCCXCVII class
	instanceVariableNames: ''!

!CCCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXCVI.
	next := CCCXCVIII.! !


!classDefinition: #CCCXCVIII category: 'NaturalNumbers'!
II subclass: #CCCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVIII class' category: 'NaturalNumbers'!
CCCXCVIII class
	instanceVariableNames: ''!

!CCCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXCVII.
	next := CCCXCIX.! !


!classDefinition: #CCCXI category: 'NaturalNumbers'!
II subclass: #CCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXI class' category: 'NaturalNumbers'!
CCCXI class
	instanceVariableNames: ''!

!CCCXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCX.
	next := CCCXII.! !


!classDefinition: #CCCXII category: 'NaturalNumbers'!
II subclass: #CCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXII class' category: 'NaturalNumbers'!
CCCXII class
	instanceVariableNames: ''!

!CCCXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXI.
	next := CCCXIII.! !


!classDefinition: #CCCXIII category: 'NaturalNumbers'!
II subclass: #CCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIII class' category: 'NaturalNumbers'!
CCCXIII class
	instanceVariableNames: ''!

!CCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXII.
	next := CCCXIV.! !


!classDefinition: #CCCXIV category: 'NaturalNumbers'!
II subclass: #CCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIV class' category: 'NaturalNumbers'!
CCCXIV class
	instanceVariableNames: ''!

!CCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXIII.
	next := CCCXV.! !


!classDefinition: #CCCXIX category: 'NaturalNumbers'!
II subclass: #CCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIX class' category: 'NaturalNumbers'!
CCCXIX class
	instanceVariableNames: ''!

!CCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXVIII.
	next := CCCXX.! !


!classDefinition: #CCCXL category: 'NaturalNumbers'!
II subclass: #CCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXL class' category: 'NaturalNumbers'!
CCCXL class
	instanceVariableNames: ''!

!CCCXL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXXIX.
	next := CCCXLI.! !


!classDefinition: #CCCXLI category: 'NaturalNumbers'!
II subclass: #CCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLI class' category: 'NaturalNumbers'!
CCCXLI class
	instanceVariableNames: ''!

!CCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXL.
	next := CCCXLII.! !


!classDefinition: #CCCXLII category: 'NaturalNumbers'!
II subclass: #CCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLII class' category: 'NaturalNumbers'!
CCCXLII class
	instanceVariableNames: ''!

!CCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXLI.
	next := CCCXLIII.! !


!classDefinition: #CCCXLIII category: 'NaturalNumbers'!
II subclass: #CCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIII class' category: 'NaturalNumbers'!
CCCXLIII class
	instanceVariableNames: ''!

!CCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXLII.
	next := CCCXLIV.! !


!classDefinition: #CCCXLIV category: 'NaturalNumbers'!
II subclass: #CCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIV class' category: 'NaturalNumbers'!
CCCXLIV class
	instanceVariableNames: ''!

!CCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXLIII.
	next := CCCXLV.! !


!classDefinition: #CCCXLIX category: 'NaturalNumbers'!
II subclass: #CCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIX class' category: 'NaturalNumbers'!
CCCXLIX class
	instanceVariableNames: ''!

!CCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXLVIII.
	next := CCCL.! !


!classDefinition: #CCCXLV category: 'NaturalNumbers'!
II subclass: #CCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLV class' category: 'NaturalNumbers'!
CCCXLV class
	instanceVariableNames: ''!

!CCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXLIV.
	next := CCCXLVI.! !


!classDefinition: #CCCXLVI category: 'NaturalNumbers'!
II subclass: #CCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVI class' category: 'NaturalNumbers'!
CCCXLVI class
	instanceVariableNames: ''!

!CCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXLV.
	next := CCCXLVII.! !


!classDefinition: #CCCXLVII category: 'NaturalNumbers'!
II subclass: #CCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVII class' category: 'NaturalNumbers'!
CCCXLVII class
	instanceVariableNames: ''!

!CCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXLVI.
	next := CCCXLVIII.! !


!classDefinition: #CCCXLVIII category: 'NaturalNumbers'!
II subclass: #CCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVIII class' category: 'NaturalNumbers'!
CCCXLVIII class
	instanceVariableNames: ''!

!CCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXLVII.
	next := CCCXLIX.! !


!classDefinition: #CCCXV category: 'NaturalNumbers'!
II subclass: #CCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXV class' category: 'NaturalNumbers'!
CCCXV class
	instanceVariableNames: ''!

!CCCXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXIV.
	next := CCCXVI.! !


!classDefinition: #CCCXVI category: 'NaturalNumbers'!
II subclass: #CCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVI class' category: 'NaturalNumbers'!
CCCXVI class
	instanceVariableNames: ''!

!CCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXV.
	next := CCCXVII.! !


!classDefinition: #CCCXVII category: 'NaturalNumbers'!
II subclass: #CCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVII class' category: 'NaturalNumbers'!
CCCXVII class
	instanceVariableNames: ''!

!CCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXVI.
	next := CCCXVIII.! !


!classDefinition: #CCCXVIII category: 'NaturalNumbers'!
II subclass: #CCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVIII class' category: 'NaturalNumbers'!
CCCXVIII class
	instanceVariableNames: ''!

!CCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXVII.
	next := CCCXIX.! !


!classDefinition: #CCCXX category: 'NaturalNumbers'!
II subclass: #CCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXX class' category: 'NaturalNumbers'!
CCCXX class
	instanceVariableNames: ''!

!CCCXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXIX.
	next := CCCXXI.! !


!classDefinition: #CCCXXI category: 'NaturalNumbers'!
II subclass: #CCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXI class' category: 'NaturalNumbers'!
CCCXXI class
	instanceVariableNames: ''!

!CCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXX.
	next := CCCXXII.! !


!classDefinition: #CCCXXII category: 'NaturalNumbers'!
II subclass: #CCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXII class' category: 'NaturalNumbers'!
CCCXXII class
	instanceVariableNames: ''!

!CCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXI.
	next := CCCXXIII.! !


!classDefinition: #CCCXXIII category: 'NaturalNumbers'!
II subclass: #CCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIII class' category: 'NaturalNumbers'!
CCCXXIII class
	instanceVariableNames: ''!

!CCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXII.
	next := CCCXXIV.! !


!classDefinition: #CCCXXIV category: 'NaturalNumbers'!
II subclass: #CCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIV class' category: 'NaturalNumbers'!
CCCXXIV class
	instanceVariableNames: ''!

!CCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXIII.
	next := CCCXXV.! !


!classDefinition: #CCCXXIX category: 'NaturalNumbers'!
II subclass: #CCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIX class' category: 'NaturalNumbers'!
CCCXXIX class
	instanceVariableNames: ''!

!CCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXVIII.
	next := CCCXXX.! !


!classDefinition: #CCCXXV category: 'NaturalNumbers'!
II subclass: #CCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXV class' category: 'NaturalNumbers'!
CCCXXV class
	instanceVariableNames: ''!

!CCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXIV.
	next := CCCXXVI.! !


!classDefinition: #CCCXXVI category: 'NaturalNumbers'!
II subclass: #CCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVI class' category: 'NaturalNumbers'!
CCCXXVI class
	instanceVariableNames: ''!

!CCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXV.
	next := CCCXXVII.! !


!classDefinition: #CCCXXVII category: 'NaturalNumbers'!
II subclass: #CCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVII class' category: 'NaturalNumbers'!
CCCXXVII class
	instanceVariableNames: ''!

!CCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXVI.
	next := CCCXXVIII.! !


!classDefinition: #CCCXXVIII category: 'NaturalNumbers'!
II subclass: #CCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVIII class' category: 'NaturalNumbers'!
CCCXXVIII class
	instanceVariableNames: ''!

!CCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXVII.
	next := CCCXXIX.! !


!classDefinition: #CCCXXX category: 'NaturalNumbers'!
II subclass: #CCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXX class' category: 'NaturalNumbers'!
CCCXXX class
	instanceVariableNames: ''!

!CCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXIX.
	next := CCCXXXI.! !


!classDefinition: #CCCXXXI category: 'NaturalNumbers'!
II subclass: #CCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXI class' category: 'NaturalNumbers'!
CCCXXXI class
	instanceVariableNames: ''!

!CCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXX.
	next := CCCXXXII.! !


!classDefinition: #CCCXXXII category: 'NaturalNumbers'!
II subclass: #CCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXII class' category: 'NaturalNumbers'!
CCCXXXII class
	instanceVariableNames: ''!

!CCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXXI.
	next := CCCXXXIII.! !


!classDefinition: #CCCXXXIII category: 'NaturalNumbers'!
II subclass: #CCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIII class' category: 'NaturalNumbers'!
CCCXXXIII class
	instanceVariableNames: ''!

!CCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXXII.
	next := CCCXXXIV.! !


!classDefinition: #CCCXXXIV category: 'NaturalNumbers'!
II subclass: #CCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIV class' category: 'NaturalNumbers'!
CCCXXXIV class
	instanceVariableNames: ''!

!CCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXXIII.
	next := CCCXXXV.! !


!classDefinition: #CCCXXXIX category: 'NaturalNumbers'!
II subclass: #CCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIX class' category: 'NaturalNumbers'!
CCCXXXIX class
	instanceVariableNames: ''!

!CCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXXVIII.
	next := CCCXL.! !


!classDefinition: #CCCXXXV category: 'NaturalNumbers'!
II subclass: #CCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXV class' category: 'NaturalNumbers'!
CCCXXXV class
	instanceVariableNames: ''!

!CCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXXIV.
	next := CCCXXXVI.! !


!classDefinition: #CCCXXXVI category: 'NaturalNumbers'!
II subclass: #CCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVI class' category: 'NaturalNumbers'!
CCCXXXVI class
	instanceVariableNames: ''!

!CCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXXV.
	next := CCCXXXVII.! !


!classDefinition: #CCCXXXVII category: 'NaturalNumbers'!
II subclass: #CCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVII class' category: 'NaturalNumbers'!
CCCXXXVII class
	instanceVariableNames: ''!

!CCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXXVI.
	next := CCCXXXVIII.! !


!classDefinition: #CCCXXXVIII category: 'NaturalNumbers'!
II subclass: #CCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVIII class' category: 'NaturalNumbers'!
CCCXXXVIII class
	instanceVariableNames: ''!

!CCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXXXVII.
	next := CCCXXXIX.! !


!classDefinition: #CCI category: 'NaturalNumbers'!
II subclass: #CCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCI class' category: 'NaturalNumbers'!
CCI class
	instanceVariableNames: ''!

!CCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CC.
	next := CCII.! !


!classDefinition: #CCII category: 'NaturalNumbers'!
II subclass: #CCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCII class' category: 'NaturalNumbers'!
CCII class
	instanceVariableNames: ''!

!CCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCI.
	next := CCIII.! !


!classDefinition: #CCIII category: 'NaturalNumbers'!
II subclass: #CCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIII class' category: 'NaturalNumbers'!
CCIII class
	instanceVariableNames: ''!

!CCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCII.
	next := CCIV.! !


!classDefinition: #CCIV category: 'NaturalNumbers'!
II subclass: #CCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIV class' category: 'NaturalNumbers'!
CCIV class
	instanceVariableNames: ''!

!CCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCIII.
	next := CCV.! !


!classDefinition: #CCIX category: 'NaturalNumbers'!
II subclass: #CCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIX class' category: 'NaturalNumbers'!
CCIX class
	instanceVariableNames: ''!

!CCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCVIII.
	next := CCX.! !


!classDefinition: #CCL category: 'NaturalNumbers'!
II subclass: #CCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCL class' category: 'NaturalNumbers'!
CCL class
	instanceVariableNames: ''!

!CCL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXLIX.
	next := CCLI.! !


!classDefinition: #CCLI category: 'NaturalNumbers'!
II subclass: #CCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLI class' category: 'NaturalNumbers'!
CCLI class
	instanceVariableNames: ''!

!CCLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCL.
	next := CCLII.! !


!classDefinition: #CCLII category: 'NaturalNumbers'!
II subclass: #CCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLII class' category: 'NaturalNumbers'!
CCLII class
	instanceVariableNames: ''!

!CCLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLI.
	next := CCLIII.! !


!classDefinition: #CCLIII category: 'NaturalNumbers'!
II subclass: #CCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIII class' category: 'NaturalNumbers'!
CCLIII class
	instanceVariableNames: ''!

!CCLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLII.
	next := CCLIV.! !


!classDefinition: #CCLIV category: 'NaturalNumbers'!
II subclass: #CCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIV class' category: 'NaturalNumbers'!
CCLIV class
	instanceVariableNames: ''!

!CCLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLIII.
	next := CCLV.! !


!classDefinition: #CCLIX category: 'NaturalNumbers'!
II subclass: #CCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIX class' category: 'NaturalNumbers'!
CCLIX class
	instanceVariableNames: ''!

!CCLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLVIII.
	next := CCLX.! !


!classDefinition: #CCLV category: 'NaturalNumbers'!
II subclass: #CCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLV class' category: 'NaturalNumbers'!
CCLV class
	instanceVariableNames: ''!

!CCLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLIV.
	next := CCLVI.! !


!classDefinition: #CCLVI category: 'NaturalNumbers'!
II subclass: #CCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVI class' category: 'NaturalNumbers'!
CCLVI class
	instanceVariableNames: ''!

!CCLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLV.
	next := CCLVII.! !


!classDefinition: #CCLVII category: 'NaturalNumbers'!
II subclass: #CCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVII class' category: 'NaturalNumbers'!
CCLVII class
	instanceVariableNames: ''!

!CCLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLVI.
	next := CCLVIII.! !


!classDefinition: #CCLVIII category: 'NaturalNumbers'!
II subclass: #CCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVIII class' category: 'NaturalNumbers'!
CCLVIII class
	instanceVariableNames: ''!

!CCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLVII.
	next := CCLIX.! !


!classDefinition: #CCLX category: 'NaturalNumbers'!
II subclass: #CCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLX class' category: 'NaturalNumbers'!
CCLX class
	instanceVariableNames: ''!

!CCLX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLIX.
	next := CCLXI.! !


!classDefinition: #CCLXI category: 'NaturalNumbers'!
II subclass: #CCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXI class' category: 'NaturalNumbers'!
CCLXI class
	instanceVariableNames: ''!

!CCLXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLX.
	next := CCLXII.! !


!classDefinition: #CCLXII category: 'NaturalNumbers'!
II subclass: #CCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXII class' category: 'NaturalNumbers'!
CCLXII class
	instanceVariableNames: ''!

!CCLXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXI.
	next := CCLXIII.! !


!classDefinition: #CCLXIII category: 'NaturalNumbers'!
II subclass: #CCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIII class' category: 'NaturalNumbers'!
CCLXIII class
	instanceVariableNames: ''!

!CCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXII.
	next := CCLXIV.! !


!classDefinition: #CCLXIV category: 'NaturalNumbers'!
II subclass: #CCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIV class' category: 'NaturalNumbers'!
CCLXIV class
	instanceVariableNames: ''!

!CCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXIII.
	next := CCLXV.! !


!classDefinition: #CCLXIX category: 'NaturalNumbers'!
II subclass: #CCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIX class' category: 'NaturalNumbers'!
CCLXIX class
	instanceVariableNames: ''!

!CCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXVIII.
	next := CCLXX.! !


!classDefinition: #CCLXV category: 'NaturalNumbers'!
II subclass: #CCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXV class' category: 'NaturalNumbers'!
CCLXV class
	instanceVariableNames: ''!

!CCLXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXIV.
	next := CCLXVI.! !


!classDefinition: #CCLXVI category: 'NaturalNumbers'!
II subclass: #CCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVI class' category: 'NaturalNumbers'!
CCLXVI class
	instanceVariableNames: ''!

!CCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXV.
	next := CCLXVII.! !


!classDefinition: #CCLXVII category: 'NaturalNumbers'!
II subclass: #CCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVII class' category: 'NaturalNumbers'!
CCLXVII class
	instanceVariableNames: ''!

!CCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXVI.
	next := CCLXVIII.! !


!classDefinition: #CCLXVIII category: 'NaturalNumbers'!
II subclass: #CCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVIII class' category: 'NaturalNumbers'!
CCLXVIII class
	instanceVariableNames: ''!

!CCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXVII.
	next := CCLXIX.! !


!classDefinition: #CCLXX category: 'NaturalNumbers'!
II subclass: #CCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXX class' category: 'NaturalNumbers'!
CCLXX class
	instanceVariableNames: ''!

!CCLXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXIX.
	next := CCLXXI.! !


!classDefinition: #CCLXXI category: 'NaturalNumbers'!
II subclass: #CCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXI class' category: 'NaturalNumbers'!
CCLXXI class
	instanceVariableNames: ''!

!CCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXX.
	next := CCLXXII.! !


!classDefinition: #CCLXXII category: 'NaturalNumbers'!
II subclass: #CCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXII class' category: 'NaturalNumbers'!
CCLXXII class
	instanceVariableNames: ''!

!CCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXI.
	next := CCLXXIII.! !


!classDefinition: #CCLXXIII category: 'NaturalNumbers'!
II subclass: #CCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIII class' category: 'NaturalNumbers'!
CCLXXIII class
	instanceVariableNames: ''!

!CCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXII.
	next := CCLXXIV.! !


!classDefinition: #CCLXXIV category: 'NaturalNumbers'!
II subclass: #CCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIV class' category: 'NaturalNumbers'!
CCLXXIV class
	instanceVariableNames: ''!

!CCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXIII.
	next := CCLXXV.! !


!classDefinition: #CCLXXIX category: 'NaturalNumbers'!
II subclass: #CCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIX class' category: 'NaturalNumbers'!
CCLXXIX class
	instanceVariableNames: ''!

!CCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXVIII.
	next := CCLXXX.! !


!classDefinition: #CCLXXV category: 'NaturalNumbers'!
II subclass: #CCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXV class' category: 'NaturalNumbers'!
CCLXXV class
	instanceVariableNames: ''!

!CCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXIV.
	next := CCLXXVI.! !


!classDefinition: #CCLXXVI category: 'NaturalNumbers'!
II subclass: #CCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVI class' category: 'NaturalNumbers'!
CCLXXVI class
	instanceVariableNames: ''!

!CCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXV.
	next := CCLXXVII.! !


!classDefinition: #CCLXXVII category: 'NaturalNumbers'!
II subclass: #CCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVII class' category: 'NaturalNumbers'!
CCLXXVII class
	instanceVariableNames: ''!

!CCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXVI.
	next := CCLXXVIII.! !


!classDefinition: #CCLXXVIII category: 'NaturalNumbers'!
II subclass: #CCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVIII class' category: 'NaturalNumbers'!
CCLXXVIII class
	instanceVariableNames: ''!

!CCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXVII.
	next := CCLXXIX.! !


!classDefinition: #CCLXXX category: 'NaturalNumbers'!
II subclass: #CCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXX class' category: 'NaturalNumbers'!
CCLXXX class
	instanceVariableNames: ''!

!CCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXIX.
	next := CCLXXXI.! !


!classDefinition: #CCLXXXI category: 'NaturalNumbers'!
II subclass: #CCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXI class' category: 'NaturalNumbers'!
CCLXXXI class
	instanceVariableNames: ''!

!CCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXX.
	next := CCLXXXII.! !


!classDefinition: #CCLXXXII category: 'NaturalNumbers'!
II subclass: #CCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXII class' category: 'NaturalNumbers'!
CCLXXXII class
	instanceVariableNames: ''!

!CCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXXI.
	next := CCLXXXIII.! !


!classDefinition: #CCLXXXIII category: 'NaturalNumbers'!
II subclass: #CCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIII class' category: 'NaturalNumbers'!
CCLXXXIII class
	instanceVariableNames: ''!

!CCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXXII.
	next := CCLXXXIV.! !


!classDefinition: #CCLXXXIV category: 'NaturalNumbers'!
II subclass: #CCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIV class' category: 'NaturalNumbers'!
CCLXXXIV class
	instanceVariableNames: ''!

!CCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXXIII.
	next := CCLXXXV.! !


!classDefinition: #CCLXXXIX category: 'NaturalNumbers'!
II subclass: #CCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIX class' category: 'NaturalNumbers'!
CCLXXXIX class
	instanceVariableNames: ''!

!CCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXXVIII.
	next := CCXC.! !


!classDefinition: #CCLXXXV category: 'NaturalNumbers'!
II subclass: #CCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXV class' category: 'NaturalNumbers'!
CCLXXXV class
	instanceVariableNames: ''!

!CCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXXIV.
	next := CCLXXXVI.! !


!classDefinition: #CCLXXXVI category: 'NaturalNumbers'!
II subclass: #CCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVI class' category: 'NaturalNumbers'!
CCLXXXVI class
	instanceVariableNames: ''!

!CCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXXV.
	next := CCLXXXVII.! !


!classDefinition: #CCLXXXVII category: 'NaturalNumbers'!
II subclass: #CCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVII class' category: 'NaturalNumbers'!
CCLXXXVII class
	instanceVariableNames: ''!

!CCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXXVI.
	next := CCLXXXVIII.! !


!classDefinition: #CCLXXXVIII category: 'NaturalNumbers'!
II subclass: #CCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVIII class' category: 'NaturalNumbers'!
CCLXXXVIII class
	instanceVariableNames: ''!

!CCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXXVII.
	next := CCLXXXIX.! !


!classDefinition: #CCV category: 'NaturalNumbers'!
II subclass: #CCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCV class' category: 'NaturalNumbers'!
CCV class
	instanceVariableNames: ''!

!CCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCIV.
	next := CCVI.! !


!classDefinition: #CCVI category: 'NaturalNumbers'!
II subclass: #CCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVI class' category: 'NaturalNumbers'!
CCVI class
	instanceVariableNames: ''!

!CCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCV.
	next := CCVII.! !


!classDefinition: #CCVII category: 'NaturalNumbers'!
II subclass: #CCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVII class' category: 'NaturalNumbers'!
CCVII class
	instanceVariableNames: ''!

!CCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCVI.
	next := CCVIII.! !


!classDefinition: #CCVIII category: 'NaturalNumbers'!
II subclass: #CCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVIII class' category: 'NaturalNumbers'!
CCVIII class
	instanceVariableNames: ''!

!CCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCVII.
	next := CCIX.! !


!classDefinition: #CCX category: 'NaturalNumbers'!
II subclass: #CCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCX class' category: 'NaturalNumbers'!
CCX class
	instanceVariableNames: ''!

!CCX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCIX.
	next := CCXI.! !


!classDefinition: #CCXC category: 'NaturalNumbers'!
II subclass: #CCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXC class' category: 'NaturalNumbers'!
CCXC class
	instanceVariableNames: ''!

!CCXC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCLXXXIX.
	next := CCXCI.! !


!classDefinition: #CCXCI category: 'NaturalNumbers'!
II subclass: #CCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCI class' category: 'NaturalNumbers'!
CCXCI class
	instanceVariableNames: ''!

!CCXCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXC.
	next := CCXCII.! !


!classDefinition: #CCXCII category: 'NaturalNumbers'!
II subclass: #CCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCII class' category: 'NaturalNumbers'!
CCXCII class
	instanceVariableNames: ''!

!CCXCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXCI.
	next := CCXCIII.! !


!classDefinition: #CCXCIII category: 'NaturalNumbers'!
II subclass: #CCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIII class' category: 'NaturalNumbers'!
CCXCIII class
	instanceVariableNames: ''!

!CCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXCII.
	next := CCXCIV.! !


!classDefinition: #CCXCIV category: 'NaturalNumbers'!
II subclass: #CCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIV class' category: 'NaturalNumbers'!
CCXCIV class
	instanceVariableNames: ''!

!CCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXCIII.
	next := CCXCV.! !


!classDefinition: #CCXCIX category: 'NaturalNumbers'!
II subclass: #CCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIX class' category: 'NaturalNumbers'!
CCXCIX class
	instanceVariableNames: ''!

!CCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXCVIII.
	next := CCC.! !


!classDefinition: #CCXCV category: 'NaturalNumbers'!
II subclass: #CCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCV class' category: 'NaturalNumbers'!
CCXCV class
	instanceVariableNames: ''!

!CCXCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXCIV.
	next := CCXCVI.! !


!classDefinition: #CCXCVI category: 'NaturalNumbers'!
II subclass: #CCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVI class' category: 'NaturalNumbers'!
CCXCVI class
	instanceVariableNames: ''!

!CCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXCV.
	next := CCXCVII.! !


!classDefinition: #CCXCVII category: 'NaturalNumbers'!
II subclass: #CCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVII class' category: 'NaturalNumbers'!
CCXCVII class
	instanceVariableNames: ''!

!CCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXCVI.
	next := CCXCVIII.! !


!classDefinition: #CCXCVIII category: 'NaturalNumbers'!
II subclass: #CCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVIII class' category: 'NaturalNumbers'!
CCXCVIII class
	instanceVariableNames: ''!

!CCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXCVII.
	next := CCXCIX.! !


!classDefinition: #CCXI category: 'NaturalNumbers'!
II subclass: #CCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXI class' category: 'NaturalNumbers'!
CCXI class
	instanceVariableNames: ''!

!CCXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCX.
	next := CCXII.! !


!classDefinition: #CCXII category: 'NaturalNumbers'!
II subclass: #CCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXII class' category: 'NaturalNumbers'!
CCXII class
	instanceVariableNames: ''!

!CCXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXI.
	next := CCXIII.! !


!classDefinition: #CCXIII category: 'NaturalNumbers'!
II subclass: #CCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIII class' category: 'NaturalNumbers'!
CCXIII class
	instanceVariableNames: ''!

!CCXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXII.
	next := CCXIV.! !


!classDefinition: #CCXIV category: 'NaturalNumbers'!
II subclass: #CCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIV class' category: 'NaturalNumbers'!
CCXIV class
	instanceVariableNames: ''!

!CCXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXIII.
	next := CCXV.! !


!classDefinition: #CCXIX category: 'NaturalNumbers'!
II subclass: #CCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIX class' category: 'NaturalNumbers'!
CCXIX class
	instanceVariableNames: ''!

!CCXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXVIII.
	next := CCXX.! !


!classDefinition: #CCXL category: 'NaturalNumbers'!
II subclass: #CCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXL class' category: 'NaturalNumbers'!
CCXL class
	instanceVariableNames: ''!

!CCXL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXXIX.
	next := CCXLI.! !


!classDefinition: #CCXLI category: 'NaturalNumbers'!
II subclass: #CCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLI class' category: 'NaturalNumbers'!
CCXLI class
	instanceVariableNames: ''!

!CCXLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXL.
	next := CCXLII.! !


!classDefinition: #CCXLII category: 'NaturalNumbers'!
II subclass: #CCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLII class' category: 'NaturalNumbers'!
CCXLII class
	instanceVariableNames: ''!

!CCXLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXLI.
	next := CCXLIII.! !


!classDefinition: #CCXLIII category: 'NaturalNumbers'!
II subclass: #CCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIII class' category: 'NaturalNumbers'!
CCXLIII class
	instanceVariableNames: ''!

!CCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXLII.
	next := CCXLIV.! !


!classDefinition: #CCXLIV category: 'NaturalNumbers'!
II subclass: #CCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIV class' category: 'NaturalNumbers'!
CCXLIV class
	instanceVariableNames: ''!

!CCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXLIII.
	next := CCXLV.! !


!classDefinition: #CCXLIX category: 'NaturalNumbers'!
II subclass: #CCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIX class' category: 'NaturalNumbers'!
CCXLIX class
	instanceVariableNames: ''!

!CCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXLVIII.
	next := CCL.! !


!classDefinition: #CCXLV category: 'NaturalNumbers'!
II subclass: #CCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLV class' category: 'NaturalNumbers'!
CCXLV class
	instanceVariableNames: ''!

!CCXLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXLIV.
	next := CCXLVI.! !


!classDefinition: #CCXLVI category: 'NaturalNumbers'!
II subclass: #CCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVI class' category: 'NaturalNumbers'!
CCXLVI class
	instanceVariableNames: ''!

!CCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXLV.
	next := CCXLVII.! !


!classDefinition: #CCXLVII category: 'NaturalNumbers'!
II subclass: #CCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVII class' category: 'NaturalNumbers'!
CCXLVII class
	instanceVariableNames: ''!

!CCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXLVI.
	next := CCXLVIII.! !


!classDefinition: #CCXLVIII category: 'NaturalNumbers'!
II subclass: #CCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVIII class' category: 'NaturalNumbers'!
CCXLVIII class
	instanceVariableNames: ''!

!CCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXLVII.
	next := CCXLIX.! !


!classDefinition: #CCXV category: 'NaturalNumbers'!
II subclass: #CCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXV class' category: 'NaturalNumbers'!
CCXV class
	instanceVariableNames: ''!

!CCXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXIV.
	next := CCXVI.! !


!classDefinition: #CCXVI category: 'NaturalNumbers'!
II subclass: #CCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVI class' category: 'NaturalNumbers'!
CCXVI class
	instanceVariableNames: ''!

!CCXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXV.
	next := CCXVII.! !


!classDefinition: #CCXVII category: 'NaturalNumbers'!
II subclass: #CCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVII class' category: 'NaturalNumbers'!
CCXVII class
	instanceVariableNames: ''!

!CCXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXVI.
	next := CCXVIII.! !


!classDefinition: #CCXVIII category: 'NaturalNumbers'!
II subclass: #CCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVIII class' category: 'NaturalNumbers'!
CCXVIII class
	instanceVariableNames: ''!

!CCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXVII.
	next := CCXIX.! !


!classDefinition: #CCXX category: 'NaturalNumbers'!
II subclass: #CCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXX class' category: 'NaturalNumbers'!
CCXX class
	instanceVariableNames: ''!

!CCXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXIX.
	next := CCXXI.! !


!classDefinition: #CCXXI category: 'NaturalNumbers'!
II subclass: #CCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXI class' category: 'NaturalNumbers'!
CCXXI class
	instanceVariableNames: ''!

!CCXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXX.
	next := CCXXII.! !


!classDefinition: #CCXXII category: 'NaturalNumbers'!
II subclass: #CCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXII class' category: 'NaturalNumbers'!
CCXXII class
	instanceVariableNames: ''!

!CCXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXI.
	next := CCXXIII.! !


!classDefinition: #CCXXIII category: 'NaturalNumbers'!
II subclass: #CCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIII class' category: 'NaturalNumbers'!
CCXXIII class
	instanceVariableNames: ''!

!CCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXII.
	next := CCXXIV.! !


!classDefinition: #CCXXIV category: 'NaturalNumbers'!
II subclass: #CCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIV class' category: 'NaturalNumbers'!
CCXXIV class
	instanceVariableNames: ''!

!CCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXIII.
	next := CCXXV.! !


!classDefinition: #CCXXIX category: 'NaturalNumbers'!
II subclass: #CCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIX class' category: 'NaturalNumbers'!
CCXXIX class
	instanceVariableNames: ''!

!CCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXVIII.
	next := CCXXX.! !


!classDefinition: #CCXXV category: 'NaturalNumbers'!
II subclass: #CCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXV class' category: 'NaturalNumbers'!
CCXXV class
	instanceVariableNames: ''!

!CCXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXIV.
	next := CCXXVI.! !


!classDefinition: #CCXXVI category: 'NaturalNumbers'!
II subclass: #CCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVI class' category: 'NaturalNumbers'!
CCXXVI class
	instanceVariableNames: ''!

!CCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXV.
	next := CCXXVII.! !


!classDefinition: #CCXXVII category: 'NaturalNumbers'!
II subclass: #CCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVII class' category: 'NaturalNumbers'!
CCXXVII class
	instanceVariableNames: ''!

!CCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXVI.
	next := CCXXVIII.! !


!classDefinition: #CCXXVIII category: 'NaturalNumbers'!
II subclass: #CCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVIII class' category: 'NaturalNumbers'!
CCXXVIII class
	instanceVariableNames: ''!

!CCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXVII.
	next := CCXXIX.! !


!classDefinition: #CCXXX category: 'NaturalNumbers'!
II subclass: #CCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXX class' category: 'NaturalNumbers'!
CCXXX class
	instanceVariableNames: ''!

!CCXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXIX.
	next := CCXXXI.! !


!classDefinition: #CCXXXI category: 'NaturalNumbers'!
II subclass: #CCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXI class' category: 'NaturalNumbers'!
CCXXXI class
	instanceVariableNames: ''!

!CCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXX.
	next := CCXXXII.! !


!classDefinition: #CCXXXII category: 'NaturalNumbers'!
II subclass: #CCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXII class' category: 'NaturalNumbers'!
CCXXXII class
	instanceVariableNames: ''!

!CCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXXI.
	next := CCXXXIII.! !


!classDefinition: #CCXXXIII category: 'NaturalNumbers'!
II subclass: #CCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIII class' category: 'NaturalNumbers'!
CCXXXIII class
	instanceVariableNames: ''!

!CCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXXII.
	next := CCXXXIV.! !


!classDefinition: #CCXXXIV category: 'NaturalNumbers'!
II subclass: #CCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIV class' category: 'NaturalNumbers'!
CCXXXIV class
	instanceVariableNames: ''!

!CCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXXIII.
	next := CCXXXV.! !


!classDefinition: #CCXXXIX category: 'NaturalNumbers'!
II subclass: #CCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIX class' category: 'NaturalNumbers'!
CCXXXIX class
	instanceVariableNames: ''!

!CCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXXVIII.
	next := CCXL.! !


!classDefinition: #CCXXXV category: 'NaturalNumbers'!
II subclass: #CCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXV class' category: 'NaturalNumbers'!
CCXXXV class
	instanceVariableNames: ''!

!CCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXXIV.
	next := CCXXXVI.! !


!classDefinition: #CCXXXVI category: 'NaturalNumbers'!
II subclass: #CCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVI class' category: 'NaturalNumbers'!
CCXXXVI class
	instanceVariableNames: ''!

!CCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXXV.
	next := CCXXXVII.! !


!classDefinition: #CCXXXVII category: 'NaturalNumbers'!
II subclass: #CCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVII class' category: 'NaturalNumbers'!
CCXXXVII class
	instanceVariableNames: ''!

!CCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXXVI.
	next := CCXXXVIII.! !


!classDefinition: #CCXXXVIII category: 'NaturalNumbers'!
II subclass: #CCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVIII class' category: 'NaturalNumbers'!
CCXXXVIII class
	instanceVariableNames: ''!

!CCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCXXXVII.
	next := CCXXXIX.! !


!classDefinition: #CD category: 'NaturalNumbers'!
II subclass: #CD
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CD class' category: 'NaturalNumbers'!
CD class
	instanceVariableNames: ''!

!CD class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CCCXCIX.
	next := CDI.! !


!classDefinition: #CDI category: 'NaturalNumbers'!
II subclass: #CDI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDI class' category: 'NaturalNumbers'!
CDI class
	instanceVariableNames: ''!

!CDI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CD.
	next := CDII.! !


!classDefinition: #CDII category: 'NaturalNumbers'!
II subclass: #CDII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDII class' category: 'NaturalNumbers'!
CDII class
	instanceVariableNames: ''!

!CDII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDI.
	next := CDIII.! !


!classDefinition: #CDIII category: 'NaturalNumbers'!
II subclass: #CDIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIII class' category: 'NaturalNumbers'!
CDIII class
	instanceVariableNames: ''!

!CDIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDII.
	next := CDIV.! !


!classDefinition: #CDIV category: 'NaturalNumbers'!
II subclass: #CDIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIV class' category: 'NaturalNumbers'!
CDIV class
	instanceVariableNames: ''!

!CDIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDIII.
	next := CDV.! !


!classDefinition: #CDIX category: 'NaturalNumbers'!
II subclass: #CDIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIX class' category: 'NaturalNumbers'!
CDIX class
	instanceVariableNames: ''!

!CDIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDVIII.
	next := CDX.! !


!classDefinition: #CDL category: 'NaturalNumbers'!
II subclass: #CDL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDL class' category: 'NaturalNumbers'!
CDL class
	instanceVariableNames: ''!

!CDL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXLIX.
	next := CDLI.! !


!classDefinition: #CDLI category: 'NaturalNumbers'!
II subclass: #CDLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLI class' category: 'NaturalNumbers'!
CDLI class
	instanceVariableNames: ''!

!CDLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDL.
	next := CDLII.! !


!classDefinition: #CDLII category: 'NaturalNumbers'!
II subclass: #CDLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLII class' category: 'NaturalNumbers'!
CDLII class
	instanceVariableNames: ''!

!CDLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLI.
	next := CDLIII.! !


!classDefinition: #CDLIII category: 'NaturalNumbers'!
II subclass: #CDLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIII class' category: 'NaturalNumbers'!
CDLIII class
	instanceVariableNames: ''!

!CDLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLII.
	next := CDLIV.! !


!classDefinition: #CDLIV category: 'NaturalNumbers'!
II subclass: #CDLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIV class' category: 'NaturalNumbers'!
CDLIV class
	instanceVariableNames: ''!

!CDLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLIII.
	next := CDLV.! !


!classDefinition: #CDLIX category: 'NaturalNumbers'!
II subclass: #CDLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIX class' category: 'NaturalNumbers'!
CDLIX class
	instanceVariableNames: ''!

!CDLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLVIII.
	next := CDLX.! !


!classDefinition: #CDLV category: 'NaturalNumbers'!
II subclass: #CDLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLV class' category: 'NaturalNumbers'!
CDLV class
	instanceVariableNames: ''!

!CDLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLIV.
	next := CDLVI.! !


!classDefinition: #CDLVI category: 'NaturalNumbers'!
II subclass: #CDLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVI class' category: 'NaturalNumbers'!
CDLVI class
	instanceVariableNames: ''!

!CDLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLV.
	next := CDLVII.! !


!classDefinition: #CDLVII category: 'NaturalNumbers'!
II subclass: #CDLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVII class' category: 'NaturalNumbers'!
CDLVII class
	instanceVariableNames: ''!

!CDLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLVI.
	next := CDLVIII.! !


!classDefinition: #CDLVIII category: 'NaturalNumbers'!
II subclass: #CDLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVIII class' category: 'NaturalNumbers'!
CDLVIII class
	instanceVariableNames: ''!

!CDLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLVII.
	next := CDLIX.! !


!classDefinition: #CDLX category: 'NaturalNumbers'!
II subclass: #CDLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLX class' category: 'NaturalNumbers'!
CDLX class
	instanceVariableNames: ''!

!CDLX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLIX.
	next := CDLXI.! !


!classDefinition: #CDLXI category: 'NaturalNumbers'!
II subclass: #CDLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXI class' category: 'NaturalNumbers'!
CDLXI class
	instanceVariableNames: ''!

!CDLXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLX.
	next := CDLXII.! !


!classDefinition: #CDLXII category: 'NaturalNumbers'!
II subclass: #CDLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXII class' category: 'NaturalNumbers'!
CDLXII class
	instanceVariableNames: ''!

!CDLXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXI.
	next := CDLXIII.! !


!classDefinition: #CDLXIII category: 'NaturalNumbers'!
II subclass: #CDLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIII class' category: 'NaturalNumbers'!
CDLXIII class
	instanceVariableNames: ''!

!CDLXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXII.
	next := CDLXIV.! !


!classDefinition: #CDLXIV category: 'NaturalNumbers'!
II subclass: #CDLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIV class' category: 'NaturalNumbers'!
CDLXIV class
	instanceVariableNames: ''!

!CDLXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXIII.
	next := CDLXV.! !


!classDefinition: #CDLXIX category: 'NaturalNumbers'!
II subclass: #CDLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIX class' category: 'NaturalNumbers'!
CDLXIX class
	instanceVariableNames: ''!

!CDLXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXVIII.
	next := CDLXX.! !


!classDefinition: #CDLXV category: 'NaturalNumbers'!
II subclass: #CDLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXV class' category: 'NaturalNumbers'!
CDLXV class
	instanceVariableNames: ''!

!CDLXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXIV.
	next := CDLXVI.! !


!classDefinition: #CDLXVI category: 'NaturalNumbers'!
II subclass: #CDLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVI class' category: 'NaturalNumbers'!
CDLXVI class
	instanceVariableNames: ''!

!CDLXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXV.
	next := CDLXVII.! !


!classDefinition: #CDLXVII category: 'NaturalNumbers'!
II subclass: #CDLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVII class' category: 'NaturalNumbers'!
CDLXVII class
	instanceVariableNames: ''!

!CDLXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXVI.
	next := CDLXVIII.! !


!classDefinition: #CDLXVIII category: 'NaturalNumbers'!
II subclass: #CDLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVIII class' category: 'NaturalNumbers'!
CDLXVIII class
	instanceVariableNames: ''!

!CDLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXVII.
	next := CDLXIX.! !


!classDefinition: #CDLXX category: 'NaturalNumbers'!
II subclass: #CDLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXX class' category: 'NaturalNumbers'!
CDLXX class
	instanceVariableNames: ''!

!CDLXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXIX.
	next := CDLXXI.! !


!classDefinition: #CDLXXI category: 'NaturalNumbers'!
II subclass: #CDLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXI class' category: 'NaturalNumbers'!
CDLXXI class
	instanceVariableNames: ''!

!CDLXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXX.
	next := CDLXXII.! !


!classDefinition: #CDLXXII category: 'NaturalNumbers'!
II subclass: #CDLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXII class' category: 'NaturalNumbers'!
CDLXXII class
	instanceVariableNames: ''!

!CDLXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXI.
	next := CDLXXIII.! !


!classDefinition: #CDLXXIII category: 'NaturalNumbers'!
II subclass: #CDLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIII class' category: 'NaturalNumbers'!
CDLXXIII class
	instanceVariableNames: ''!

!CDLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXII.
	next := CDLXXIV.! !


!classDefinition: #CDLXXIV category: 'NaturalNumbers'!
II subclass: #CDLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIV class' category: 'NaturalNumbers'!
CDLXXIV class
	instanceVariableNames: ''!

!CDLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXIII.
	next := CDLXXV.! !


!classDefinition: #CDLXXIX category: 'NaturalNumbers'!
II subclass: #CDLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIX class' category: 'NaturalNumbers'!
CDLXXIX class
	instanceVariableNames: ''!

!CDLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXVIII.
	next := CDLXXX.! !


!classDefinition: #CDLXXV category: 'NaturalNumbers'!
II subclass: #CDLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXV class' category: 'NaturalNumbers'!
CDLXXV class
	instanceVariableNames: ''!

!CDLXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXIV.
	next := CDLXXVI.! !


!classDefinition: #CDLXXVI category: 'NaturalNumbers'!
II subclass: #CDLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVI class' category: 'NaturalNumbers'!
CDLXXVI class
	instanceVariableNames: ''!

!CDLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXV.
	next := CDLXXVII.! !


!classDefinition: #CDLXXVII category: 'NaturalNumbers'!
II subclass: #CDLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVII class' category: 'NaturalNumbers'!
CDLXXVII class
	instanceVariableNames: ''!

!CDLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXVI.
	next := CDLXXVIII.! !


!classDefinition: #CDLXXVIII category: 'NaturalNumbers'!
II subclass: #CDLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVIII class' category: 'NaturalNumbers'!
CDLXXVIII class
	instanceVariableNames: ''!

!CDLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXVII.
	next := CDLXXIX.! !


!classDefinition: #CDLXXX category: 'NaturalNumbers'!
II subclass: #CDLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXX class' category: 'NaturalNumbers'!
CDLXXX class
	instanceVariableNames: ''!

!CDLXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXIX.
	next := CDLXXXI.! !


!classDefinition: #CDLXXXI category: 'NaturalNumbers'!
II subclass: #CDLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXI class' category: 'NaturalNumbers'!
CDLXXXI class
	instanceVariableNames: ''!

!CDLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXX.
	next := CDLXXXII.! !


!classDefinition: #CDLXXXII category: 'NaturalNumbers'!
II subclass: #CDLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXII class' category: 'NaturalNumbers'!
CDLXXXII class
	instanceVariableNames: ''!

!CDLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXXI.
	next := CDLXXXIII.! !


!classDefinition: #CDLXXXIII category: 'NaturalNumbers'!
II subclass: #CDLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIII class' category: 'NaturalNumbers'!
CDLXXXIII class
	instanceVariableNames: ''!

!CDLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXXII.
	next := CDLXXXIV.! !


!classDefinition: #CDLXXXIV category: 'NaturalNumbers'!
II subclass: #CDLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIV class' category: 'NaturalNumbers'!
CDLXXXIV class
	instanceVariableNames: ''!

!CDLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXXIII.
	next := CDLXXXV.! !


!classDefinition: #CDLXXXIX category: 'NaturalNumbers'!
II subclass: #CDLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIX class' category: 'NaturalNumbers'!
CDLXXXIX class
	instanceVariableNames: ''!

!CDLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXXVIII.
	next := CDXC.! !


!classDefinition: #CDLXXXV category: 'NaturalNumbers'!
II subclass: #CDLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXV class' category: 'NaturalNumbers'!
CDLXXXV class
	instanceVariableNames: ''!

!CDLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXXIV.
	next := CDLXXXVI.! !


!classDefinition: #CDLXXXVI category: 'NaturalNumbers'!
II subclass: #CDLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVI class' category: 'NaturalNumbers'!
CDLXXXVI class
	instanceVariableNames: ''!

!CDLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXXV.
	next := CDLXXXVII.! !


!classDefinition: #CDLXXXVII category: 'NaturalNumbers'!
II subclass: #CDLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVII class' category: 'NaturalNumbers'!
CDLXXXVII class
	instanceVariableNames: ''!

!CDLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXXVI.
	next := CDLXXXVIII.! !


!classDefinition: #CDLXXXVIII category: 'NaturalNumbers'!
II subclass: #CDLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVIII class' category: 'NaturalNumbers'!
CDLXXXVIII class
	instanceVariableNames: ''!

!CDLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXXVII.
	next := CDLXXXIX.! !


!classDefinition: #CDV category: 'NaturalNumbers'!
II subclass: #CDV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDV class' category: 'NaturalNumbers'!
CDV class
	instanceVariableNames: ''!

!CDV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDIV.
	next := CDVI.! !


!classDefinition: #CDVI category: 'NaturalNumbers'!
II subclass: #CDVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVI class' category: 'NaturalNumbers'!
CDVI class
	instanceVariableNames: ''!

!CDVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDV.
	next := CDVII.! !


!classDefinition: #CDVII category: 'NaturalNumbers'!
II subclass: #CDVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVII class' category: 'NaturalNumbers'!
CDVII class
	instanceVariableNames: ''!

!CDVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDVI.
	next := CDVIII.! !


!classDefinition: #CDVIII category: 'NaturalNumbers'!
II subclass: #CDVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVIII class' category: 'NaturalNumbers'!
CDVIII class
	instanceVariableNames: ''!

!CDVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDVII.
	next := CDIX.! !


!classDefinition: #CDX category: 'NaturalNumbers'!
II subclass: #CDX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDX class' category: 'NaturalNumbers'!
CDX class
	instanceVariableNames: ''!

!CDX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDIX.
	next := CDXI.! !


!classDefinition: #CDXC category: 'NaturalNumbers'!
II subclass: #CDXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXC class' category: 'NaturalNumbers'!
CDXC class
	instanceVariableNames: ''!

!CDXC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDLXXXIX.
	next := CDXCI.! !


!classDefinition: #CDXCI category: 'NaturalNumbers'!
II subclass: #CDXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCI class' category: 'NaturalNumbers'!
CDXCI class
	instanceVariableNames: ''!

!CDXCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXC.
	next := CDXCII.! !


!classDefinition: #CDXCII category: 'NaturalNumbers'!
II subclass: #CDXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCII class' category: 'NaturalNumbers'!
CDXCII class
	instanceVariableNames: ''!

!CDXCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXCI.
	next := CDXCIII.! !


!classDefinition: #CDXCIII category: 'NaturalNumbers'!
II subclass: #CDXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIII class' category: 'NaturalNumbers'!
CDXCIII class
	instanceVariableNames: ''!

!CDXCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXCII.
	next := CDXCIV.! !


!classDefinition: #CDXCIV category: 'NaturalNumbers'!
II subclass: #CDXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIV class' category: 'NaturalNumbers'!
CDXCIV class
	instanceVariableNames: ''!

!CDXCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXCIII.
	next := CDXCV.! !


!classDefinition: #CDXCIX category: 'NaturalNumbers'!
II subclass: #CDXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIX class' category: 'NaturalNumbers'!
CDXCIX class
	instanceVariableNames: ''!

!CDXCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXCVIII.
	next := D.! !


!classDefinition: #CDXCV category: 'NaturalNumbers'!
II subclass: #CDXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCV class' category: 'NaturalNumbers'!
CDXCV class
	instanceVariableNames: ''!

!CDXCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXCIV.
	next := CDXCVI.! !


!classDefinition: #CDXCVI category: 'NaturalNumbers'!
II subclass: #CDXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVI class' category: 'NaturalNumbers'!
CDXCVI class
	instanceVariableNames: ''!

!CDXCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXCV.
	next := CDXCVII.! !


!classDefinition: #CDXCVII category: 'NaturalNumbers'!
II subclass: #CDXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVII class' category: 'NaturalNumbers'!
CDXCVII class
	instanceVariableNames: ''!

!CDXCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXCVI.
	next := CDXCVIII.! !


!classDefinition: #CDXCVIII category: 'NaturalNumbers'!
II subclass: #CDXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVIII class' category: 'NaturalNumbers'!
CDXCVIII class
	instanceVariableNames: ''!

!CDXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXCVII.
	next := CDXCIX.! !


!classDefinition: #CDXI category: 'NaturalNumbers'!
II subclass: #CDXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXI class' category: 'NaturalNumbers'!
CDXI class
	instanceVariableNames: ''!

!CDXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDX.
	next := CDXII.! !


!classDefinition: #CDXII category: 'NaturalNumbers'!
II subclass: #CDXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXII class' category: 'NaturalNumbers'!
CDXII class
	instanceVariableNames: ''!

!CDXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXI.
	next := CDXIII.! !


!classDefinition: #CDXIII category: 'NaturalNumbers'!
II subclass: #CDXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIII class' category: 'NaturalNumbers'!
CDXIII class
	instanceVariableNames: ''!

!CDXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXII.
	next := CDXIV.! !


!classDefinition: #CDXIV category: 'NaturalNumbers'!
II subclass: #CDXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIV class' category: 'NaturalNumbers'!
CDXIV class
	instanceVariableNames: ''!

!CDXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXIII.
	next := CDXV.! !


!classDefinition: #CDXIX category: 'NaturalNumbers'!
II subclass: #CDXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIX class' category: 'NaturalNumbers'!
CDXIX class
	instanceVariableNames: ''!

!CDXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXVIII.
	next := CDXX.! !


!classDefinition: #CDXL category: 'NaturalNumbers'!
II subclass: #CDXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXL class' category: 'NaturalNumbers'!
CDXL class
	instanceVariableNames: ''!

!CDXL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXXIX.
	next := CDXLI.! !


!classDefinition: #CDXLI category: 'NaturalNumbers'!
II subclass: #CDXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLI class' category: 'NaturalNumbers'!
CDXLI class
	instanceVariableNames: ''!

!CDXLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXL.
	next := CDXLII.! !


!classDefinition: #CDXLII category: 'NaturalNumbers'!
II subclass: #CDXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLII class' category: 'NaturalNumbers'!
CDXLII class
	instanceVariableNames: ''!

!CDXLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXLI.
	next := CDXLIII.! !


!classDefinition: #CDXLIII category: 'NaturalNumbers'!
II subclass: #CDXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIII class' category: 'NaturalNumbers'!
CDXLIII class
	instanceVariableNames: ''!

!CDXLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXLII.
	next := CDXLIV.! !


!classDefinition: #CDXLIV category: 'NaturalNumbers'!
II subclass: #CDXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIV class' category: 'NaturalNumbers'!
CDXLIV class
	instanceVariableNames: ''!

!CDXLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXLIII.
	next := CDXLV.! !


!classDefinition: #CDXLIX category: 'NaturalNumbers'!
II subclass: #CDXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIX class' category: 'NaturalNumbers'!
CDXLIX class
	instanceVariableNames: ''!

!CDXLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXLVIII.
	next := CDL.! !


!classDefinition: #CDXLV category: 'NaturalNumbers'!
II subclass: #CDXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLV class' category: 'NaturalNumbers'!
CDXLV class
	instanceVariableNames: ''!

!CDXLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXLIV.
	next := CDXLVI.! !


!classDefinition: #CDXLVI category: 'NaturalNumbers'!
II subclass: #CDXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVI class' category: 'NaturalNumbers'!
CDXLVI class
	instanceVariableNames: ''!

!CDXLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXLV.
	next := CDXLVII.! !


!classDefinition: #CDXLVII category: 'NaturalNumbers'!
II subclass: #CDXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVII class' category: 'NaturalNumbers'!
CDXLVII class
	instanceVariableNames: ''!

!CDXLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXLVI.
	next := CDXLVIII.! !


!classDefinition: #CDXLVIII category: 'NaturalNumbers'!
II subclass: #CDXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVIII class' category: 'NaturalNumbers'!
CDXLVIII class
	instanceVariableNames: ''!

!CDXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXLVII.
	next := CDXLIX.! !


!classDefinition: #CDXV category: 'NaturalNumbers'!
II subclass: #CDXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXV class' category: 'NaturalNumbers'!
CDXV class
	instanceVariableNames: ''!

!CDXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXIV.
	next := CDXVI.! !


!classDefinition: #CDXVI category: 'NaturalNumbers'!
II subclass: #CDXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVI class' category: 'NaturalNumbers'!
CDXVI class
	instanceVariableNames: ''!

!CDXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXV.
	next := CDXVII.! !


!classDefinition: #CDXVII category: 'NaturalNumbers'!
II subclass: #CDXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVII class' category: 'NaturalNumbers'!
CDXVII class
	instanceVariableNames: ''!

!CDXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXVI.
	next := CDXVIII.! !


!classDefinition: #CDXVIII category: 'NaturalNumbers'!
II subclass: #CDXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVIII class' category: 'NaturalNumbers'!
CDXVIII class
	instanceVariableNames: ''!

!CDXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXVII.
	next := CDXIX.! !


!classDefinition: #CDXX category: 'NaturalNumbers'!
II subclass: #CDXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXX class' category: 'NaturalNumbers'!
CDXX class
	instanceVariableNames: ''!

!CDXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXIX.
	next := CDXXI.! !


!classDefinition: #CDXXI category: 'NaturalNumbers'!
II subclass: #CDXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXI class' category: 'NaturalNumbers'!
CDXXI class
	instanceVariableNames: ''!

!CDXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXX.
	next := CDXXII.! !


!classDefinition: #CDXXII category: 'NaturalNumbers'!
II subclass: #CDXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXII class' category: 'NaturalNumbers'!
CDXXII class
	instanceVariableNames: ''!

!CDXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXI.
	next := CDXXIII.! !


!classDefinition: #CDXXIII category: 'NaturalNumbers'!
II subclass: #CDXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIII class' category: 'NaturalNumbers'!
CDXXIII class
	instanceVariableNames: ''!

!CDXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXII.
	next := CDXXIV.! !


!classDefinition: #CDXXIV category: 'NaturalNumbers'!
II subclass: #CDXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIV class' category: 'NaturalNumbers'!
CDXXIV class
	instanceVariableNames: ''!

!CDXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXIII.
	next := CDXXV.! !


!classDefinition: #CDXXIX category: 'NaturalNumbers'!
II subclass: #CDXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIX class' category: 'NaturalNumbers'!
CDXXIX class
	instanceVariableNames: ''!

!CDXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXVIII.
	next := CDXXX.! !


!classDefinition: #CDXXV category: 'NaturalNumbers'!
II subclass: #CDXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXV class' category: 'NaturalNumbers'!
CDXXV class
	instanceVariableNames: ''!

!CDXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXIV.
	next := CDXXVI.! !


!classDefinition: #CDXXVI category: 'NaturalNumbers'!
II subclass: #CDXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVI class' category: 'NaturalNumbers'!
CDXXVI class
	instanceVariableNames: ''!

!CDXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXV.
	next := CDXXVII.! !


!classDefinition: #CDXXVII category: 'NaturalNumbers'!
II subclass: #CDXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVII class' category: 'NaturalNumbers'!
CDXXVII class
	instanceVariableNames: ''!

!CDXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXVI.
	next := CDXXVIII.! !


!classDefinition: #CDXXVIII category: 'NaturalNumbers'!
II subclass: #CDXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVIII class' category: 'NaturalNumbers'!
CDXXVIII class
	instanceVariableNames: ''!

!CDXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXVII.
	next := CDXXIX.! !


!classDefinition: #CDXXX category: 'NaturalNumbers'!
II subclass: #CDXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXX class' category: 'NaturalNumbers'!
CDXXX class
	instanceVariableNames: ''!

!CDXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXIX.
	next := CDXXXI.! !


!classDefinition: #CDXXXI category: 'NaturalNumbers'!
II subclass: #CDXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXI class' category: 'NaturalNumbers'!
CDXXXI class
	instanceVariableNames: ''!

!CDXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXX.
	next := CDXXXII.! !


!classDefinition: #CDXXXII category: 'NaturalNumbers'!
II subclass: #CDXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXII class' category: 'NaturalNumbers'!
CDXXXII class
	instanceVariableNames: ''!

!CDXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXXI.
	next := CDXXXIII.! !


!classDefinition: #CDXXXIII category: 'NaturalNumbers'!
II subclass: #CDXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIII class' category: 'NaturalNumbers'!
CDXXXIII class
	instanceVariableNames: ''!

!CDXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXXII.
	next := CDXXXIV.! !


!classDefinition: #CDXXXIV category: 'NaturalNumbers'!
II subclass: #CDXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIV class' category: 'NaturalNumbers'!
CDXXXIV class
	instanceVariableNames: ''!

!CDXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXXIII.
	next := CDXXXV.! !


!classDefinition: #CDXXXIX category: 'NaturalNumbers'!
II subclass: #CDXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIX class' category: 'NaturalNumbers'!
CDXXXIX class
	instanceVariableNames: ''!

!CDXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXXVIII.
	next := CDXL.! !


!classDefinition: #CDXXXV category: 'NaturalNumbers'!
II subclass: #CDXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXV class' category: 'NaturalNumbers'!
CDXXXV class
	instanceVariableNames: ''!

!CDXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXXIV.
	next := CDXXXVI.! !


!classDefinition: #CDXXXVI category: 'NaturalNumbers'!
II subclass: #CDXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVI class' category: 'NaturalNumbers'!
CDXXXVI class
	instanceVariableNames: ''!

!CDXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXXV.
	next := CDXXXVII.! !


!classDefinition: #CDXXXVII category: 'NaturalNumbers'!
II subclass: #CDXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVII class' category: 'NaturalNumbers'!
CDXXXVII class
	instanceVariableNames: ''!

!CDXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXXVI.
	next := CDXXXVIII.! !


!classDefinition: #CDXXXVIII category: 'NaturalNumbers'!
II subclass: #CDXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVIII class' category: 'NaturalNumbers'!
CDXXXVIII class
	instanceVariableNames: ''!

!CDXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXXXVII.
	next := CDXXXIX.! !


!classDefinition: #CI category: 'NaturalNumbers'!
II subclass: #CI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CI class' category: 'NaturalNumbers'!
CI class
	instanceVariableNames: ''!

!CI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := C.
	next := CII.! !


!classDefinition: #CII category: 'NaturalNumbers'!
II subclass: #CII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CII class' category: 'NaturalNumbers'!
CII class
	instanceVariableNames: ''!

!CII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CI.
	next := CIII.! !


!classDefinition: #CIII category: 'NaturalNumbers'!
II subclass: #CIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIII class' category: 'NaturalNumbers'!
CIII class
	instanceVariableNames: ''!

!CIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CII.
	next := CIV.! !


!classDefinition: #CIV category: 'NaturalNumbers'!
II subclass: #CIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIV class' category: 'NaturalNumbers'!
CIV class
	instanceVariableNames: ''!

!CIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CIII.
	next := CV.! !


!classDefinition: #CIX category: 'NaturalNumbers'!
II subclass: #CIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIX class' category: 'NaturalNumbers'!
CIX class
	instanceVariableNames: ''!

!CIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CVIII.
	next := CX.! !


!classDefinition: #CL category: 'NaturalNumbers'!
II subclass: #CL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CL class' category: 'NaturalNumbers'!
CL class
	instanceVariableNames: ''!

!CL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXLIX.
	next := CLI.! !


!classDefinition: #CLI category: 'NaturalNumbers'!
II subclass: #CLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLI class' category: 'NaturalNumbers'!
CLI class
	instanceVariableNames: ''!

!CLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CL.
	next := CLII.! !


!classDefinition: #CLII category: 'NaturalNumbers'!
II subclass: #CLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLII class' category: 'NaturalNumbers'!
CLII class
	instanceVariableNames: ''!

!CLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLI.
	next := CLIII.! !


!classDefinition: #CLIII category: 'NaturalNumbers'!
II subclass: #CLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIII class' category: 'NaturalNumbers'!
CLIII class
	instanceVariableNames: ''!

!CLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLII.
	next := CLIV.! !


!classDefinition: #CLIV category: 'NaturalNumbers'!
II subclass: #CLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIV class' category: 'NaturalNumbers'!
CLIV class
	instanceVariableNames: ''!

!CLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLIII.
	next := CLV.! !


!classDefinition: #CLIX category: 'NaturalNumbers'!
II subclass: #CLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIX class' category: 'NaturalNumbers'!
CLIX class
	instanceVariableNames: ''!

!CLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLVIII.
	next := CLX.! !


!classDefinition: #CLV category: 'NaturalNumbers'!
II subclass: #CLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLV class' category: 'NaturalNumbers'!
CLV class
	instanceVariableNames: ''!

!CLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLIV.
	next := CLVI.! !


!classDefinition: #CLVI category: 'NaturalNumbers'!
II subclass: #CLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVI class' category: 'NaturalNumbers'!
CLVI class
	instanceVariableNames: ''!

!CLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLV.
	next := CLVII.! !


!classDefinition: #CLVII category: 'NaturalNumbers'!
II subclass: #CLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVII class' category: 'NaturalNumbers'!
CLVII class
	instanceVariableNames: ''!

!CLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLVI.
	next := CLVIII.! !


!classDefinition: #CLVIII category: 'NaturalNumbers'!
II subclass: #CLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVIII class' category: 'NaturalNumbers'!
CLVIII class
	instanceVariableNames: ''!

!CLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLVII.
	next := CLIX.! !


!classDefinition: #CLX category: 'NaturalNumbers'!
II subclass: #CLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLX class' category: 'NaturalNumbers'!
CLX class
	instanceVariableNames: ''!

!CLX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLIX.
	next := CLXI.! !


!classDefinition: #CLXI category: 'NaturalNumbers'!
II subclass: #CLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXI class' category: 'NaturalNumbers'!
CLXI class
	instanceVariableNames: ''!

!CLXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLX.
	next := CLXII.! !


!classDefinition: #CLXII category: 'NaturalNumbers'!
II subclass: #CLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXII class' category: 'NaturalNumbers'!
CLXII class
	instanceVariableNames: ''!

!CLXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXI.
	next := CLXIII.! !


!classDefinition: #CLXIII category: 'NaturalNumbers'!
II subclass: #CLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIII class' category: 'NaturalNumbers'!
CLXIII class
	instanceVariableNames: ''!

!CLXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXII.
	next := CLXIV.! !


!classDefinition: #CLXIV category: 'NaturalNumbers'!
II subclass: #CLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIV class' category: 'NaturalNumbers'!
CLXIV class
	instanceVariableNames: ''!

!CLXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXIII.
	next := CLXV.! !


!classDefinition: #CLXIX category: 'NaturalNumbers'!
II subclass: #CLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIX class' category: 'NaturalNumbers'!
CLXIX class
	instanceVariableNames: ''!

!CLXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXVIII.
	next := CLXX.! !


!classDefinition: #CLXV category: 'NaturalNumbers'!
II subclass: #CLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXV class' category: 'NaturalNumbers'!
CLXV class
	instanceVariableNames: ''!

!CLXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXIV.
	next := CLXVI.! !


!classDefinition: #CLXVI category: 'NaturalNumbers'!
II subclass: #CLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVI class' category: 'NaturalNumbers'!
CLXVI class
	instanceVariableNames: ''!

!CLXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXV.
	next := CLXVII.! !


!classDefinition: #CLXVII category: 'NaturalNumbers'!
II subclass: #CLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVII class' category: 'NaturalNumbers'!
CLXVII class
	instanceVariableNames: ''!

!CLXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXVI.
	next := CLXVIII.! !


!classDefinition: #CLXVIII category: 'NaturalNumbers'!
II subclass: #CLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVIII class' category: 'NaturalNumbers'!
CLXVIII class
	instanceVariableNames: ''!

!CLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXVII.
	next := CLXIX.! !


!classDefinition: #CLXX category: 'NaturalNumbers'!
II subclass: #CLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXX class' category: 'NaturalNumbers'!
CLXX class
	instanceVariableNames: ''!

!CLXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXIX.
	next := CLXXI.! !


!classDefinition: #CLXXI category: 'NaturalNumbers'!
II subclass: #CLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXI class' category: 'NaturalNumbers'!
CLXXI class
	instanceVariableNames: ''!

!CLXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXX.
	next := CLXXII.! !


!classDefinition: #CLXXII category: 'NaturalNumbers'!
II subclass: #CLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXII class' category: 'NaturalNumbers'!
CLXXII class
	instanceVariableNames: ''!

!CLXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXI.
	next := CLXXIII.! !


!classDefinition: #CLXXIII category: 'NaturalNumbers'!
II subclass: #CLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIII class' category: 'NaturalNumbers'!
CLXXIII class
	instanceVariableNames: ''!

!CLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXII.
	next := CLXXIV.! !


!classDefinition: #CLXXIV category: 'NaturalNumbers'!
II subclass: #CLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIV class' category: 'NaturalNumbers'!
CLXXIV class
	instanceVariableNames: ''!

!CLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXIII.
	next := CLXXV.! !


!classDefinition: #CLXXIX category: 'NaturalNumbers'!
II subclass: #CLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIX class' category: 'NaturalNumbers'!
CLXXIX class
	instanceVariableNames: ''!

!CLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXVIII.
	next := CLXXX.! !


!classDefinition: #CLXXV category: 'NaturalNumbers'!
II subclass: #CLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXV class' category: 'NaturalNumbers'!
CLXXV class
	instanceVariableNames: ''!

!CLXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXIV.
	next := CLXXVI.! !


!classDefinition: #CLXXVI category: 'NaturalNumbers'!
II subclass: #CLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVI class' category: 'NaturalNumbers'!
CLXXVI class
	instanceVariableNames: ''!

!CLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXV.
	next := CLXXVII.! !


!classDefinition: #CLXXVII category: 'NaturalNumbers'!
II subclass: #CLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVII class' category: 'NaturalNumbers'!
CLXXVII class
	instanceVariableNames: ''!

!CLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXVI.
	next := CLXXVIII.! !


!classDefinition: #CLXXVIII category: 'NaturalNumbers'!
II subclass: #CLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVIII class' category: 'NaturalNumbers'!
CLXXVIII class
	instanceVariableNames: ''!

!CLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXVII.
	next := CLXXIX.! !


!classDefinition: #CLXXX category: 'NaturalNumbers'!
II subclass: #CLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXX class' category: 'NaturalNumbers'!
CLXXX class
	instanceVariableNames: ''!

!CLXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXIX.
	next := CLXXXI.! !


!classDefinition: #CLXXXI category: 'NaturalNumbers'!
II subclass: #CLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXI class' category: 'NaturalNumbers'!
CLXXXI class
	instanceVariableNames: ''!

!CLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXX.
	next := CLXXXII.! !


!classDefinition: #CLXXXII category: 'NaturalNumbers'!
II subclass: #CLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXII class' category: 'NaturalNumbers'!
CLXXXII class
	instanceVariableNames: ''!

!CLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXXI.
	next := CLXXXIII.! !


!classDefinition: #CLXXXIII category: 'NaturalNumbers'!
II subclass: #CLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIII class' category: 'NaturalNumbers'!
CLXXXIII class
	instanceVariableNames: ''!

!CLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXXII.
	next := CLXXXIV.! !


!classDefinition: #CLXXXIV category: 'NaturalNumbers'!
II subclass: #CLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIV class' category: 'NaturalNumbers'!
CLXXXIV class
	instanceVariableNames: ''!

!CLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXXIII.
	next := CLXXXV.! !


!classDefinition: #CLXXXIX category: 'NaturalNumbers'!
II subclass: #CLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIX class' category: 'NaturalNumbers'!
CLXXXIX class
	instanceVariableNames: ''!

!CLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXXVIII.
	next := CXC.! !


!classDefinition: #CLXXXV category: 'NaturalNumbers'!
II subclass: #CLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXV class' category: 'NaturalNumbers'!
CLXXXV class
	instanceVariableNames: ''!

!CLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXXIV.
	next := CLXXXVI.! !


!classDefinition: #CLXXXVI category: 'NaturalNumbers'!
II subclass: #CLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVI class' category: 'NaturalNumbers'!
CLXXXVI class
	instanceVariableNames: ''!

!CLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXXV.
	next := CLXXXVII.! !


!classDefinition: #CLXXXVII category: 'NaturalNumbers'!
II subclass: #CLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVII class' category: 'NaturalNumbers'!
CLXXXVII class
	instanceVariableNames: ''!

!CLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXXVI.
	next := CLXXXVIII.! !


!classDefinition: #CLXXXVIII category: 'NaturalNumbers'!
II subclass: #CLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVIII class' category: 'NaturalNumbers'!
CLXXXVIII class
	instanceVariableNames: ''!

!CLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXXVII.
	next := CLXXXIX.! !


!classDefinition: #CV category: 'NaturalNumbers'!
II subclass: #CV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CV class' category: 'NaturalNumbers'!
CV class
	instanceVariableNames: ''!

!CV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CIV.
	next := CVI.! !


!classDefinition: #CVI category: 'NaturalNumbers'!
II subclass: #CVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVI class' category: 'NaturalNumbers'!
CVI class
	instanceVariableNames: ''!

!CVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CV.
	next := CVII.! !


!classDefinition: #CVII category: 'NaturalNumbers'!
II subclass: #CVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVII class' category: 'NaturalNumbers'!
CVII class
	instanceVariableNames: ''!

!CVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CVI.
	next := CVIII.! !


!classDefinition: #CVIII category: 'NaturalNumbers'!
II subclass: #CVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVIII class' category: 'NaturalNumbers'!
CVIII class
	instanceVariableNames: ''!

!CVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CVII.
	next := CIX.! !


!classDefinition: #CX category: 'NaturalNumbers'!
II subclass: #CX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CX class' category: 'NaturalNumbers'!
CX class
	instanceVariableNames: ''!

!CX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CIX.
	next := CXI.! !


!classDefinition: #CXC category: 'NaturalNumbers'!
II subclass: #CXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXC class' category: 'NaturalNumbers'!
CXC class
	instanceVariableNames: ''!

!CXC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CLXXXIX.
	next := CXCI.! !


!classDefinition: #CXCI category: 'NaturalNumbers'!
II subclass: #CXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCI class' category: 'NaturalNumbers'!
CXCI class
	instanceVariableNames: ''!

!CXCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXC.
	next := CXCII.! !


!classDefinition: #CXCII category: 'NaturalNumbers'!
II subclass: #CXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCII class' category: 'NaturalNumbers'!
CXCII class
	instanceVariableNames: ''!

!CXCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXCI.
	next := CXCIII.! !


!classDefinition: #CXCIII category: 'NaturalNumbers'!
II subclass: #CXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIII class' category: 'NaturalNumbers'!
CXCIII class
	instanceVariableNames: ''!

!CXCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXCII.
	next := CXCIV.! !


!classDefinition: #CXCIV category: 'NaturalNumbers'!
II subclass: #CXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIV class' category: 'NaturalNumbers'!
CXCIV class
	instanceVariableNames: ''!

!CXCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXCIII.
	next := CXCV.! !


!classDefinition: #CXCIX category: 'NaturalNumbers'!
II subclass: #CXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIX class' category: 'NaturalNumbers'!
CXCIX class
	instanceVariableNames: ''!

!CXCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXCVIII.
	next := CC.! !


!classDefinition: #CXCV category: 'NaturalNumbers'!
II subclass: #CXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCV class' category: 'NaturalNumbers'!
CXCV class
	instanceVariableNames: ''!

!CXCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXCIV.
	next := CXCVI.! !


!classDefinition: #CXCVI category: 'NaturalNumbers'!
II subclass: #CXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVI class' category: 'NaturalNumbers'!
CXCVI class
	instanceVariableNames: ''!

!CXCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXCV.
	next := CXCVII.! !


!classDefinition: #CXCVII category: 'NaturalNumbers'!
II subclass: #CXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVII class' category: 'NaturalNumbers'!
CXCVII class
	instanceVariableNames: ''!

!CXCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXCVI.
	next := CXCVIII.! !


!classDefinition: #CXCVIII category: 'NaturalNumbers'!
II subclass: #CXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVIII class' category: 'NaturalNumbers'!
CXCVIII class
	instanceVariableNames: ''!

!CXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXCVII.
	next := CXCIX.! !


!classDefinition: #CXI category: 'NaturalNumbers'!
II subclass: #CXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXI class' category: 'NaturalNumbers'!
CXI class
	instanceVariableNames: ''!

!CXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CX.
	next := CXII.! !


!classDefinition: #CXII category: 'NaturalNumbers'!
II subclass: #CXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXII class' category: 'NaturalNumbers'!
CXII class
	instanceVariableNames: ''!

!CXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXI.
	next := CXIII.! !


!classDefinition: #CXIII category: 'NaturalNumbers'!
II subclass: #CXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIII class' category: 'NaturalNumbers'!
CXIII class
	instanceVariableNames: ''!

!CXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXII.
	next := CXIV.! !


!classDefinition: #CXIV category: 'NaturalNumbers'!
II subclass: #CXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIV class' category: 'NaturalNumbers'!
CXIV class
	instanceVariableNames: ''!

!CXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXIII.
	next := CXV.! !


!classDefinition: #CXIX category: 'NaturalNumbers'!
II subclass: #CXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIX class' category: 'NaturalNumbers'!
CXIX class
	instanceVariableNames: ''!

!CXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXVIII.
	next := CXX.! !


!classDefinition: #CXL category: 'NaturalNumbers'!
II subclass: #CXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXL class' category: 'NaturalNumbers'!
CXL class
	instanceVariableNames: ''!

!CXL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXXIX.
	next := CXLI.! !


!classDefinition: #CXLI category: 'NaturalNumbers'!
II subclass: #CXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLI class' category: 'NaturalNumbers'!
CXLI class
	instanceVariableNames: ''!

!CXLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXL.
	next := CXLII.! !


!classDefinition: #CXLII category: 'NaturalNumbers'!
II subclass: #CXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLII class' category: 'NaturalNumbers'!
CXLII class
	instanceVariableNames: ''!

!CXLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXLI.
	next := CXLIII.! !


!classDefinition: #CXLIII category: 'NaturalNumbers'!
II subclass: #CXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIII class' category: 'NaturalNumbers'!
CXLIII class
	instanceVariableNames: ''!

!CXLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXLII.
	next := CXLIV.! !


!classDefinition: #CXLIV category: 'NaturalNumbers'!
II subclass: #CXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIV class' category: 'NaturalNumbers'!
CXLIV class
	instanceVariableNames: ''!

!CXLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXLIII.
	next := CXLV.! !


!classDefinition: #CXLIX category: 'NaturalNumbers'!
II subclass: #CXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIX class' category: 'NaturalNumbers'!
CXLIX class
	instanceVariableNames: ''!

!CXLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXLVIII.
	next := CL.! !


!classDefinition: #CXLV category: 'NaturalNumbers'!
II subclass: #CXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLV class' category: 'NaturalNumbers'!
CXLV class
	instanceVariableNames: ''!

!CXLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXLIV.
	next := CXLVI.! !


!classDefinition: #CXLVI category: 'NaturalNumbers'!
II subclass: #CXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVI class' category: 'NaturalNumbers'!
CXLVI class
	instanceVariableNames: ''!

!CXLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXLV.
	next := CXLVII.! !


!classDefinition: #CXLVII category: 'NaturalNumbers'!
II subclass: #CXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVII class' category: 'NaturalNumbers'!
CXLVII class
	instanceVariableNames: ''!

!CXLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXLVI.
	next := CXLVIII.! !


!classDefinition: #CXLVIII category: 'NaturalNumbers'!
II subclass: #CXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVIII class' category: 'NaturalNumbers'!
CXLVIII class
	instanceVariableNames: ''!

!CXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXLVII.
	next := CXLIX.! !


!classDefinition: #CXV category: 'NaturalNumbers'!
II subclass: #CXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXV class' category: 'NaturalNumbers'!
CXV class
	instanceVariableNames: ''!

!CXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXIV.
	next := CXVI.! !


!classDefinition: #CXVI category: 'NaturalNumbers'!
II subclass: #CXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVI class' category: 'NaturalNumbers'!
CXVI class
	instanceVariableNames: ''!

!CXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXV.
	next := CXVII.! !


!classDefinition: #CXVII category: 'NaturalNumbers'!
II subclass: #CXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVII class' category: 'NaturalNumbers'!
CXVII class
	instanceVariableNames: ''!

!CXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXVI.
	next := CXVIII.! !


!classDefinition: #CXVIII category: 'NaturalNumbers'!
II subclass: #CXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVIII class' category: 'NaturalNumbers'!
CXVIII class
	instanceVariableNames: ''!

!CXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXVII.
	next := CXIX.! !


!classDefinition: #CXX category: 'NaturalNumbers'!
II subclass: #CXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXX class' category: 'NaturalNumbers'!
CXX class
	instanceVariableNames: ''!

!CXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXIX.
	next := CXXI.! !


!classDefinition: #CXXI category: 'NaturalNumbers'!
II subclass: #CXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXI class' category: 'NaturalNumbers'!
CXXI class
	instanceVariableNames: ''!

!CXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXX.
	next := CXXII.! !


!classDefinition: #CXXII category: 'NaturalNumbers'!
II subclass: #CXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXII class' category: 'NaturalNumbers'!
CXXII class
	instanceVariableNames: ''!

!CXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXI.
	next := CXXIII.! !


!classDefinition: #CXXIII category: 'NaturalNumbers'!
II subclass: #CXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIII class' category: 'NaturalNumbers'!
CXXIII class
	instanceVariableNames: ''!

!CXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXII.
	next := CXXIV.! !


!classDefinition: #CXXIV category: 'NaturalNumbers'!
II subclass: #CXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIV class' category: 'NaturalNumbers'!
CXXIV class
	instanceVariableNames: ''!

!CXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXIII.
	next := CXXV.! !


!classDefinition: #CXXIX category: 'NaturalNumbers'!
II subclass: #CXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIX class' category: 'NaturalNumbers'!
CXXIX class
	instanceVariableNames: ''!

!CXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXVIII.
	next := CXXX.! !


!classDefinition: #CXXV category: 'NaturalNumbers'!
II subclass: #CXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXV class' category: 'NaturalNumbers'!
CXXV class
	instanceVariableNames: ''!

!CXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXIV.
	next := CXXVI.! !


!classDefinition: #CXXVI category: 'NaturalNumbers'!
II subclass: #CXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVI class' category: 'NaturalNumbers'!
CXXVI class
	instanceVariableNames: ''!

!CXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXV.
	next := CXXVII.! !


!classDefinition: #CXXVII category: 'NaturalNumbers'!
II subclass: #CXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVII class' category: 'NaturalNumbers'!
CXXVII class
	instanceVariableNames: ''!

!CXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXVI.
	next := CXXVIII.! !


!classDefinition: #CXXVIII category: 'NaturalNumbers'!
II subclass: #CXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVIII class' category: 'NaturalNumbers'!
CXXVIII class
	instanceVariableNames: ''!

!CXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXVII.
	next := CXXIX.! !


!classDefinition: #CXXX category: 'NaturalNumbers'!
II subclass: #CXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXX class' category: 'NaturalNumbers'!
CXXX class
	instanceVariableNames: ''!

!CXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXIX.
	next := CXXXI.! !


!classDefinition: #CXXXI category: 'NaturalNumbers'!
II subclass: #CXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXI class' category: 'NaturalNumbers'!
CXXXI class
	instanceVariableNames: ''!

!CXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXX.
	next := CXXXII.! !


!classDefinition: #CXXXII category: 'NaturalNumbers'!
II subclass: #CXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXII class' category: 'NaturalNumbers'!
CXXXII class
	instanceVariableNames: ''!

!CXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXXI.
	next := CXXXIII.! !


!classDefinition: #CXXXIII category: 'NaturalNumbers'!
II subclass: #CXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIII class' category: 'NaturalNumbers'!
CXXXIII class
	instanceVariableNames: ''!

!CXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXXII.
	next := CXXXIV.! !


!classDefinition: #CXXXIV category: 'NaturalNumbers'!
II subclass: #CXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIV class' category: 'NaturalNumbers'!
CXXXIV class
	instanceVariableNames: ''!

!CXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXXIII.
	next := CXXXV.! !


!classDefinition: #CXXXIX category: 'NaturalNumbers'!
II subclass: #CXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIX class' category: 'NaturalNumbers'!
CXXXIX class
	instanceVariableNames: ''!

!CXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXXVIII.
	next := CXL.! !


!classDefinition: #CXXXV category: 'NaturalNumbers'!
II subclass: #CXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXV class' category: 'NaturalNumbers'!
CXXXV class
	instanceVariableNames: ''!

!CXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXXIV.
	next := CXXXVI.! !


!classDefinition: #CXXXVI category: 'NaturalNumbers'!
II subclass: #CXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVI class' category: 'NaturalNumbers'!
CXXXVI class
	instanceVariableNames: ''!

!CXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXXV.
	next := CXXXVII.! !


!classDefinition: #CXXXVII category: 'NaturalNumbers'!
II subclass: #CXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVII class' category: 'NaturalNumbers'!
CXXXVII class
	instanceVariableNames: ''!

!CXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXXVI.
	next := CXXXVIII.! !


!classDefinition: #CXXXVIII category: 'NaturalNumbers'!
II subclass: #CXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVIII class' category: 'NaturalNumbers'!
CXXXVIII class
	instanceVariableNames: ''!

!CXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CXXXVII.
	next := CXXXIX.! !


!classDefinition: #D category: 'NaturalNumbers'!
II subclass: #D
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'D class' category: 'NaturalNumbers'!
D class
	instanceVariableNames: ''!

!D class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := CDXCIX.
	next := DI.! !


!classDefinition: #DC category: 'NaturalNumbers'!
II subclass: #DC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DC class' category: 'NaturalNumbers'!
DC class
	instanceVariableNames: ''!

!DC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXCIX.
	next := DCI.! !


!classDefinition: #DCC category: 'NaturalNumbers'!
II subclass: #DCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCC class' category: 'NaturalNumbers'!
DCC class
	instanceVariableNames: ''!

!DCC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXCIX.
	next := DCCI.! !


!classDefinition: #DCCC category: 'NaturalNumbers'!
II subclass: #DCCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCC class' category: 'NaturalNumbers'!
DCCC class
	instanceVariableNames: ''!

!DCCC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXCIX.
	next := DCCCI.! !


!classDefinition: #DCCCI category: 'NaturalNumbers'!
II subclass: #DCCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCI class' category: 'NaturalNumbers'!
DCCCI class
	instanceVariableNames: ''!

!DCCCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCC.
	next := DCCCII.! !


!classDefinition: #DCCCII category: 'NaturalNumbers'!
II subclass: #DCCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCII class' category: 'NaturalNumbers'!
DCCCII class
	instanceVariableNames: ''!

!DCCCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCI.
	next := DCCCIII.! !


!classDefinition: #DCCCIII category: 'NaturalNumbers'!
II subclass: #DCCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCIII class' category: 'NaturalNumbers'!
DCCCIII class
	instanceVariableNames: ''!

!DCCCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCII.
	next := DCCCIV.! !


!classDefinition: #DCCCIV category: 'NaturalNumbers'!
II subclass: #DCCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCIV class' category: 'NaturalNumbers'!
DCCCIV class
	instanceVariableNames: ''!

!DCCCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCIII.
	next := DCCCV.! !


!classDefinition: #DCCCIX category: 'NaturalNumbers'!
II subclass: #DCCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCIX class' category: 'NaturalNumbers'!
DCCCIX class
	instanceVariableNames: ''!

!DCCCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCVIII.
	next := DCCCX.! !


!classDefinition: #DCCCL category: 'NaturalNumbers'!
II subclass: #DCCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCL class' category: 'NaturalNumbers'!
DCCCL class
	instanceVariableNames: ''!

!DCCCL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXLIX.
	next := DCCCLI.! !


!classDefinition: #DCCCLI category: 'NaturalNumbers'!
II subclass: #DCCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLI class' category: 'NaturalNumbers'!
DCCCLI class
	instanceVariableNames: ''!

!DCCCLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCL.
	next := nil.! !


!classDefinition: #DCCCLII category: 'NaturalNumbers'!
II subclass: #DCCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLII class' category: 'NaturalNumbers'!
DCCCLII class
	instanceVariableNames: ''!

!DCCCLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := nil.
	next := nil.! !


!classDefinition: #DCCCV category: 'NaturalNumbers'!
II subclass: #DCCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCV class' category: 'NaturalNumbers'!
DCCCV class
	instanceVariableNames: ''!

!DCCCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCIV.
	next := DCCCVI.! !


!classDefinition: #DCCCVI category: 'NaturalNumbers'!
II subclass: #DCCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCVI class' category: 'NaturalNumbers'!
DCCCVI class
	instanceVariableNames: ''!

!DCCCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCV.
	next := DCCCVII.! !


!classDefinition: #DCCCVII category: 'NaturalNumbers'!
II subclass: #DCCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCVII class' category: 'NaturalNumbers'!
DCCCVII class
	instanceVariableNames: ''!

!DCCCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCVI.
	next := DCCCVIII.! !


!classDefinition: #DCCCVIII category: 'NaturalNumbers'!
II subclass: #DCCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCVIII class' category: 'NaturalNumbers'!
DCCCVIII class
	instanceVariableNames: ''!

!DCCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCVII.
	next := DCCCIX.! !


!classDefinition: #DCCCX category: 'NaturalNumbers'!
II subclass: #DCCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCX class' category: 'NaturalNumbers'!
DCCCX class
	instanceVariableNames: ''!

!DCCCX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCIX.
	next := DCCCXI.! !


!classDefinition: #DCCCXI category: 'NaturalNumbers'!
II subclass: #DCCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXI class' category: 'NaturalNumbers'!
DCCCXI class
	instanceVariableNames: ''!

!DCCCXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCX.
	next := DCCCXII.! !


!classDefinition: #DCCCXII category: 'NaturalNumbers'!
II subclass: #DCCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXII class' category: 'NaturalNumbers'!
DCCCXII class
	instanceVariableNames: ''!

!DCCCXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXI.
	next := DCCCXIII.! !


!classDefinition: #DCCCXIII category: 'NaturalNumbers'!
II subclass: #DCCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXIII class' category: 'NaturalNumbers'!
DCCCXIII class
	instanceVariableNames: ''!

!DCCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXII.
	next := DCCCXIV.! !


!classDefinition: #DCCCXIV category: 'NaturalNumbers'!
II subclass: #DCCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXIV class' category: 'NaturalNumbers'!
DCCCXIV class
	instanceVariableNames: ''!

!DCCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXIII.
	next := DCCCXV.! !


!classDefinition: #DCCCXIX category: 'NaturalNumbers'!
II subclass: #DCCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXIX class' category: 'NaturalNumbers'!
DCCCXIX class
	instanceVariableNames: ''!

!DCCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXVIII.
	next := DCCCXX.! !


!classDefinition: #DCCCXL category: 'NaturalNumbers'!
II subclass: #DCCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXL class' category: 'NaturalNumbers'!
DCCCXL class
	instanceVariableNames: ''!

!DCCCXL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXXIX.
	next := DCCCXLI.! !


!classDefinition: #DCCCXLI category: 'NaturalNumbers'!
II subclass: #DCCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLI class' category: 'NaturalNumbers'!
DCCCXLI class
	instanceVariableNames: ''!

!DCCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXL.
	next := DCCCXLII.! !


!classDefinition: #DCCCXLII category: 'NaturalNumbers'!
II subclass: #DCCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLII class' category: 'NaturalNumbers'!
DCCCXLII class
	instanceVariableNames: ''!

!DCCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXLI.
	next := DCCCXLIII.! !


!classDefinition: #DCCCXLIII category: 'NaturalNumbers'!
II subclass: #DCCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLIII class' category: 'NaturalNumbers'!
DCCCXLIII class
	instanceVariableNames: ''!

!DCCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXLII.
	next := DCCCXLIV.! !


!classDefinition: #DCCCXLIV category: 'NaturalNumbers'!
II subclass: #DCCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLIV class' category: 'NaturalNumbers'!
DCCCXLIV class
	instanceVariableNames: ''!

!DCCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXLIII.
	next := DCCCXLV.! !


!classDefinition: #DCCCXLIX category: 'NaturalNumbers'!
II subclass: #DCCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLIX class' category: 'NaturalNumbers'!
DCCCXLIX class
	instanceVariableNames: ''!

!DCCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXLVIII.
	next := DCCCL.! !


!classDefinition: #DCCCXLV category: 'NaturalNumbers'!
II subclass: #DCCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLV class' category: 'NaturalNumbers'!
DCCCXLV class
	instanceVariableNames: ''!

!DCCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXLIV.
	next := DCCCXLVI.! !


!classDefinition: #DCCCXLVI category: 'NaturalNumbers'!
II subclass: #DCCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLVI class' category: 'NaturalNumbers'!
DCCCXLVI class
	instanceVariableNames: ''!

!DCCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXLV.
	next := DCCCXLVII.! !


!classDefinition: #DCCCXLVII category: 'NaturalNumbers'!
II subclass: #DCCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLVII class' category: 'NaturalNumbers'!
DCCCXLVII class
	instanceVariableNames: ''!

!DCCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXLVI.
	next := DCCCXLVIII.! !


!classDefinition: #DCCCXLVIII category: 'NaturalNumbers'!
II subclass: #DCCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLVIII class' category: 'NaturalNumbers'!
DCCCXLVIII class
	instanceVariableNames: ''!

!DCCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXLVII.
	next := DCCCXLIX.! !


!classDefinition: #DCCCXV category: 'NaturalNumbers'!
II subclass: #DCCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXV class' category: 'NaturalNumbers'!
DCCCXV class
	instanceVariableNames: ''!

!DCCCXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXIV.
	next := DCCCXVI.! !


!classDefinition: #DCCCXVI category: 'NaturalNumbers'!
II subclass: #DCCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXVI class' category: 'NaturalNumbers'!
DCCCXVI class
	instanceVariableNames: ''!

!DCCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXV.
	next := DCCCXVII.! !


!classDefinition: #DCCCXVII category: 'NaturalNumbers'!
II subclass: #DCCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXVII class' category: 'NaturalNumbers'!
DCCCXVII class
	instanceVariableNames: ''!

!DCCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXVI.
	next := DCCCXVIII.! !


!classDefinition: #DCCCXVIII category: 'NaturalNumbers'!
II subclass: #DCCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXVIII class' category: 'NaturalNumbers'!
DCCCXVIII class
	instanceVariableNames: ''!

!DCCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXVII.
	next := DCCCXIX.! !


!classDefinition: #DCCCXX category: 'NaturalNumbers'!
II subclass: #DCCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXX class' category: 'NaturalNumbers'!
DCCCXX class
	instanceVariableNames: ''!

!DCCCXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXIX.
	next := DCCCXXI.! !


!classDefinition: #DCCCXXI category: 'NaturalNumbers'!
II subclass: #DCCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXI class' category: 'NaturalNumbers'!
DCCCXXI class
	instanceVariableNames: ''!

!DCCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXX.
	next := DCCCXXII.! !


!classDefinition: #DCCCXXII category: 'NaturalNumbers'!
II subclass: #DCCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXII class' category: 'NaturalNumbers'!
DCCCXXII class
	instanceVariableNames: ''!

!DCCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXI.
	next := DCCCXXIII.! !


!classDefinition: #DCCCXXIII category: 'NaturalNumbers'!
II subclass: #DCCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXIII class' category: 'NaturalNumbers'!
DCCCXXIII class
	instanceVariableNames: ''!

!DCCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXII.
	next := DCCCXXIV.! !


!classDefinition: #DCCCXXIV category: 'NaturalNumbers'!
II subclass: #DCCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXIV class' category: 'NaturalNumbers'!
DCCCXXIV class
	instanceVariableNames: ''!

!DCCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXIII.
	next := DCCCXXV.! !


!classDefinition: #DCCCXXIX category: 'NaturalNumbers'!
II subclass: #DCCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXIX class' category: 'NaturalNumbers'!
DCCCXXIX class
	instanceVariableNames: ''!

!DCCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXVIII.
	next := DCCCXXX.! !


!classDefinition: #DCCCXXV category: 'NaturalNumbers'!
II subclass: #DCCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXV class' category: 'NaturalNumbers'!
DCCCXXV class
	instanceVariableNames: ''!

!DCCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXIV.
	next := DCCCXXVI.! !


!classDefinition: #DCCCXXVI category: 'NaturalNumbers'!
II subclass: #DCCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXVI class' category: 'NaturalNumbers'!
DCCCXXVI class
	instanceVariableNames: ''!

!DCCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXV.
	next := DCCCXXVII.! !


!classDefinition: #DCCCXXVII category: 'NaturalNumbers'!
II subclass: #DCCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXVII class' category: 'NaturalNumbers'!
DCCCXXVII class
	instanceVariableNames: ''!

!DCCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXVI.
	next := DCCCXXVIII.! !


!classDefinition: #DCCCXXVIII category: 'NaturalNumbers'!
II subclass: #DCCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXVIII class' category: 'NaturalNumbers'!
DCCCXXVIII class
	instanceVariableNames: ''!

!DCCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXVII.
	next := DCCCXXIX.! !


!classDefinition: #DCCCXXX category: 'NaturalNumbers'!
II subclass: #DCCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXX class' category: 'NaturalNumbers'!
DCCCXXX class
	instanceVariableNames: ''!

!DCCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXIX.
	next := DCCCXXXI.! !


!classDefinition: #DCCCXXXI category: 'NaturalNumbers'!
II subclass: #DCCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXI class' category: 'NaturalNumbers'!
DCCCXXXI class
	instanceVariableNames: ''!

!DCCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXX.
	next := DCCCXXXII.! !


!classDefinition: #DCCCXXXII category: 'NaturalNumbers'!
II subclass: #DCCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXII class' category: 'NaturalNumbers'!
DCCCXXXII class
	instanceVariableNames: ''!

!DCCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXXI.
	next := DCCCXXXIII.! !


!classDefinition: #DCCCXXXIII category: 'NaturalNumbers'!
II subclass: #DCCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXIII class' category: 'NaturalNumbers'!
DCCCXXXIII class
	instanceVariableNames: ''!

!DCCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXXII.
	next := DCCCXXXIV.! !


!classDefinition: #DCCCXXXIV category: 'NaturalNumbers'!
II subclass: #DCCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXIV class' category: 'NaturalNumbers'!
DCCCXXXIV class
	instanceVariableNames: ''!

!DCCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXXIII.
	next := DCCCXXXV.! !


!classDefinition: #DCCCXXXIX category: 'NaturalNumbers'!
II subclass: #DCCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXIX class' category: 'NaturalNumbers'!
DCCCXXXIX class
	instanceVariableNames: ''!

!DCCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXXVIII.
	next := DCCCXL.! !


!classDefinition: #DCCCXXXV category: 'NaturalNumbers'!
II subclass: #DCCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXV class' category: 'NaturalNumbers'!
DCCCXXXV class
	instanceVariableNames: ''!

!DCCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXXIV.
	next := DCCCXXXVI.! !


!classDefinition: #DCCCXXXVI category: 'NaturalNumbers'!
II subclass: #DCCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXVI class' category: 'NaturalNumbers'!
DCCCXXXVI class
	instanceVariableNames: ''!

!DCCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXXV.
	next := DCCCXXXVII.! !


!classDefinition: #DCCCXXXVII category: 'NaturalNumbers'!
II subclass: #DCCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXVII class' category: 'NaturalNumbers'!
DCCCXXXVII class
	instanceVariableNames: ''!

!DCCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXXVI.
	next := DCCCXXXVIII.! !


!classDefinition: #DCCCXXXVIII category: 'NaturalNumbers'!
II subclass: #DCCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXVIII class' category: 'NaturalNumbers'!
DCCCXXXVIII class
	instanceVariableNames: ''!

!DCCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCCXXXVII.
	next := DCCCXXXIX.! !


!classDefinition: #DCCI category: 'NaturalNumbers'!
II subclass: #DCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCI class' category: 'NaturalNumbers'!
DCCI class
	instanceVariableNames: ''!

!DCCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCC.
	next := DCCII.! !


!classDefinition: #DCCII category: 'NaturalNumbers'!
II subclass: #DCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCII class' category: 'NaturalNumbers'!
DCCII class
	instanceVariableNames: ''!

!DCCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCI.
	next := DCCIII.! !


!classDefinition: #DCCIII category: 'NaturalNumbers'!
II subclass: #DCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCIII class' category: 'NaturalNumbers'!
DCCIII class
	instanceVariableNames: ''!

!DCCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCII.
	next := DCCIV.! !


!classDefinition: #DCCIV category: 'NaturalNumbers'!
II subclass: #DCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCIV class' category: 'NaturalNumbers'!
DCCIV class
	instanceVariableNames: ''!

!DCCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCIII.
	next := DCCV.! !


!classDefinition: #DCCIX category: 'NaturalNumbers'!
II subclass: #DCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCIX class' category: 'NaturalNumbers'!
DCCIX class
	instanceVariableNames: ''!

!DCCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCVIII.
	next := DCCX.! !


!classDefinition: #DCCL category: 'NaturalNumbers'!
II subclass: #DCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCL class' category: 'NaturalNumbers'!
DCCL class
	instanceVariableNames: ''!

!DCCL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXLIX.
	next := DCCLI.! !


!classDefinition: #DCCLI category: 'NaturalNumbers'!
II subclass: #DCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLI class' category: 'NaturalNumbers'!
DCCLI class
	instanceVariableNames: ''!

!DCCLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCL.
	next := DCCLII.! !


!classDefinition: #DCCLII category: 'NaturalNumbers'!
II subclass: #DCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLII class' category: 'NaturalNumbers'!
DCCLII class
	instanceVariableNames: ''!

!DCCLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLI.
	next := DCCLIII.! !


!classDefinition: #DCCLIII category: 'NaturalNumbers'!
II subclass: #DCCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLIII class' category: 'NaturalNumbers'!
DCCLIII class
	instanceVariableNames: ''!

!DCCLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLII.
	next := DCCLIV.! !


!classDefinition: #DCCLIV category: 'NaturalNumbers'!
II subclass: #DCCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLIV class' category: 'NaturalNumbers'!
DCCLIV class
	instanceVariableNames: ''!

!DCCLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLIII.
	next := DCCLV.! !


!classDefinition: #DCCLIX category: 'NaturalNumbers'!
II subclass: #DCCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLIX class' category: 'NaturalNumbers'!
DCCLIX class
	instanceVariableNames: ''!

!DCCLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLVIII.
	next := DCCLX.! !


!classDefinition: #DCCLV category: 'NaturalNumbers'!
II subclass: #DCCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLV class' category: 'NaturalNumbers'!
DCCLV class
	instanceVariableNames: ''!

!DCCLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLIV.
	next := DCCLVI.! !


!classDefinition: #DCCLVI category: 'NaturalNumbers'!
II subclass: #DCCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLVI class' category: 'NaturalNumbers'!
DCCLVI class
	instanceVariableNames: ''!

!DCCLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLV.
	next := DCCLVII.! !


!classDefinition: #DCCLVII category: 'NaturalNumbers'!
II subclass: #DCCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLVII class' category: 'NaturalNumbers'!
DCCLVII class
	instanceVariableNames: ''!

!DCCLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLVI.
	next := DCCLVIII.! !


!classDefinition: #DCCLVIII category: 'NaturalNumbers'!
II subclass: #DCCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLVIII class' category: 'NaturalNumbers'!
DCCLVIII class
	instanceVariableNames: ''!

!DCCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLVII.
	next := DCCLIX.! !


!classDefinition: #DCCLX category: 'NaturalNumbers'!
II subclass: #DCCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLX class' category: 'NaturalNumbers'!
DCCLX class
	instanceVariableNames: ''!

!DCCLX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLIX.
	next := DCCLXI.! !


!classDefinition: #DCCLXI category: 'NaturalNumbers'!
II subclass: #DCCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXI class' category: 'NaturalNumbers'!
DCCLXI class
	instanceVariableNames: ''!

!DCCLXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLX.
	next := DCCLXII.! !


!classDefinition: #DCCLXII category: 'NaturalNumbers'!
II subclass: #DCCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXII class' category: 'NaturalNumbers'!
DCCLXII class
	instanceVariableNames: ''!

!DCCLXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXI.
	next := DCCLXIII.! !


!classDefinition: #DCCLXIII category: 'NaturalNumbers'!
II subclass: #DCCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXIII class' category: 'NaturalNumbers'!
DCCLXIII class
	instanceVariableNames: ''!

!DCCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXII.
	next := DCCLXIV.! !


!classDefinition: #DCCLXIV category: 'NaturalNumbers'!
II subclass: #DCCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXIV class' category: 'NaturalNumbers'!
DCCLXIV class
	instanceVariableNames: ''!

!DCCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXIII.
	next := DCCLXV.! !


!classDefinition: #DCCLXIX category: 'NaturalNumbers'!
II subclass: #DCCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXIX class' category: 'NaturalNumbers'!
DCCLXIX class
	instanceVariableNames: ''!

!DCCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXVIII.
	next := DCCLXX.! !


!classDefinition: #DCCLXV category: 'NaturalNumbers'!
II subclass: #DCCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXV class' category: 'NaturalNumbers'!
DCCLXV class
	instanceVariableNames: ''!

!DCCLXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXIV.
	next := DCCLXVI.! !


!classDefinition: #DCCLXVI category: 'NaturalNumbers'!
II subclass: #DCCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXVI class' category: 'NaturalNumbers'!
DCCLXVI class
	instanceVariableNames: ''!

!DCCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXV.
	next := DCCLXVII.! !


!classDefinition: #DCCLXVII category: 'NaturalNumbers'!
II subclass: #DCCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXVII class' category: 'NaturalNumbers'!
DCCLXVII class
	instanceVariableNames: ''!

!DCCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXVI.
	next := DCCLXVIII.! !


!classDefinition: #DCCLXVIII category: 'NaturalNumbers'!
II subclass: #DCCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXVIII class' category: 'NaturalNumbers'!
DCCLXVIII class
	instanceVariableNames: ''!

!DCCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXVII.
	next := DCCLXIX.! !


!classDefinition: #DCCLXX category: 'NaturalNumbers'!
II subclass: #DCCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXX class' category: 'NaturalNumbers'!
DCCLXX class
	instanceVariableNames: ''!

!DCCLXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXIX.
	next := DCCLXXI.! !


!classDefinition: #DCCLXXI category: 'NaturalNumbers'!
II subclass: #DCCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXI class' category: 'NaturalNumbers'!
DCCLXXI class
	instanceVariableNames: ''!

!DCCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXX.
	next := DCCLXXII.! !


!classDefinition: #DCCLXXII category: 'NaturalNumbers'!
II subclass: #DCCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXII class' category: 'NaturalNumbers'!
DCCLXXII class
	instanceVariableNames: ''!

!DCCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXI.
	next := DCCLXXIII.! !


!classDefinition: #DCCLXXIII category: 'NaturalNumbers'!
II subclass: #DCCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXIII class' category: 'NaturalNumbers'!
DCCLXXIII class
	instanceVariableNames: ''!

!DCCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXII.
	next := DCCLXXIV.! !


!classDefinition: #DCCLXXIV category: 'NaturalNumbers'!
II subclass: #DCCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXIV class' category: 'NaturalNumbers'!
DCCLXXIV class
	instanceVariableNames: ''!

!DCCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXIII.
	next := DCCLXXV.! !


!classDefinition: #DCCLXXIX category: 'NaturalNumbers'!
II subclass: #DCCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXIX class' category: 'NaturalNumbers'!
DCCLXXIX class
	instanceVariableNames: ''!

!DCCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXVIII.
	next := DCCLXXX.! !


!classDefinition: #DCCLXXV category: 'NaturalNumbers'!
II subclass: #DCCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXV class' category: 'NaturalNumbers'!
DCCLXXV class
	instanceVariableNames: ''!

!DCCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXIV.
	next := DCCLXXVI.! !


!classDefinition: #DCCLXXVI category: 'NaturalNumbers'!
II subclass: #DCCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXVI class' category: 'NaturalNumbers'!
DCCLXXVI class
	instanceVariableNames: ''!

!DCCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXV.
	next := DCCLXXVII.! !


!classDefinition: #DCCLXXVII category: 'NaturalNumbers'!
II subclass: #DCCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXVII class' category: 'NaturalNumbers'!
DCCLXXVII class
	instanceVariableNames: ''!

!DCCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXVI.
	next := DCCLXXVIII.! !


!classDefinition: #DCCLXXVIII category: 'NaturalNumbers'!
II subclass: #DCCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXVIII class' category: 'NaturalNumbers'!
DCCLXXVIII class
	instanceVariableNames: ''!

!DCCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXVII.
	next := DCCLXXIX.! !


!classDefinition: #DCCLXXX category: 'NaturalNumbers'!
II subclass: #DCCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXX class' category: 'NaturalNumbers'!
DCCLXXX class
	instanceVariableNames: ''!

!DCCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXIX.
	next := DCCLXXXI.! !


!classDefinition: #DCCLXXXI category: 'NaturalNumbers'!
II subclass: #DCCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXI class' category: 'NaturalNumbers'!
DCCLXXXI class
	instanceVariableNames: ''!

!DCCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXX.
	next := DCCLXXXII.! !


!classDefinition: #DCCLXXXII category: 'NaturalNumbers'!
II subclass: #DCCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXII class' category: 'NaturalNumbers'!
DCCLXXXII class
	instanceVariableNames: ''!

!DCCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXXI.
	next := DCCLXXXIII.! !


!classDefinition: #DCCLXXXIII category: 'NaturalNumbers'!
II subclass: #DCCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXIII class' category: 'NaturalNumbers'!
DCCLXXXIII class
	instanceVariableNames: ''!

!DCCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXXII.
	next := DCCLXXXIV.! !


!classDefinition: #DCCLXXXIV category: 'NaturalNumbers'!
II subclass: #DCCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXIV class' category: 'NaturalNumbers'!
DCCLXXXIV class
	instanceVariableNames: ''!

!DCCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXXIII.
	next := DCCLXXXV.! !


!classDefinition: #DCCLXXXIX category: 'NaturalNumbers'!
II subclass: #DCCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXIX class' category: 'NaturalNumbers'!
DCCLXXXIX class
	instanceVariableNames: ''!

!DCCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXXVIII.
	next := DCCXC.! !


!classDefinition: #DCCLXXXV category: 'NaturalNumbers'!
II subclass: #DCCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXV class' category: 'NaturalNumbers'!
DCCLXXXV class
	instanceVariableNames: ''!

!DCCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXXIV.
	next := DCCLXXXVI.! !


!classDefinition: #DCCLXXXVI category: 'NaturalNumbers'!
II subclass: #DCCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXVI class' category: 'NaturalNumbers'!
DCCLXXXVI class
	instanceVariableNames: ''!

!DCCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXXV.
	next := DCCLXXXVII.! !


!classDefinition: #DCCLXXXVII category: 'NaturalNumbers'!
II subclass: #DCCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXVII class' category: 'NaturalNumbers'!
DCCLXXXVII class
	instanceVariableNames: ''!

!DCCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXXVI.
	next := DCCLXXXVIII.! !


!classDefinition: #DCCLXXXVIII category: 'NaturalNumbers'!
II subclass: #DCCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXVIII class' category: 'NaturalNumbers'!
DCCLXXXVIII class
	instanceVariableNames: ''!

!DCCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXXVII.
	next := DCCLXXXIX.! !


!classDefinition: #DCCV category: 'NaturalNumbers'!
II subclass: #DCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCV class' category: 'NaturalNumbers'!
DCCV class
	instanceVariableNames: ''!

!DCCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCIV.
	next := DCCVI.! !


!classDefinition: #DCCVI category: 'NaturalNumbers'!
II subclass: #DCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCVI class' category: 'NaturalNumbers'!
DCCVI class
	instanceVariableNames: ''!

!DCCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCV.
	next := DCCVII.! !


!classDefinition: #DCCVII category: 'NaturalNumbers'!
II subclass: #DCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCVII class' category: 'NaturalNumbers'!
DCCVII class
	instanceVariableNames: ''!

!DCCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCVI.
	next := DCCVIII.! !


!classDefinition: #DCCVIII category: 'NaturalNumbers'!
II subclass: #DCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCVIII class' category: 'NaturalNumbers'!
DCCVIII class
	instanceVariableNames: ''!

!DCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCVII.
	next := DCCIX.! !


!classDefinition: #DCCX category: 'NaturalNumbers'!
II subclass: #DCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCX class' category: 'NaturalNumbers'!
DCCX class
	instanceVariableNames: ''!

!DCCX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCIX.
	next := DCCXI.! !


!classDefinition: #DCCXC category: 'NaturalNumbers'!
II subclass: #DCCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXC class' category: 'NaturalNumbers'!
DCCXC class
	instanceVariableNames: ''!

!DCCXC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCLXXXIX.
	next := DCCXCI.! !


!classDefinition: #DCCXCI category: 'NaturalNumbers'!
II subclass: #DCCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCI class' category: 'NaturalNumbers'!
DCCXCI class
	instanceVariableNames: ''!

!DCCXCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXC.
	next := DCCXCII.! !


!classDefinition: #DCCXCII category: 'NaturalNumbers'!
II subclass: #DCCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCII class' category: 'NaturalNumbers'!
DCCXCII class
	instanceVariableNames: ''!

!DCCXCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXCI.
	next := DCCXCIII.! !


!classDefinition: #DCCXCIII category: 'NaturalNumbers'!
II subclass: #DCCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCIII class' category: 'NaturalNumbers'!
DCCXCIII class
	instanceVariableNames: ''!

!DCCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXCII.
	next := DCCXCIV.! !


!classDefinition: #DCCXCIV category: 'NaturalNumbers'!
II subclass: #DCCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCIV class' category: 'NaturalNumbers'!
DCCXCIV class
	instanceVariableNames: ''!

!DCCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXCIII.
	next := DCCXCV.! !


!classDefinition: #DCCXCIX category: 'NaturalNumbers'!
II subclass: #DCCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCIX class' category: 'NaturalNumbers'!
DCCXCIX class
	instanceVariableNames: ''!

!DCCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXCVIII.
	next := DCCC.! !


!classDefinition: #DCCXCV category: 'NaturalNumbers'!
II subclass: #DCCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCV class' category: 'NaturalNumbers'!
DCCXCV class
	instanceVariableNames: ''!

!DCCXCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXCIV.
	next := DCCXCVI.! !


!classDefinition: #DCCXCVI category: 'NaturalNumbers'!
II subclass: #DCCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCVI class' category: 'NaturalNumbers'!
DCCXCVI class
	instanceVariableNames: ''!

!DCCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXCV.
	next := DCCXCVII.! !


!classDefinition: #DCCXCVII category: 'NaturalNumbers'!
II subclass: #DCCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCVII class' category: 'NaturalNumbers'!
DCCXCVII class
	instanceVariableNames: ''!

!DCCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXCVI.
	next := DCCXCVIII.! !


!classDefinition: #DCCXCVIII category: 'NaturalNumbers'!
II subclass: #DCCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCVIII class' category: 'NaturalNumbers'!
DCCXCVIII class
	instanceVariableNames: ''!

!DCCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXCVII.
	next := DCCXCIX.! !


!classDefinition: #DCCXI category: 'NaturalNumbers'!
II subclass: #DCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXI class' category: 'NaturalNumbers'!
DCCXI class
	instanceVariableNames: ''!

!DCCXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCX.
	next := DCCXII.! !


!classDefinition: #DCCXII category: 'NaturalNumbers'!
II subclass: #DCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXII class' category: 'NaturalNumbers'!
DCCXII class
	instanceVariableNames: ''!

!DCCXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXI.
	next := DCCXIII.! !


!classDefinition: #DCCXIII category: 'NaturalNumbers'!
II subclass: #DCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXIII class' category: 'NaturalNumbers'!
DCCXIII class
	instanceVariableNames: ''!

!DCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXII.
	next := DCCXIV.! !


!classDefinition: #DCCXIV category: 'NaturalNumbers'!
II subclass: #DCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXIV class' category: 'NaturalNumbers'!
DCCXIV class
	instanceVariableNames: ''!

!DCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXIII.
	next := DCCXV.! !


!classDefinition: #DCCXIX category: 'NaturalNumbers'!
II subclass: #DCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXIX class' category: 'NaturalNumbers'!
DCCXIX class
	instanceVariableNames: ''!

!DCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXVIII.
	next := DCCXX.! !


!classDefinition: #DCCXL category: 'NaturalNumbers'!
II subclass: #DCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXL class' category: 'NaturalNumbers'!
DCCXL class
	instanceVariableNames: ''!

!DCCXL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXXIX.
	next := DCCXLI.! !


!classDefinition: #DCCXLI category: 'NaturalNumbers'!
II subclass: #DCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLI class' category: 'NaturalNumbers'!
DCCXLI class
	instanceVariableNames: ''!

!DCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXL.
	next := DCCXLII.! !


!classDefinition: #DCCXLII category: 'NaturalNumbers'!
II subclass: #DCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLII class' category: 'NaturalNumbers'!
DCCXLII class
	instanceVariableNames: ''!

!DCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXLI.
	next := DCCXLIII.! !


!classDefinition: #DCCXLIII category: 'NaturalNumbers'!
II subclass: #DCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLIII class' category: 'NaturalNumbers'!
DCCXLIII class
	instanceVariableNames: ''!

!DCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXLII.
	next := DCCXLIV.! !


!classDefinition: #DCCXLIV category: 'NaturalNumbers'!
II subclass: #DCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLIV class' category: 'NaturalNumbers'!
DCCXLIV class
	instanceVariableNames: ''!

!DCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXLIII.
	next := DCCXLV.! !


!classDefinition: #DCCXLIX category: 'NaturalNumbers'!
II subclass: #DCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLIX class' category: 'NaturalNumbers'!
DCCXLIX class
	instanceVariableNames: ''!

!DCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXLVIII.
	next := DCCL.! !


!classDefinition: #DCCXLV category: 'NaturalNumbers'!
II subclass: #DCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLV class' category: 'NaturalNumbers'!
DCCXLV class
	instanceVariableNames: ''!

!DCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXLIV.
	next := DCCXLVI.! !


!classDefinition: #DCCXLVI category: 'NaturalNumbers'!
II subclass: #DCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLVI class' category: 'NaturalNumbers'!
DCCXLVI class
	instanceVariableNames: ''!

!DCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXLV.
	next := DCCXLVII.! !


!classDefinition: #DCCXLVII category: 'NaturalNumbers'!
II subclass: #DCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLVII class' category: 'NaturalNumbers'!
DCCXLVII class
	instanceVariableNames: ''!

!DCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXLVI.
	next := DCCXLVIII.! !


!classDefinition: #DCCXLVIII category: 'NaturalNumbers'!
II subclass: #DCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLVIII class' category: 'NaturalNumbers'!
DCCXLVIII class
	instanceVariableNames: ''!

!DCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXLVII.
	next := DCCXLIX.! !


!classDefinition: #DCCXV category: 'NaturalNumbers'!
II subclass: #DCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXV class' category: 'NaturalNumbers'!
DCCXV class
	instanceVariableNames: ''!

!DCCXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXIV.
	next := DCCXVI.! !


!classDefinition: #DCCXVI category: 'NaturalNumbers'!
II subclass: #DCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXVI class' category: 'NaturalNumbers'!
DCCXVI class
	instanceVariableNames: ''!

!DCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXV.
	next := DCCXVII.! !


!classDefinition: #DCCXVII category: 'NaturalNumbers'!
II subclass: #DCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXVII class' category: 'NaturalNumbers'!
DCCXVII class
	instanceVariableNames: ''!

!DCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXVI.
	next := DCCXVIII.! !


!classDefinition: #DCCXVIII category: 'NaturalNumbers'!
II subclass: #DCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXVIII class' category: 'NaturalNumbers'!
DCCXVIII class
	instanceVariableNames: ''!

!DCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXVII.
	next := DCCXIX.! !


!classDefinition: #DCCXX category: 'NaturalNumbers'!
II subclass: #DCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXX class' category: 'NaturalNumbers'!
DCCXX class
	instanceVariableNames: ''!

!DCCXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXIX.
	next := DCCXXI.! !


!classDefinition: #DCCXXI category: 'NaturalNumbers'!
II subclass: #DCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXI class' category: 'NaturalNumbers'!
DCCXXI class
	instanceVariableNames: ''!

!DCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXX.
	next := DCCXXII.! !


!classDefinition: #DCCXXII category: 'NaturalNumbers'!
II subclass: #DCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXII class' category: 'NaturalNumbers'!
DCCXXII class
	instanceVariableNames: ''!

!DCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXI.
	next := DCCXXIII.! !


!classDefinition: #DCCXXIII category: 'NaturalNumbers'!
II subclass: #DCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXIII class' category: 'NaturalNumbers'!
DCCXXIII class
	instanceVariableNames: ''!

!DCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXII.
	next := DCCXXIV.! !


!classDefinition: #DCCXXIV category: 'NaturalNumbers'!
II subclass: #DCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXIV class' category: 'NaturalNumbers'!
DCCXXIV class
	instanceVariableNames: ''!

!DCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXIII.
	next := DCCXXV.! !


!classDefinition: #DCCXXIX category: 'NaturalNumbers'!
II subclass: #DCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXIX class' category: 'NaturalNumbers'!
DCCXXIX class
	instanceVariableNames: ''!

!DCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXVIII.
	next := DCCXXX.! !


!classDefinition: #DCCXXV category: 'NaturalNumbers'!
II subclass: #DCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXV class' category: 'NaturalNumbers'!
DCCXXV class
	instanceVariableNames: ''!

!DCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXIV.
	next := DCCXXVI.! !


!classDefinition: #DCCXXVI category: 'NaturalNumbers'!
II subclass: #DCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXVI class' category: 'NaturalNumbers'!
DCCXXVI class
	instanceVariableNames: ''!

!DCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXV.
	next := DCCXXVII.! !


!classDefinition: #DCCXXVII category: 'NaturalNumbers'!
II subclass: #DCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXVII class' category: 'NaturalNumbers'!
DCCXXVII class
	instanceVariableNames: ''!

!DCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXVI.
	next := DCCXXVIII.! !


!classDefinition: #DCCXXVIII category: 'NaturalNumbers'!
II subclass: #DCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXVIII class' category: 'NaturalNumbers'!
DCCXXVIII class
	instanceVariableNames: ''!

!DCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXVII.
	next := DCCXXIX.! !


!classDefinition: #DCCXXX category: 'NaturalNumbers'!
II subclass: #DCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXX class' category: 'NaturalNumbers'!
DCCXXX class
	instanceVariableNames: ''!

!DCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXIX.
	next := DCCXXXI.! !


!classDefinition: #DCCXXXI category: 'NaturalNumbers'!
II subclass: #DCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXI class' category: 'NaturalNumbers'!
DCCXXXI class
	instanceVariableNames: ''!

!DCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXX.
	next := DCCXXXII.! !


!classDefinition: #DCCXXXII category: 'NaturalNumbers'!
II subclass: #DCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXII class' category: 'NaturalNumbers'!
DCCXXXII class
	instanceVariableNames: ''!

!DCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXXI.
	next := DCCXXXIII.! !


!classDefinition: #DCCXXXIII category: 'NaturalNumbers'!
II subclass: #DCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXIII class' category: 'NaturalNumbers'!
DCCXXXIII class
	instanceVariableNames: ''!

!DCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXXII.
	next := DCCXXXIV.! !


!classDefinition: #DCCXXXIV category: 'NaturalNumbers'!
II subclass: #DCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXIV class' category: 'NaturalNumbers'!
DCCXXXIV class
	instanceVariableNames: ''!

!DCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXXIII.
	next := DCCXXXV.! !


!classDefinition: #DCCXXXIX category: 'NaturalNumbers'!
II subclass: #DCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXIX class' category: 'NaturalNumbers'!
DCCXXXIX class
	instanceVariableNames: ''!

!DCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXXVIII.
	next := DCCXL.! !


!classDefinition: #DCCXXXV category: 'NaturalNumbers'!
II subclass: #DCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXV class' category: 'NaturalNumbers'!
DCCXXXV class
	instanceVariableNames: ''!

!DCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXXIV.
	next := DCCXXXVI.! !


!classDefinition: #DCCXXXVI category: 'NaturalNumbers'!
II subclass: #DCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXVI class' category: 'NaturalNumbers'!
DCCXXXVI class
	instanceVariableNames: ''!

!DCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXXV.
	next := DCCXXXVII.! !


!classDefinition: #DCCXXXVII category: 'NaturalNumbers'!
II subclass: #DCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXVII class' category: 'NaturalNumbers'!
DCCXXXVII class
	instanceVariableNames: ''!

!DCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXXVI.
	next := DCCXXXVIII.! !


!classDefinition: #DCCXXXVIII category: 'NaturalNumbers'!
II subclass: #DCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXVIII class' category: 'NaturalNumbers'!
DCCXXXVIII class
	instanceVariableNames: ''!

!DCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCCXXXVII.
	next := DCCXXXIX.! !


!classDefinition: #DCI category: 'NaturalNumbers'!
II subclass: #DCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCI class' category: 'NaturalNumbers'!
DCI class
	instanceVariableNames: ''!

!DCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DC.
	next := DCII.! !


!classDefinition: #DCII category: 'NaturalNumbers'!
II subclass: #DCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCII class' category: 'NaturalNumbers'!
DCII class
	instanceVariableNames: ''!

!DCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCI.
	next := DCIII.! !


!classDefinition: #DCIII category: 'NaturalNumbers'!
II subclass: #DCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCIII class' category: 'NaturalNumbers'!
DCIII class
	instanceVariableNames: ''!

!DCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCII.
	next := DCIV.! !


!classDefinition: #DCIV category: 'NaturalNumbers'!
II subclass: #DCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCIV class' category: 'NaturalNumbers'!
DCIV class
	instanceVariableNames: ''!

!DCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCIII.
	next := DCV.! !


!classDefinition: #DCIX category: 'NaturalNumbers'!
II subclass: #DCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCIX class' category: 'NaturalNumbers'!
DCIX class
	instanceVariableNames: ''!

!DCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCVIII.
	next := DCX.! !


!classDefinition: #DCL category: 'NaturalNumbers'!
II subclass: #DCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCL class' category: 'NaturalNumbers'!
DCL class
	instanceVariableNames: ''!

!DCL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXLIX.
	next := DCLI.! !


!classDefinition: #DCLI category: 'NaturalNumbers'!
II subclass: #DCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLI class' category: 'NaturalNumbers'!
DCLI class
	instanceVariableNames: ''!

!DCLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCL.
	next := DCLII.! !


!classDefinition: #DCLII category: 'NaturalNumbers'!
II subclass: #DCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLII class' category: 'NaturalNumbers'!
DCLII class
	instanceVariableNames: ''!

!DCLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLI.
	next := DCLIII.! !


!classDefinition: #DCLIII category: 'NaturalNumbers'!
II subclass: #DCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLIII class' category: 'NaturalNumbers'!
DCLIII class
	instanceVariableNames: ''!

!DCLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLII.
	next := DCLIV.! !


!classDefinition: #DCLIV category: 'NaturalNumbers'!
II subclass: #DCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLIV class' category: 'NaturalNumbers'!
DCLIV class
	instanceVariableNames: ''!

!DCLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLIII.
	next := DCLV.! !


!classDefinition: #DCLIX category: 'NaturalNumbers'!
II subclass: #DCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLIX class' category: 'NaturalNumbers'!
DCLIX class
	instanceVariableNames: ''!

!DCLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLVIII.
	next := DCLX.! !


!classDefinition: #DCLV category: 'NaturalNumbers'!
II subclass: #DCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLV class' category: 'NaturalNumbers'!
DCLV class
	instanceVariableNames: ''!

!DCLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLIV.
	next := DCLVI.! !


!classDefinition: #DCLVI category: 'NaturalNumbers'!
II subclass: #DCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLVI class' category: 'NaturalNumbers'!
DCLVI class
	instanceVariableNames: ''!

!DCLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLV.
	next := DCLVII.! !


!classDefinition: #DCLVII category: 'NaturalNumbers'!
II subclass: #DCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLVII class' category: 'NaturalNumbers'!
DCLVII class
	instanceVariableNames: ''!

!DCLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLVI.
	next := DCLVIII.! !


!classDefinition: #DCLVIII category: 'NaturalNumbers'!
II subclass: #DCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLVIII class' category: 'NaturalNumbers'!
DCLVIII class
	instanceVariableNames: ''!

!DCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLVII.
	next := DCLIX.! !


!classDefinition: #DCLX category: 'NaturalNumbers'!
II subclass: #DCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLX class' category: 'NaturalNumbers'!
DCLX class
	instanceVariableNames: ''!

!DCLX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLIX.
	next := DCLXI.! !


!classDefinition: #DCLXI category: 'NaturalNumbers'!
II subclass: #DCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXI class' category: 'NaturalNumbers'!
DCLXI class
	instanceVariableNames: ''!

!DCLXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLX.
	next := DCLXII.! !


!classDefinition: #DCLXII category: 'NaturalNumbers'!
II subclass: #DCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXII class' category: 'NaturalNumbers'!
DCLXII class
	instanceVariableNames: ''!

!DCLXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXI.
	next := DCLXIII.! !


!classDefinition: #DCLXIII category: 'NaturalNumbers'!
II subclass: #DCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXIII class' category: 'NaturalNumbers'!
DCLXIII class
	instanceVariableNames: ''!

!DCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXII.
	next := DCLXIV.! !


!classDefinition: #DCLXIV category: 'NaturalNumbers'!
II subclass: #DCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXIV class' category: 'NaturalNumbers'!
DCLXIV class
	instanceVariableNames: ''!

!DCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXIII.
	next := DCLXV.! !


!classDefinition: #DCLXIX category: 'NaturalNumbers'!
II subclass: #DCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXIX class' category: 'NaturalNumbers'!
DCLXIX class
	instanceVariableNames: ''!

!DCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXVIII.
	next := DCLXX.! !


!classDefinition: #DCLXV category: 'NaturalNumbers'!
II subclass: #DCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXV class' category: 'NaturalNumbers'!
DCLXV class
	instanceVariableNames: ''!

!DCLXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXIV.
	next := DCLXVI.! !


!classDefinition: #DCLXVI category: 'NaturalNumbers'!
II subclass: #DCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXVI class' category: 'NaturalNumbers'!
DCLXVI class
	instanceVariableNames: ''!

!DCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXV.
	next := DCLXVII.! !


!classDefinition: #DCLXVII category: 'NaturalNumbers'!
II subclass: #DCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXVII class' category: 'NaturalNumbers'!
DCLXVII class
	instanceVariableNames: ''!

!DCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXVI.
	next := DCLXVIII.! !


!classDefinition: #DCLXVIII category: 'NaturalNumbers'!
II subclass: #DCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXVIII class' category: 'NaturalNumbers'!
DCLXVIII class
	instanceVariableNames: ''!

!DCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXVII.
	next := DCLXIX.! !


!classDefinition: #DCLXX category: 'NaturalNumbers'!
II subclass: #DCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXX class' category: 'NaturalNumbers'!
DCLXX class
	instanceVariableNames: ''!

!DCLXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXIX.
	next := DCLXXI.! !


!classDefinition: #DCLXXI category: 'NaturalNumbers'!
II subclass: #DCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXI class' category: 'NaturalNumbers'!
DCLXXI class
	instanceVariableNames: ''!

!DCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXX.
	next := DCLXXII.! !


!classDefinition: #DCLXXII category: 'NaturalNumbers'!
II subclass: #DCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXII class' category: 'NaturalNumbers'!
DCLXXII class
	instanceVariableNames: ''!

!DCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXI.
	next := DCLXXIII.! !


!classDefinition: #DCLXXIII category: 'NaturalNumbers'!
II subclass: #DCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXIII class' category: 'NaturalNumbers'!
DCLXXIII class
	instanceVariableNames: ''!

!DCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXII.
	next := DCLXXIV.! !


!classDefinition: #DCLXXIV category: 'NaturalNumbers'!
II subclass: #DCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXIV class' category: 'NaturalNumbers'!
DCLXXIV class
	instanceVariableNames: ''!

!DCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXIII.
	next := DCLXXV.! !


!classDefinition: #DCLXXIX category: 'NaturalNumbers'!
II subclass: #DCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXIX class' category: 'NaturalNumbers'!
DCLXXIX class
	instanceVariableNames: ''!

!DCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXVIII.
	next := DCLXXX.! !


!classDefinition: #DCLXXV category: 'NaturalNumbers'!
II subclass: #DCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXV class' category: 'NaturalNumbers'!
DCLXXV class
	instanceVariableNames: ''!

!DCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXIV.
	next := DCLXXVI.! !


!classDefinition: #DCLXXVI category: 'NaturalNumbers'!
II subclass: #DCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXVI class' category: 'NaturalNumbers'!
DCLXXVI class
	instanceVariableNames: ''!

!DCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXV.
	next := DCLXXVII.! !


!classDefinition: #DCLXXVII category: 'NaturalNumbers'!
II subclass: #DCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXVII class' category: 'NaturalNumbers'!
DCLXXVII class
	instanceVariableNames: ''!

!DCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXVI.
	next := DCLXXVIII.! !


!classDefinition: #DCLXXVIII category: 'NaturalNumbers'!
II subclass: #DCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXVIII class' category: 'NaturalNumbers'!
DCLXXVIII class
	instanceVariableNames: ''!

!DCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXVII.
	next := DCLXXIX.! !


!classDefinition: #DCLXXX category: 'NaturalNumbers'!
II subclass: #DCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXX class' category: 'NaturalNumbers'!
DCLXXX class
	instanceVariableNames: ''!

!DCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXIX.
	next := DCLXXXI.! !


!classDefinition: #DCLXXXI category: 'NaturalNumbers'!
II subclass: #DCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXI class' category: 'NaturalNumbers'!
DCLXXXI class
	instanceVariableNames: ''!

!DCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXX.
	next := DCLXXXII.! !


!classDefinition: #DCLXXXII category: 'NaturalNumbers'!
II subclass: #DCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXII class' category: 'NaturalNumbers'!
DCLXXXII class
	instanceVariableNames: ''!

!DCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXXI.
	next := DCLXXXIII.! !


!classDefinition: #DCLXXXIII category: 'NaturalNumbers'!
II subclass: #DCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXIII class' category: 'NaturalNumbers'!
DCLXXXIII class
	instanceVariableNames: ''!

!DCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXXII.
	next := DCLXXXIV.! !


!classDefinition: #DCLXXXIV category: 'NaturalNumbers'!
II subclass: #DCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXIV class' category: 'NaturalNumbers'!
DCLXXXIV class
	instanceVariableNames: ''!

!DCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXXIII.
	next := DCLXXXV.! !


!classDefinition: #DCLXXXIX category: 'NaturalNumbers'!
II subclass: #DCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXIX class' category: 'NaturalNumbers'!
DCLXXXIX class
	instanceVariableNames: ''!

!DCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXXVIII.
	next := DCXC.! !


!classDefinition: #DCLXXXV category: 'NaturalNumbers'!
II subclass: #DCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXV class' category: 'NaturalNumbers'!
DCLXXXV class
	instanceVariableNames: ''!

!DCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXXIV.
	next := DCLXXXVI.! !


!classDefinition: #DCLXXXVI category: 'NaturalNumbers'!
II subclass: #DCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXVI class' category: 'NaturalNumbers'!
DCLXXXVI class
	instanceVariableNames: ''!

!DCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXXV.
	next := DCLXXXVII.! !


!classDefinition: #DCLXXXVII category: 'NaturalNumbers'!
II subclass: #DCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXVII class' category: 'NaturalNumbers'!
DCLXXXVII class
	instanceVariableNames: ''!

!DCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXXVI.
	next := DCLXXXVIII.! !


!classDefinition: #DCLXXXVIII category: 'NaturalNumbers'!
II subclass: #DCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXVIII class' category: 'NaturalNumbers'!
DCLXXXVIII class
	instanceVariableNames: ''!

!DCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXXVII.
	next := DCLXXXIX.! !


!classDefinition: #DCV category: 'NaturalNumbers'!
II subclass: #DCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCV class' category: 'NaturalNumbers'!
DCV class
	instanceVariableNames: ''!

!DCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCIV.
	next := DCVI.! !


!classDefinition: #DCVI category: 'NaturalNumbers'!
II subclass: #DCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCVI class' category: 'NaturalNumbers'!
DCVI class
	instanceVariableNames: ''!

!DCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCV.
	next := DCVII.! !


!classDefinition: #DCVII category: 'NaturalNumbers'!
II subclass: #DCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCVII class' category: 'NaturalNumbers'!
DCVII class
	instanceVariableNames: ''!

!DCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCVI.
	next := DCVIII.! !


!classDefinition: #DCVIII category: 'NaturalNumbers'!
II subclass: #DCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCVIII class' category: 'NaturalNumbers'!
DCVIII class
	instanceVariableNames: ''!

!DCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCVII.
	next := DCIX.! !


!classDefinition: #DCX category: 'NaturalNumbers'!
II subclass: #DCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCX class' category: 'NaturalNumbers'!
DCX class
	instanceVariableNames: ''!

!DCX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCIX.
	next := DCXI.! !


!classDefinition: #DCXC category: 'NaturalNumbers'!
II subclass: #DCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXC class' category: 'NaturalNumbers'!
DCXC class
	instanceVariableNames: ''!

!DCXC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCLXXXIX.
	next := DCXCI.! !


!classDefinition: #DCXCI category: 'NaturalNumbers'!
II subclass: #DCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCI class' category: 'NaturalNumbers'!
DCXCI class
	instanceVariableNames: ''!

!DCXCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXC.
	next := DCXCII.! !


!classDefinition: #DCXCII category: 'NaturalNumbers'!
II subclass: #DCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCII class' category: 'NaturalNumbers'!
DCXCII class
	instanceVariableNames: ''!

!DCXCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXCI.
	next := DCXCIII.! !


!classDefinition: #DCXCIII category: 'NaturalNumbers'!
II subclass: #DCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCIII class' category: 'NaturalNumbers'!
DCXCIII class
	instanceVariableNames: ''!

!DCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXCII.
	next := DCXCIV.! !


!classDefinition: #DCXCIV category: 'NaturalNumbers'!
II subclass: #DCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCIV class' category: 'NaturalNumbers'!
DCXCIV class
	instanceVariableNames: ''!

!DCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXCIII.
	next := DCXCV.! !


!classDefinition: #DCXCIX category: 'NaturalNumbers'!
II subclass: #DCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCIX class' category: 'NaturalNumbers'!
DCXCIX class
	instanceVariableNames: ''!

!DCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXCVIII.
	next := DCC.! !


!classDefinition: #DCXCV category: 'NaturalNumbers'!
II subclass: #DCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCV class' category: 'NaturalNumbers'!
DCXCV class
	instanceVariableNames: ''!

!DCXCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXCIV.
	next := DCXCVI.! !


!classDefinition: #DCXCVI category: 'NaturalNumbers'!
II subclass: #DCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCVI class' category: 'NaturalNumbers'!
DCXCVI class
	instanceVariableNames: ''!

!DCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXCV.
	next := DCXCVII.! !


!classDefinition: #DCXCVII category: 'NaturalNumbers'!
II subclass: #DCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCVII class' category: 'NaturalNumbers'!
DCXCVII class
	instanceVariableNames: ''!

!DCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXCVI.
	next := DCXCVIII.! !


!classDefinition: #DCXCVIII category: 'NaturalNumbers'!
II subclass: #DCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCVIII class' category: 'NaturalNumbers'!
DCXCVIII class
	instanceVariableNames: ''!

!DCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXCVII.
	next := DCXCIX.! !


!classDefinition: #DCXI category: 'NaturalNumbers'!
II subclass: #DCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXI class' category: 'NaturalNumbers'!
DCXI class
	instanceVariableNames: ''!

!DCXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCX.
	next := DCXII.! !


!classDefinition: #DCXII category: 'NaturalNumbers'!
II subclass: #DCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXII class' category: 'NaturalNumbers'!
DCXII class
	instanceVariableNames: ''!

!DCXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXI.
	next := DCXIII.! !


!classDefinition: #DCXIII category: 'NaturalNumbers'!
II subclass: #DCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXIII class' category: 'NaturalNumbers'!
DCXIII class
	instanceVariableNames: ''!

!DCXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXII.
	next := DCXIV.! !


!classDefinition: #DCXIV category: 'NaturalNumbers'!
II subclass: #DCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXIV class' category: 'NaturalNumbers'!
DCXIV class
	instanceVariableNames: ''!

!DCXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXIII.
	next := DCXV.! !


!classDefinition: #DCXIX category: 'NaturalNumbers'!
II subclass: #DCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXIX class' category: 'NaturalNumbers'!
DCXIX class
	instanceVariableNames: ''!

!DCXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXVIII.
	next := DCXX.! !


!classDefinition: #DCXL category: 'NaturalNumbers'!
II subclass: #DCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXL class' category: 'NaturalNumbers'!
DCXL class
	instanceVariableNames: ''!

!DCXL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXXIX.
	next := DCXLI.! !


!classDefinition: #DCXLI category: 'NaturalNumbers'!
II subclass: #DCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLI class' category: 'NaturalNumbers'!
DCXLI class
	instanceVariableNames: ''!

!DCXLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXL.
	next := DCXLII.! !


!classDefinition: #DCXLII category: 'NaturalNumbers'!
II subclass: #DCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLII class' category: 'NaturalNumbers'!
DCXLII class
	instanceVariableNames: ''!

!DCXLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXLI.
	next := DCXLIII.! !


!classDefinition: #DCXLIII category: 'NaturalNumbers'!
II subclass: #DCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLIII class' category: 'NaturalNumbers'!
DCXLIII class
	instanceVariableNames: ''!

!DCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXLII.
	next := DCXLIV.! !


!classDefinition: #DCXLIV category: 'NaturalNumbers'!
II subclass: #DCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLIV class' category: 'NaturalNumbers'!
DCXLIV class
	instanceVariableNames: ''!

!DCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXLIII.
	next := DCXLV.! !


!classDefinition: #DCXLIX category: 'NaturalNumbers'!
II subclass: #DCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLIX class' category: 'NaturalNumbers'!
DCXLIX class
	instanceVariableNames: ''!

!DCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXLVIII.
	next := DCL.! !


!classDefinition: #DCXLV category: 'NaturalNumbers'!
II subclass: #DCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLV class' category: 'NaturalNumbers'!
DCXLV class
	instanceVariableNames: ''!

!DCXLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXLIV.
	next := DCXLVI.! !


!classDefinition: #DCXLVI category: 'NaturalNumbers'!
II subclass: #DCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLVI class' category: 'NaturalNumbers'!
DCXLVI class
	instanceVariableNames: ''!

!DCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXLV.
	next := DCXLVII.! !


!classDefinition: #DCXLVII category: 'NaturalNumbers'!
II subclass: #DCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLVII class' category: 'NaturalNumbers'!
DCXLVII class
	instanceVariableNames: ''!

!DCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXLVI.
	next := DCXLVIII.! !


!classDefinition: #DCXLVIII category: 'NaturalNumbers'!
II subclass: #DCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLVIII class' category: 'NaturalNumbers'!
DCXLVIII class
	instanceVariableNames: ''!

!DCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXLVII.
	next := DCXLIX.! !


!classDefinition: #DCXV category: 'NaturalNumbers'!
II subclass: #DCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXV class' category: 'NaturalNumbers'!
DCXV class
	instanceVariableNames: ''!

!DCXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXIV.
	next := DCXVI.! !


!classDefinition: #DCXVI category: 'NaturalNumbers'!
II subclass: #DCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXVI class' category: 'NaturalNumbers'!
DCXVI class
	instanceVariableNames: ''!

!DCXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXV.
	next := DCXVII.! !


!classDefinition: #DCXVII category: 'NaturalNumbers'!
II subclass: #DCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXVII class' category: 'NaturalNumbers'!
DCXVII class
	instanceVariableNames: ''!

!DCXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXVI.
	next := DCXVIII.! !


!classDefinition: #DCXVIII category: 'NaturalNumbers'!
II subclass: #DCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXVIII class' category: 'NaturalNumbers'!
DCXVIII class
	instanceVariableNames: ''!

!DCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXVII.
	next := DCXIX.! !


!classDefinition: #DCXX category: 'NaturalNumbers'!
II subclass: #DCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXX class' category: 'NaturalNumbers'!
DCXX class
	instanceVariableNames: ''!

!DCXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXIX.
	next := DCXXI.! !


!classDefinition: #DCXXI category: 'NaturalNumbers'!
II subclass: #DCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXI class' category: 'NaturalNumbers'!
DCXXI class
	instanceVariableNames: ''!

!DCXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXX.
	next := DCXXII.! !


!classDefinition: #DCXXII category: 'NaturalNumbers'!
II subclass: #DCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXII class' category: 'NaturalNumbers'!
DCXXII class
	instanceVariableNames: ''!

!DCXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXI.
	next := DCXXIII.! !


!classDefinition: #DCXXIII category: 'NaturalNumbers'!
II subclass: #DCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXIII class' category: 'NaturalNumbers'!
DCXXIII class
	instanceVariableNames: ''!

!DCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXII.
	next := DCXXIV.! !


!classDefinition: #DCXXIV category: 'NaturalNumbers'!
II subclass: #DCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXIV class' category: 'NaturalNumbers'!
DCXXIV class
	instanceVariableNames: ''!

!DCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXIII.
	next := DCXXV.! !


!classDefinition: #DCXXIX category: 'NaturalNumbers'!
II subclass: #DCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXIX class' category: 'NaturalNumbers'!
DCXXIX class
	instanceVariableNames: ''!

!DCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXVIII.
	next := DCXXX.! !


!classDefinition: #DCXXV category: 'NaturalNumbers'!
II subclass: #DCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXV class' category: 'NaturalNumbers'!
DCXXV class
	instanceVariableNames: ''!

!DCXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXIV.
	next := DCXXVI.! !


!classDefinition: #DCXXVI category: 'NaturalNumbers'!
II subclass: #DCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXVI class' category: 'NaturalNumbers'!
DCXXVI class
	instanceVariableNames: ''!

!DCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXV.
	next := DCXXVII.! !


!classDefinition: #DCXXVII category: 'NaturalNumbers'!
II subclass: #DCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXVII class' category: 'NaturalNumbers'!
DCXXVII class
	instanceVariableNames: ''!

!DCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXVI.
	next := DCXXVIII.! !


!classDefinition: #DCXXVIII category: 'NaturalNumbers'!
II subclass: #DCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXVIII class' category: 'NaturalNumbers'!
DCXXVIII class
	instanceVariableNames: ''!

!DCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXVII.
	next := DCXXIX.! !


!classDefinition: #DCXXX category: 'NaturalNumbers'!
II subclass: #DCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXX class' category: 'NaturalNumbers'!
DCXXX class
	instanceVariableNames: ''!

!DCXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXIX.
	next := DCXXXI.! !


!classDefinition: #DCXXXI category: 'NaturalNumbers'!
II subclass: #DCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXI class' category: 'NaturalNumbers'!
DCXXXI class
	instanceVariableNames: ''!

!DCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXX.
	next := DCXXXII.! !


!classDefinition: #DCXXXII category: 'NaturalNumbers'!
II subclass: #DCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXII class' category: 'NaturalNumbers'!
DCXXXII class
	instanceVariableNames: ''!

!DCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXXI.
	next := DCXXXIII.! !


!classDefinition: #DCXXXIII category: 'NaturalNumbers'!
II subclass: #DCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXIII class' category: 'NaturalNumbers'!
DCXXXIII class
	instanceVariableNames: ''!

!DCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXXII.
	next := DCXXXIV.! !


!classDefinition: #DCXXXIV category: 'NaturalNumbers'!
II subclass: #DCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXIV class' category: 'NaturalNumbers'!
DCXXXIV class
	instanceVariableNames: ''!

!DCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXXIII.
	next := DCXXXV.! !


!classDefinition: #DCXXXIX category: 'NaturalNumbers'!
II subclass: #DCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXIX class' category: 'NaturalNumbers'!
DCXXXIX class
	instanceVariableNames: ''!

!DCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXXVIII.
	next := DCXL.! !


!classDefinition: #DCXXXV category: 'NaturalNumbers'!
II subclass: #DCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXV class' category: 'NaturalNumbers'!
DCXXXV class
	instanceVariableNames: ''!

!DCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXXIV.
	next := DCXXXVI.! !


!classDefinition: #DCXXXVI category: 'NaturalNumbers'!
II subclass: #DCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXVI class' category: 'NaturalNumbers'!
DCXXXVI class
	instanceVariableNames: ''!

!DCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXXV.
	next := DCXXXVII.! !


!classDefinition: #DCXXXVII category: 'NaturalNumbers'!
II subclass: #DCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXVII class' category: 'NaturalNumbers'!
DCXXXVII class
	instanceVariableNames: ''!

!DCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXXVI.
	next := DCXXXVIII.! !


!classDefinition: #DCXXXVIII category: 'NaturalNumbers'!
II subclass: #DCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXVIII class' category: 'NaturalNumbers'!
DCXXXVIII class
	instanceVariableNames: ''!

!DCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DCXXXVII.
	next := DCXXXIX.! !


!classDefinition: #DI category: 'NaturalNumbers'!
II subclass: #DI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DI class' category: 'NaturalNumbers'!
DI class
	instanceVariableNames: ''!

!DI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := D.
	next := DII.! !


!classDefinition: #DII category: 'NaturalNumbers'!
II subclass: #DII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DII class' category: 'NaturalNumbers'!
DII class
	instanceVariableNames: ''!

!DII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DI.
	next := DIII.! !


!classDefinition: #DIII category: 'NaturalNumbers'!
II subclass: #DIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DIII class' category: 'NaturalNumbers'!
DIII class
	instanceVariableNames: ''!

!DIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DII.
	next := DIV.! !


!classDefinition: #DIV category: 'NaturalNumbers'!
II subclass: #DIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DIV class' category: 'NaturalNumbers'!
DIV class
	instanceVariableNames: ''!

!DIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DIII.
	next := DV.! !


!classDefinition: #DIX category: 'NaturalNumbers'!
II subclass: #DIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DIX class' category: 'NaturalNumbers'!
DIX class
	instanceVariableNames: ''!

!DIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DVIII.
	next := DX.! !


!classDefinition: #DL category: 'NaturalNumbers'!
II subclass: #DL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DL class' category: 'NaturalNumbers'!
DL class
	instanceVariableNames: ''!

!DL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXLIX.
	next := DLI.! !


!classDefinition: #DLI category: 'NaturalNumbers'!
II subclass: #DLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLI class' category: 'NaturalNumbers'!
DLI class
	instanceVariableNames: ''!

!DLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DL.
	next := DLII.! !


!classDefinition: #DLII category: 'NaturalNumbers'!
II subclass: #DLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLII class' category: 'NaturalNumbers'!
DLII class
	instanceVariableNames: ''!

!DLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLI.
	next := DLIII.! !


!classDefinition: #DLIII category: 'NaturalNumbers'!
II subclass: #DLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLIII class' category: 'NaturalNumbers'!
DLIII class
	instanceVariableNames: ''!

!DLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLII.
	next := DLIV.! !


!classDefinition: #DLIV category: 'NaturalNumbers'!
II subclass: #DLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLIV class' category: 'NaturalNumbers'!
DLIV class
	instanceVariableNames: ''!

!DLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLIII.
	next := DLV.! !


!classDefinition: #DLIX category: 'NaturalNumbers'!
II subclass: #DLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLIX class' category: 'NaturalNumbers'!
DLIX class
	instanceVariableNames: ''!

!DLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLVIII.
	next := DLX.! !


!classDefinition: #DLV category: 'NaturalNumbers'!
II subclass: #DLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLV class' category: 'NaturalNumbers'!
DLV class
	instanceVariableNames: ''!

!DLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLIV.
	next := DLVI.! !


!classDefinition: #DLVI category: 'NaturalNumbers'!
II subclass: #DLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLVI class' category: 'NaturalNumbers'!
DLVI class
	instanceVariableNames: ''!

!DLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLV.
	next := DLVII.! !


!classDefinition: #DLVII category: 'NaturalNumbers'!
II subclass: #DLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLVII class' category: 'NaturalNumbers'!
DLVII class
	instanceVariableNames: ''!

!DLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLVI.
	next := DLVIII.! !


!classDefinition: #DLVIII category: 'NaturalNumbers'!
II subclass: #DLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLVIII class' category: 'NaturalNumbers'!
DLVIII class
	instanceVariableNames: ''!

!DLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLVII.
	next := DLIX.! !


!classDefinition: #DLX category: 'NaturalNumbers'!
II subclass: #DLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLX class' category: 'NaturalNumbers'!
DLX class
	instanceVariableNames: ''!

!DLX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLIX.
	next := DLXI.! !


!classDefinition: #DLXI category: 'NaturalNumbers'!
II subclass: #DLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXI class' category: 'NaturalNumbers'!
DLXI class
	instanceVariableNames: ''!

!DLXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLX.
	next := DLXII.! !


!classDefinition: #DLXII category: 'NaturalNumbers'!
II subclass: #DLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXII class' category: 'NaturalNumbers'!
DLXII class
	instanceVariableNames: ''!

!DLXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXI.
	next := DLXIII.! !


!classDefinition: #DLXIII category: 'NaturalNumbers'!
II subclass: #DLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXIII class' category: 'NaturalNumbers'!
DLXIII class
	instanceVariableNames: ''!

!DLXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXII.
	next := DLXIV.! !


!classDefinition: #DLXIV category: 'NaturalNumbers'!
II subclass: #DLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXIV class' category: 'NaturalNumbers'!
DLXIV class
	instanceVariableNames: ''!

!DLXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXIII.
	next := DLXV.! !


!classDefinition: #DLXIX category: 'NaturalNumbers'!
II subclass: #DLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXIX class' category: 'NaturalNumbers'!
DLXIX class
	instanceVariableNames: ''!

!DLXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXVIII.
	next := DLXX.! !


!classDefinition: #DLXV category: 'NaturalNumbers'!
II subclass: #DLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXV class' category: 'NaturalNumbers'!
DLXV class
	instanceVariableNames: ''!

!DLXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXIV.
	next := DLXVI.! !


!classDefinition: #DLXVI category: 'NaturalNumbers'!
II subclass: #DLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXVI class' category: 'NaturalNumbers'!
DLXVI class
	instanceVariableNames: ''!

!DLXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXV.
	next := DLXVII.! !


!classDefinition: #DLXVII category: 'NaturalNumbers'!
II subclass: #DLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXVII class' category: 'NaturalNumbers'!
DLXVII class
	instanceVariableNames: ''!

!DLXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXVI.
	next := DLXVIII.! !


!classDefinition: #DLXVIII category: 'NaturalNumbers'!
II subclass: #DLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXVIII class' category: 'NaturalNumbers'!
DLXVIII class
	instanceVariableNames: ''!

!DLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXVII.
	next := DLXIX.! !


!classDefinition: #DLXX category: 'NaturalNumbers'!
II subclass: #DLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXX class' category: 'NaturalNumbers'!
DLXX class
	instanceVariableNames: ''!

!DLXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXIX.
	next := DLXXI.! !


!classDefinition: #DLXXI category: 'NaturalNumbers'!
II subclass: #DLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXI class' category: 'NaturalNumbers'!
DLXXI class
	instanceVariableNames: ''!

!DLXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXX.
	next := DLXXII.! !


!classDefinition: #DLXXII category: 'NaturalNumbers'!
II subclass: #DLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXII class' category: 'NaturalNumbers'!
DLXXII class
	instanceVariableNames: ''!

!DLXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXI.
	next := DLXXIII.! !


!classDefinition: #DLXXIII category: 'NaturalNumbers'!
II subclass: #DLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXIII class' category: 'NaturalNumbers'!
DLXXIII class
	instanceVariableNames: ''!

!DLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXII.
	next := DLXXIV.! !


!classDefinition: #DLXXIV category: 'NaturalNumbers'!
II subclass: #DLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXIV class' category: 'NaturalNumbers'!
DLXXIV class
	instanceVariableNames: ''!

!DLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXIII.
	next := DLXXV.! !


!classDefinition: #DLXXIX category: 'NaturalNumbers'!
II subclass: #DLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXIX class' category: 'NaturalNumbers'!
DLXXIX class
	instanceVariableNames: ''!

!DLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXVIII.
	next := DLXXX.! !


!classDefinition: #DLXXV category: 'NaturalNumbers'!
II subclass: #DLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXV class' category: 'NaturalNumbers'!
DLXXV class
	instanceVariableNames: ''!

!DLXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXIV.
	next := DLXXVI.! !


!classDefinition: #DLXXVI category: 'NaturalNumbers'!
II subclass: #DLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXVI class' category: 'NaturalNumbers'!
DLXXVI class
	instanceVariableNames: ''!

!DLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXV.
	next := DLXXVII.! !


!classDefinition: #DLXXVII category: 'NaturalNumbers'!
II subclass: #DLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXVII class' category: 'NaturalNumbers'!
DLXXVII class
	instanceVariableNames: ''!

!DLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXVI.
	next := DLXXVIII.! !


!classDefinition: #DLXXVIII category: 'NaturalNumbers'!
II subclass: #DLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXVIII class' category: 'NaturalNumbers'!
DLXXVIII class
	instanceVariableNames: ''!

!DLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXVII.
	next := DLXXIX.! !


!classDefinition: #DLXXX category: 'NaturalNumbers'!
II subclass: #DLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXX class' category: 'NaturalNumbers'!
DLXXX class
	instanceVariableNames: ''!

!DLXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXIX.
	next := DLXXXI.! !


!classDefinition: #DLXXXI category: 'NaturalNumbers'!
II subclass: #DLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXI class' category: 'NaturalNumbers'!
DLXXXI class
	instanceVariableNames: ''!

!DLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXX.
	next := DLXXXII.! !


!classDefinition: #DLXXXII category: 'NaturalNumbers'!
II subclass: #DLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXII class' category: 'NaturalNumbers'!
DLXXXII class
	instanceVariableNames: ''!

!DLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXXI.
	next := DLXXXIII.! !


!classDefinition: #DLXXXIII category: 'NaturalNumbers'!
II subclass: #DLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXIII class' category: 'NaturalNumbers'!
DLXXXIII class
	instanceVariableNames: ''!

!DLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXXII.
	next := DLXXXIV.! !


!classDefinition: #DLXXXIV category: 'NaturalNumbers'!
II subclass: #DLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXIV class' category: 'NaturalNumbers'!
DLXXXIV class
	instanceVariableNames: ''!

!DLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXXIII.
	next := DLXXXV.! !


!classDefinition: #DLXXXIX category: 'NaturalNumbers'!
II subclass: #DLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXIX class' category: 'NaturalNumbers'!
DLXXXIX class
	instanceVariableNames: ''!

!DLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXXVIII.
	next := DXC.! !


!classDefinition: #DLXXXV category: 'NaturalNumbers'!
II subclass: #DLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXV class' category: 'NaturalNumbers'!
DLXXXV class
	instanceVariableNames: ''!

!DLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXXIV.
	next := DLXXXVI.! !


!classDefinition: #DLXXXVI category: 'NaturalNumbers'!
II subclass: #DLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXVI class' category: 'NaturalNumbers'!
DLXXXVI class
	instanceVariableNames: ''!

!DLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXXV.
	next := DLXXXVII.! !


!classDefinition: #DLXXXVII category: 'NaturalNumbers'!
II subclass: #DLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXVII class' category: 'NaturalNumbers'!
DLXXXVII class
	instanceVariableNames: ''!

!DLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXXVI.
	next := DLXXXVIII.! !


!classDefinition: #DLXXXVIII category: 'NaturalNumbers'!
II subclass: #DLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXVIII class' category: 'NaturalNumbers'!
DLXXXVIII class
	instanceVariableNames: ''!

!DLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXXVII.
	next := DLXXXIX.! !


!classDefinition: #DV category: 'NaturalNumbers'!
II subclass: #DV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DV class' category: 'NaturalNumbers'!
DV class
	instanceVariableNames: ''!

!DV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DIV.
	next := DVI.! !


!classDefinition: #DVI category: 'NaturalNumbers'!
II subclass: #DVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DVI class' category: 'NaturalNumbers'!
DVI class
	instanceVariableNames: ''!

!DVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DV.
	next := DVII.! !


!classDefinition: #DVII category: 'NaturalNumbers'!
II subclass: #DVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DVII class' category: 'NaturalNumbers'!
DVII class
	instanceVariableNames: ''!

!DVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DVI.
	next := DVIII.! !


!classDefinition: #DVIII category: 'NaturalNumbers'!
II subclass: #DVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DVIII class' category: 'NaturalNumbers'!
DVIII class
	instanceVariableNames: ''!

!DVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DVII.
	next := DIX.! !


!classDefinition: #DX category: 'NaturalNumbers'!
II subclass: #DX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DX class' category: 'NaturalNumbers'!
DX class
	instanceVariableNames: ''!

!DX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DIX.
	next := DXI.! !


!classDefinition: #DXC category: 'NaturalNumbers'!
II subclass: #DXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXC class' category: 'NaturalNumbers'!
DXC class
	instanceVariableNames: ''!

!DXC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DLXXXIX.
	next := DXCI.! !


!classDefinition: #DXCI category: 'NaturalNumbers'!
II subclass: #DXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCI class' category: 'NaturalNumbers'!
DXCI class
	instanceVariableNames: ''!

!DXCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXC.
	next := DXCII.! !


!classDefinition: #DXCII category: 'NaturalNumbers'!
II subclass: #DXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCII class' category: 'NaturalNumbers'!
DXCII class
	instanceVariableNames: ''!

!DXCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXCI.
	next := DXCIII.! !


!classDefinition: #DXCIII category: 'NaturalNumbers'!
II subclass: #DXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCIII class' category: 'NaturalNumbers'!
DXCIII class
	instanceVariableNames: ''!

!DXCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXCII.
	next := DXCIV.! !


!classDefinition: #DXCIV category: 'NaturalNumbers'!
II subclass: #DXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCIV class' category: 'NaturalNumbers'!
DXCIV class
	instanceVariableNames: ''!

!DXCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXCIII.
	next := DXCV.! !


!classDefinition: #DXCIX category: 'NaturalNumbers'!
II subclass: #DXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCIX class' category: 'NaturalNumbers'!
DXCIX class
	instanceVariableNames: ''!

!DXCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXCVIII.
	next := DC.! !


!classDefinition: #DXCV category: 'NaturalNumbers'!
II subclass: #DXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCV class' category: 'NaturalNumbers'!
DXCV class
	instanceVariableNames: ''!

!DXCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXCIV.
	next := DXCVI.! !


!classDefinition: #DXCVI category: 'NaturalNumbers'!
II subclass: #DXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCVI class' category: 'NaturalNumbers'!
DXCVI class
	instanceVariableNames: ''!

!DXCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXCV.
	next := DXCVII.! !


!classDefinition: #DXCVII category: 'NaturalNumbers'!
II subclass: #DXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCVII class' category: 'NaturalNumbers'!
DXCVII class
	instanceVariableNames: ''!

!DXCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXCVI.
	next := DXCVIII.! !


!classDefinition: #DXCVIII category: 'NaturalNumbers'!
II subclass: #DXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCVIII class' category: 'NaturalNumbers'!
DXCVIII class
	instanceVariableNames: ''!

!DXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXCVII.
	next := DXCIX.! !


!classDefinition: #DXI category: 'NaturalNumbers'!
II subclass: #DXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXI class' category: 'NaturalNumbers'!
DXI class
	instanceVariableNames: ''!

!DXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DX.
	next := DXII.! !


!classDefinition: #DXII category: 'NaturalNumbers'!
II subclass: #DXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXII class' category: 'NaturalNumbers'!
DXII class
	instanceVariableNames: ''!

!DXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXI.
	next := DXIII.! !


!classDefinition: #DXIII category: 'NaturalNumbers'!
II subclass: #DXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXIII class' category: 'NaturalNumbers'!
DXIII class
	instanceVariableNames: ''!

!DXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXII.
	next := DXIV.! !


!classDefinition: #DXIV category: 'NaturalNumbers'!
II subclass: #DXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXIV class' category: 'NaturalNumbers'!
DXIV class
	instanceVariableNames: ''!

!DXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXIII.
	next := DXV.! !


!classDefinition: #DXIX category: 'NaturalNumbers'!
II subclass: #DXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXIX class' category: 'NaturalNumbers'!
DXIX class
	instanceVariableNames: ''!

!DXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXVIII.
	next := DXX.! !


!classDefinition: #DXL category: 'NaturalNumbers'!
II subclass: #DXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXL class' category: 'NaturalNumbers'!
DXL class
	instanceVariableNames: ''!

!DXL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXXIX.
	next := DXLI.! !


!classDefinition: #DXLI category: 'NaturalNumbers'!
II subclass: #DXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLI class' category: 'NaturalNumbers'!
DXLI class
	instanceVariableNames: ''!

!DXLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXL.
	next := DXLII.! !


!classDefinition: #DXLII category: 'NaturalNumbers'!
II subclass: #DXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLII class' category: 'NaturalNumbers'!
DXLII class
	instanceVariableNames: ''!

!DXLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXLI.
	next := DXLIII.! !


!classDefinition: #DXLIII category: 'NaturalNumbers'!
II subclass: #DXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLIII class' category: 'NaturalNumbers'!
DXLIII class
	instanceVariableNames: ''!

!DXLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXLII.
	next := DXLIV.! !


!classDefinition: #DXLIV category: 'NaturalNumbers'!
II subclass: #DXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLIV class' category: 'NaturalNumbers'!
DXLIV class
	instanceVariableNames: ''!

!DXLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXLIII.
	next := DXLV.! !


!classDefinition: #DXLIX category: 'NaturalNumbers'!
II subclass: #DXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLIX class' category: 'NaturalNumbers'!
DXLIX class
	instanceVariableNames: ''!

!DXLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXLVIII.
	next := DL.! !


!classDefinition: #DXLV category: 'NaturalNumbers'!
II subclass: #DXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLV class' category: 'NaturalNumbers'!
DXLV class
	instanceVariableNames: ''!

!DXLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXLIV.
	next := DXLVI.! !


!classDefinition: #DXLVI category: 'NaturalNumbers'!
II subclass: #DXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLVI class' category: 'NaturalNumbers'!
DXLVI class
	instanceVariableNames: ''!

!DXLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXLV.
	next := DXLVII.! !


!classDefinition: #DXLVII category: 'NaturalNumbers'!
II subclass: #DXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLVII class' category: 'NaturalNumbers'!
DXLVII class
	instanceVariableNames: ''!

!DXLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXLVI.
	next := DXLVIII.! !


!classDefinition: #DXLVIII category: 'NaturalNumbers'!
II subclass: #DXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLVIII class' category: 'NaturalNumbers'!
DXLVIII class
	instanceVariableNames: ''!

!DXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXLVII.
	next := DXLIX.! !


!classDefinition: #DXV category: 'NaturalNumbers'!
II subclass: #DXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXV class' category: 'NaturalNumbers'!
DXV class
	instanceVariableNames: ''!

!DXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXIV.
	next := DXVI.! !


!classDefinition: #DXVI category: 'NaturalNumbers'!
II subclass: #DXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXVI class' category: 'NaturalNumbers'!
DXVI class
	instanceVariableNames: ''!

!DXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXV.
	next := DXVII.! !


!classDefinition: #DXVII category: 'NaturalNumbers'!
II subclass: #DXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXVII class' category: 'NaturalNumbers'!
DXVII class
	instanceVariableNames: ''!

!DXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXVI.
	next := DXVIII.! !


!classDefinition: #DXVIII category: 'NaturalNumbers'!
II subclass: #DXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXVIII class' category: 'NaturalNumbers'!
DXVIII class
	instanceVariableNames: ''!

!DXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXVII.
	next := DXIX.! !


!classDefinition: #DXX category: 'NaturalNumbers'!
II subclass: #DXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXX class' category: 'NaturalNumbers'!
DXX class
	instanceVariableNames: ''!

!DXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXIX.
	next := DXXI.! !


!classDefinition: #DXXI category: 'NaturalNumbers'!
II subclass: #DXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXI class' category: 'NaturalNumbers'!
DXXI class
	instanceVariableNames: ''!

!DXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXX.
	next := DXXII.! !


!classDefinition: #DXXII category: 'NaturalNumbers'!
II subclass: #DXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXII class' category: 'NaturalNumbers'!
DXXII class
	instanceVariableNames: ''!

!DXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXI.
	next := DXXIII.! !


!classDefinition: #DXXIII category: 'NaturalNumbers'!
II subclass: #DXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXIII class' category: 'NaturalNumbers'!
DXXIII class
	instanceVariableNames: ''!

!DXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXII.
	next := DXXIV.! !


!classDefinition: #DXXIV category: 'NaturalNumbers'!
II subclass: #DXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXIV class' category: 'NaturalNumbers'!
DXXIV class
	instanceVariableNames: ''!

!DXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXIII.
	next := DXXV.! !


!classDefinition: #DXXIX category: 'NaturalNumbers'!
II subclass: #DXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXIX class' category: 'NaturalNumbers'!
DXXIX class
	instanceVariableNames: ''!

!DXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXVIII.
	next := DXXX.! !


!classDefinition: #DXXV category: 'NaturalNumbers'!
II subclass: #DXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXV class' category: 'NaturalNumbers'!
DXXV class
	instanceVariableNames: ''!

!DXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXIV.
	next := DXXVI.! !


!classDefinition: #DXXVI category: 'NaturalNumbers'!
II subclass: #DXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXVI class' category: 'NaturalNumbers'!
DXXVI class
	instanceVariableNames: ''!

!DXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXV.
	next := DXXVII.! !


!classDefinition: #DXXVII category: 'NaturalNumbers'!
II subclass: #DXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXVII class' category: 'NaturalNumbers'!
DXXVII class
	instanceVariableNames: ''!

!DXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXVI.
	next := DXXVIII.! !


!classDefinition: #DXXVIII category: 'NaturalNumbers'!
II subclass: #DXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXVIII class' category: 'NaturalNumbers'!
DXXVIII class
	instanceVariableNames: ''!

!DXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXVII.
	next := DXXIX.! !


!classDefinition: #DXXX category: 'NaturalNumbers'!
II subclass: #DXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXX class' category: 'NaturalNumbers'!
DXXX class
	instanceVariableNames: ''!

!DXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXIX.
	next := DXXXI.! !


!classDefinition: #DXXXI category: 'NaturalNumbers'!
II subclass: #DXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXI class' category: 'NaturalNumbers'!
DXXXI class
	instanceVariableNames: ''!

!DXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXX.
	next := DXXXII.! !


!classDefinition: #DXXXII category: 'NaturalNumbers'!
II subclass: #DXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXII class' category: 'NaturalNumbers'!
DXXXII class
	instanceVariableNames: ''!

!DXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXXI.
	next := DXXXIII.! !


!classDefinition: #DXXXIII category: 'NaturalNumbers'!
II subclass: #DXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXIII class' category: 'NaturalNumbers'!
DXXXIII class
	instanceVariableNames: ''!

!DXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXXII.
	next := DXXXIV.! !


!classDefinition: #DXXXIV category: 'NaturalNumbers'!
II subclass: #DXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXIV class' category: 'NaturalNumbers'!
DXXXIV class
	instanceVariableNames: ''!

!DXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXXIII.
	next := DXXXV.! !


!classDefinition: #DXXXIX category: 'NaturalNumbers'!
II subclass: #DXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXIX class' category: 'NaturalNumbers'!
DXXXIX class
	instanceVariableNames: ''!

!DXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXXVIII.
	next := DXL.! !


!classDefinition: #DXXXV category: 'NaturalNumbers'!
II subclass: #DXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXV class' category: 'NaturalNumbers'!
DXXXV class
	instanceVariableNames: ''!

!DXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXXIV.
	next := DXXXVI.! !


!classDefinition: #DXXXVI category: 'NaturalNumbers'!
II subclass: #DXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXVI class' category: 'NaturalNumbers'!
DXXXVI class
	instanceVariableNames: ''!

!DXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXXV.
	next := DXXXVII.! !


!classDefinition: #DXXXVII category: 'NaturalNumbers'!
II subclass: #DXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXVII class' category: 'NaturalNumbers'!
DXXXVII class
	instanceVariableNames: ''!

!DXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXXVI.
	next := DXXXVIII.! !


!classDefinition: #DXXXVIII category: 'NaturalNumbers'!
II subclass: #DXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXVIII class' category: 'NaturalNumbers'!
DXXXVIII class
	instanceVariableNames: ''!

!DXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := DXXXVII.
	next := DXXXIX.! !


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

!III class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
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

!IV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := III.
	next := V.! !


!classDefinition: #IX category: 'NaturalNumbers'!
II subclass: #IX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IX class' category: 'NaturalNumbers'!
IX class
	instanceVariableNames: ''!

!IX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := VIII.
	next := X.! !


!classDefinition: #L category: 'NaturalNumbers'!
II subclass: #L
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'L class' category: 'NaturalNumbers'!
L class
	instanceVariableNames: ''!

!L class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XLIX.
	next := LI.! !


!classDefinition: #LI category: 'NaturalNumbers'!
II subclass: #LI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LI class' category: 'NaturalNumbers'!
LI class
	instanceVariableNames: ''!

!LI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := L.
	next := LII.! !


!classDefinition: #LII category: 'NaturalNumbers'!
II subclass: #LII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LII class' category: 'NaturalNumbers'!
LII class
	instanceVariableNames: ''!

!LII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LI.
	next := LIII.! !


!classDefinition: #LIII category: 'NaturalNumbers'!
II subclass: #LIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIII class' category: 'NaturalNumbers'!
LIII class
	instanceVariableNames: ''!

!LIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LII.
	next := LIV.! !


!classDefinition: #LIV category: 'NaturalNumbers'!
II subclass: #LIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIV class' category: 'NaturalNumbers'!
LIV class
	instanceVariableNames: ''!

!LIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LIII.
	next := LV.! !


!classDefinition: #LIX category: 'NaturalNumbers'!
II subclass: #LIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIX class' category: 'NaturalNumbers'!
LIX class
	instanceVariableNames: ''!

!LIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LVIII.
	next := LX.! !


!classDefinition: #LV category: 'NaturalNumbers'!
II subclass: #LV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LV class' category: 'NaturalNumbers'!
LV class
	instanceVariableNames: ''!

!LV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LIV.
	next := LVI.! !


!classDefinition: #LVI category: 'NaturalNumbers'!
II subclass: #LVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVI class' category: 'NaturalNumbers'!
LVI class
	instanceVariableNames: ''!

!LVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LV.
	next := LVII.! !


!classDefinition: #LVII category: 'NaturalNumbers'!
II subclass: #LVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVII class' category: 'NaturalNumbers'!
LVII class
	instanceVariableNames: ''!

!LVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LVI.
	next := LVIII.! !


!classDefinition: #LVIII category: 'NaturalNumbers'!
II subclass: #LVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVIII class' category: 'NaturalNumbers'!
LVIII class
	instanceVariableNames: ''!

!LVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LVII.
	next := LIX.! !


!classDefinition: #LX category: 'NaturalNumbers'!
II subclass: #LX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LX class' category: 'NaturalNumbers'!
LX class
	instanceVariableNames: ''!

!LX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LIX.
	next := LXI.! !


!classDefinition: #LXI category: 'NaturalNumbers'!
II subclass: #LXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXI class' category: 'NaturalNumbers'!
LXI class
	instanceVariableNames: ''!

!LXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LX.
	next := LXII.! !


!classDefinition: #LXII category: 'NaturalNumbers'!
II subclass: #LXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXII class' category: 'NaturalNumbers'!
LXII class
	instanceVariableNames: ''!

!LXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXI.
	next := LXIII.! !


!classDefinition: #LXIII category: 'NaturalNumbers'!
II subclass: #LXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIII class' category: 'NaturalNumbers'!
LXIII class
	instanceVariableNames: ''!

!LXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXII.
	next := LXIV.! !


!classDefinition: #LXIV category: 'NaturalNumbers'!
II subclass: #LXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIV class' category: 'NaturalNumbers'!
LXIV class
	instanceVariableNames: ''!

!LXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXIII.
	next := LXV.! !


!classDefinition: #LXIX category: 'NaturalNumbers'!
II subclass: #LXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIX class' category: 'NaturalNumbers'!
LXIX class
	instanceVariableNames: ''!

!LXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXVIII.
	next := LXX.! !


!classDefinition: #LXV category: 'NaturalNumbers'!
II subclass: #LXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXV class' category: 'NaturalNumbers'!
LXV class
	instanceVariableNames: ''!

!LXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXIV.
	next := LXVI.! !


!classDefinition: #LXVI category: 'NaturalNumbers'!
II subclass: #LXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVI class' category: 'NaturalNumbers'!
LXVI class
	instanceVariableNames: ''!

!LXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXV.
	next := LXVII.! !


!classDefinition: #LXVII category: 'NaturalNumbers'!
II subclass: #LXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVII class' category: 'NaturalNumbers'!
LXVII class
	instanceVariableNames: ''!

!LXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXVI.
	next := LXVIII.! !


!classDefinition: #LXVIII category: 'NaturalNumbers'!
II subclass: #LXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVIII class' category: 'NaturalNumbers'!
LXVIII class
	instanceVariableNames: ''!

!LXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXVII.
	next := LXIX.! !


!classDefinition: #LXX category: 'NaturalNumbers'!
II subclass: #LXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXX class' category: 'NaturalNumbers'!
LXX class
	instanceVariableNames: ''!

!LXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXIX.
	next := LXXI.! !


!classDefinition: #LXXI category: 'NaturalNumbers'!
II subclass: #LXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXI class' category: 'NaturalNumbers'!
LXXI class
	instanceVariableNames: ''!

!LXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXX.
	next := LXXII.! !


!classDefinition: #LXXII category: 'NaturalNumbers'!
II subclass: #LXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXII class' category: 'NaturalNumbers'!
LXXII class
	instanceVariableNames: ''!

!LXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXI.
	next := LXXIII.! !


!classDefinition: #LXXIII category: 'NaturalNumbers'!
II subclass: #LXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIII class' category: 'NaturalNumbers'!
LXXIII class
	instanceVariableNames: ''!

!LXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXII.
	next := LXXIV.! !


!classDefinition: #LXXIV category: 'NaturalNumbers'!
II subclass: #LXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIV class' category: 'NaturalNumbers'!
LXXIV class
	instanceVariableNames: ''!

!LXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXIII.
	next := LXXV.! !


!classDefinition: #LXXIX category: 'NaturalNumbers'!
II subclass: #LXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIX class' category: 'NaturalNumbers'!
LXXIX class
	instanceVariableNames: ''!

!LXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXVIII.
	next := LXXX.! !


!classDefinition: #LXXV category: 'NaturalNumbers'!
II subclass: #LXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXV class' category: 'NaturalNumbers'!
LXXV class
	instanceVariableNames: ''!

!LXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXIV.
	next := LXXVI.! !


!classDefinition: #LXXVI category: 'NaturalNumbers'!
II subclass: #LXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVI class' category: 'NaturalNumbers'!
LXXVI class
	instanceVariableNames: ''!

!LXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXV.
	next := LXXVII.! !


!classDefinition: #LXXVII category: 'NaturalNumbers'!
II subclass: #LXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVII class' category: 'NaturalNumbers'!
LXXVII class
	instanceVariableNames: ''!

!LXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXVI.
	next := LXXVIII.! !


!classDefinition: #LXXVIII category: 'NaturalNumbers'!
II subclass: #LXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVIII class' category: 'NaturalNumbers'!
LXXVIII class
	instanceVariableNames: ''!

!LXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXVII.
	next := LXXIX.! !


!classDefinition: #LXXX category: 'NaturalNumbers'!
II subclass: #LXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXX class' category: 'NaturalNumbers'!
LXXX class
	instanceVariableNames: ''!

!LXXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXIX.
	next := LXXXI.! !


!classDefinition: #LXXXI category: 'NaturalNumbers'!
II subclass: #LXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXI class' category: 'NaturalNumbers'!
LXXXI class
	instanceVariableNames: ''!

!LXXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXX.
	next := LXXXII.! !


!classDefinition: #LXXXII category: 'NaturalNumbers'!
II subclass: #LXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXII class' category: 'NaturalNumbers'!
LXXXII class
	instanceVariableNames: ''!

!LXXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXXI.
	next := LXXXIII.! !


!classDefinition: #LXXXIII category: 'NaturalNumbers'!
II subclass: #LXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIII class' category: 'NaturalNumbers'!
LXXXIII class
	instanceVariableNames: ''!

!LXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXXII.
	next := LXXXIV.! !


!classDefinition: #LXXXIV category: 'NaturalNumbers'!
II subclass: #LXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIV class' category: 'NaturalNumbers'!
LXXXIV class
	instanceVariableNames: ''!

!LXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXXIII.
	next := LXXXV.! !


!classDefinition: #LXXXIX category: 'NaturalNumbers'!
II subclass: #LXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIX class' category: 'NaturalNumbers'!
LXXXIX class
	instanceVariableNames: ''!

!LXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXXVIII.
	next := XC.! !


!classDefinition: #LXXXV category: 'NaturalNumbers'!
II subclass: #LXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXV class' category: 'NaturalNumbers'!
LXXXV class
	instanceVariableNames: ''!

!LXXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXXIV.
	next := LXXXVI.! !


!classDefinition: #LXXXVI category: 'NaturalNumbers'!
II subclass: #LXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVI class' category: 'NaturalNumbers'!
LXXXVI class
	instanceVariableNames: ''!

!LXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXXV.
	next := LXXXVII.! !


!classDefinition: #LXXXVII category: 'NaturalNumbers'!
II subclass: #LXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVII class' category: 'NaturalNumbers'!
LXXXVII class
	instanceVariableNames: ''!

!LXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXXVI.
	next := LXXXVIII.! !


!classDefinition: #LXXXVIII category: 'NaturalNumbers'!
II subclass: #LXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVIII class' category: 'NaturalNumbers'!
LXXXVIII class
	instanceVariableNames: ''!

!LXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXXVII.
	next := LXXXIX.! !


!classDefinition: #V category: 'NaturalNumbers'!
II subclass: #V
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'V class' category: 'NaturalNumbers'!
V class
	instanceVariableNames: ''!

!V class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := IV.
	next := VI.! !


!classDefinition: #VI category: 'NaturalNumbers'!
II subclass: #VI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VI class' category: 'NaturalNumbers'!
VI class
	instanceVariableNames: ''!

!VI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := V.
	next := VII.! !


!classDefinition: #VII category: 'NaturalNumbers'!
II subclass: #VII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VII class' category: 'NaturalNumbers'!
VII class
	instanceVariableNames: ''!

!VII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := VI.
	next := VIII.! !


!classDefinition: #VIII category: 'NaturalNumbers'!
II subclass: #VIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VIII class' category: 'NaturalNumbers'!
VIII class
	instanceVariableNames: ''!

!VIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := VII.
	next := IX.! !


!classDefinition: #X category: 'NaturalNumbers'!
II subclass: #X
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'X class' category: 'NaturalNumbers'!
X class
	instanceVariableNames: ''!

!X class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := IX.
	next := XI.! !


!classDefinition: #XC category: 'NaturalNumbers'!
II subclass: #XC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XC class' category: 'NaturalNumbers'!
XC class
	instanceVariableNames: ''!

!XC class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := LXXXIX.
	next := XCI.! !


!classDefinition: #XCI category: 'NaturalNumbers'!
II subclass: #XCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCI class' category: 'NaturalNumbers'!
XCI class
	instanceVariableNames: ''!

!XCI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XC.
	next := XCII.! !


!classDefinition: #XCII category: 'NaturalNumbers'!
II subclass: #XCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCII class' category: 'NaturalNumbers'!
XCII class
	instanceVariableNames: ''!

!XCII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XCI.
	next := XCIII.! !


!classDefinition: #XCIII category: 'NaturalNumbers'!
II subclass: #XCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIII class' category: 'NaturalNumbers'!
XCIII class
	instanceVariableNames: ''!

!XCIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XCII.
	next := XCIV.! !


!classDefinition: #XCIV category: 'NaturalNumbers'!
II subclass: #XCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIV class' category: 'NaturalNumbers'!
XCIV class
	instanceVariableNames: ''!

!XCIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XCIII.
	next := XCV.! !


!classDefinition: #XCIX category: 'NaturalNumbers'!
II subclass: #XCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIX class' category: 'NaturalNumbers'!
XCIX class
	instanceVariableNames: ''!

!XCIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XCVIII.
	next := C.! !


!classDefinition: #XCV category: 'NaturalNumbers'!
II subclass: #XCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCV class' category: 'NaturalNumbers'!
XCV class
	instanceVariableNames: ''!

!XCV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XCIV.
	next := XCVI.! !


!classDefinition: #XCVI category: 'NaturalNumbers'!
II subclass: #XCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVI class' category: 'NaturalNumbers'!
XCVI class
	instanceVariableNames: ''!

!XCVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XCV.
	next := XCVII.! !


!classDefinition: #XCVII category: 'NaturalNumbers'!
II subclass: #XCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVII class' category: 'NaturalNumbers'!
XCVII class
	instanceVariableNames: ''!

!XCVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XCVI.
	next := XCVIII.! !


!classDefinition: #XCVIII category: 'NaturalNumbers'!
II subclass: #XCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVIII class' category: 'NaturalNumbers'!
XCVIII class
	instanceVariableNames: ''!

!XCVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XCVII.
	next := XCIX.! !


!classDefinition: #XI category: 'NaturalNumbers'!
II subclass: #XI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XI class' category: 'NaturalNumbers'!
XI class
	instanceVariableNames: ''!

!XI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := X.
	next := XII.! !


!classDefinition: #XII category: 'NaturalNumbers'!
II subclass: #XII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XII class' category: 'NaturalNumbers'!
XII class
	instanceVariableNames: ''!

!XII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XI.
	next := XIII.! !


!classDefinition: #XIII category: 'NaturalNumbers'!
II subclass: #XIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIII class' category: 'NaturalNumbers'!
XIII class
	instanceVariableNames: ''!

!XIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XII.
	next := XIV.! !


!classDefinition: #XIV category: 'NaturalNumbers'!
II subclass: #XIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIV class' category: 'NaturalNumbers'!
XIV class
	instanceVariableNames: ''!

!XIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XIII.
	next := XV.! !


!classDefinition: #XIX category: 'NaturalNumbers'!
II subclass: #XIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIX class' category: 'NaturalNumbers'!
XIX class
	instanceVariableNames: ''!

!XIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XVIII.
	next := XX.! !


!classDefinition: #XL category: 'NaturalNumbers'!
II subclass: #XL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XL class' category: 'NaturalNumbers'!
XL class
	instanceVariableNames: ''!

!XL class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXXIX.
	next := XLI.! !


!classDefinition: #XLI category: 'NaturalNumbers'!
II subclass: #XLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLI class' category: 'NaturalNumbers'!
XLI class
	instanceVariableNames: ''!

!XLI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XL.
	next := XLII.! !


!classDefinition: #XLII category: 'NaturalNumbers'!
II subclass: #XLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLII class' category: 'NaturalNumbers'!
XLII class
	instanceVariableNames: ''!

!XLII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XLI.
	next := XLIII.! !


!classDefinition: #XLIII category: 'NaturalNumbers'!
II subclass: #XLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIII class' category: 'NaturalNumbers'!
XLIII class
	instanceVariableNames: ''!

!XLIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XLII.
	next := XLIV.! !


!classDefinition: #XLIV category: 'NaturalNumbers'!
II subclass: #XLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIV class' category: 'NaturalNumbers'!
XLIV class
	instanceVariableNames: ''!

!XLIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XLIII.
	next := XLV.! !


!classDefinition: #XLIX category: 'NaturalNumbers'!
II subclass: #XLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIX class' category: 'NaturalNumbers'!
XLIX class
	instanceVariableNames: ''!

!XLIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XLVIII.
	next := L.! !


!classDefinition: #XLV category: 'NaturalNumbers'!
II subclass: #XLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLV class' category: 'NaturalNumbers'!
XLV class
	instanceVariableNames: ''!

!XLV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XLIV.
	next := XLVI.! !


!classDefinition: #XLVI category: 'NaturalNumbers'!
II subclass: #XLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVI class' category: 'NaturalNumbers'!
XLVI class
	instanceVariableNames: ''!

!XLVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XLV.
	next := XLVII.! !


!classDefinition: #XLVII category: 'NaturalNumbers'!
II subclass: #XLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVII class' category: 'NaturalNumbers'!
XLVII class
	instanceVariableNames: ''!

!XLVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XLVI.
	next := XLVIII.! !


!classDefinition: #XLVIII category: 'NaturalNumbers'!
II subclass: #XLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVIII class' category: 'NaturalNumbers'!
XLVIII class
	instanceVariableNames: ''!

!XLVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XLVII.
	next := XLIX.! !


!classDefinition: #XV category: 'NaturalNumbers'!
II subclass: #XV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XV class' category: 'NaturalNumbers'!
XV class
	instanceVariableNames: ''!

!XV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XIV.
	next := XVI.! !


!classDefinition: #XVI category: 'NaturalNumbers'!
II subclass: #XVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVI class' category: 'NaturalNumbers'!
XVI class
	instanceVariableNames: ''!

!XVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XV.
	next := XVII.! !


!classDefinition: #XVII category: 'NaturalNumbers'!
II subclass: #XVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVII class' category: 'NaturalNumbers'!
XVII class
	instanceVariableNames: ''!

!XVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XVI.
	next := XVIII.! !


!classDefinition: #XVIII category: 'NaturalNumbers'!
II subclass: #XVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVIII class' category: 'NaturalNumbers'!
XVIII class
	instanceVariableNames: ''!

!XVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XVII.
	next := XIX.! !


!classDefinition: #XX category: 'NaturalNumbers'!
II subclass: #XX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XX class' category: 'NaturalNumbers'!
XX class
	instanceVariableNames: ''!

!XX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XIX.
	next := XXI.! !


!classDefinition: #XXI category: 'NaturalNumbers'!
II subclass: #XXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXI class' category: 'NaturalNumbers'!
XXI class
	instanceVariableNames: ''!

!XXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XX.
	next := XXII.! !


!classDefinition: #XXII category: 'NaturalNumbers'!
II subclass: #XXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXII class' category: 'NaturalNumbers'!
XXII class
	instanceVariableNames: ''!

!XXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXI.
	next := XXIII.! !


!classDefinition: #XXIII category: 'NaturalNumbers'!
II subclass: #XXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIII class' category: 'NaturalNumbers'!
XXIII class
	instanceVariableNames: ''!

!XXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXII.
	next := XXIV.! !


!classDefinition: #XXIV category: 'NaturalNumbers'!
II subclass: #XXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIV class' category: 'NaturalNumbers'!
XXIV class
	instanceVariableNames: ''!

!XXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXIII.
	next := XXV.! !


!classDefinition: #XXIX category: 'NaturalNumbers'!
II subclass: #XXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIX class' category: 'NaturalNumbers'!
XXIX class
	instanceVariableNames: ''!

!XXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXVIII.
	next := XXX.! !


!classDefinition: #XXV category: 'NaturalNumbers'!
II subclass: #XXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXV class' category: 'NaturalNumbers'!
XXV class
	instanceVariableNames: ''!

!XXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXIV.
	next := XXVI.! !


!classDefinition: #XXVI category: 'NaturalNumbers'!
II subclass: #XXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVI class' category: 'NaturalNumbers'!
XXVI class
	instanceVariableNames: ''!

!XXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXV.
	next := XXVII.! !


!classDefinition: #XXVII category: 'NaturalNumbers'!
II subclass: #XXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVII class' category: 'NaturalNumbers'!
XXVII class
	instanceVariableNames: ''!

!XXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXVI.
	next := XXVIII.! !


!classDefinition: #XXVIII category: 'NaturalNumbers'!
II subclass: #XXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVIII class' category: 'NaturalNumbers'!
XXVIII class
	instanceVariableNames: ''!

!XXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXVII.
	next := XXIX.! !


!classDefinition: #XXX category: 'NaturalNumbers'!
II subclass: #XXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXX class' category: 'NaturalNumbers'!
XXX class
	instanceVariableNames: ''!

!XXX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXIX.
	next := XXXI.! !


!classDefinition: #XXXI category: 'NaturalNumbers'!
II subclass: #XXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXI class' category: 'NaturalNumbers'!
XXXI class
	instanceVariableNames: ''!

!XXXI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXX.
	next := XXXII.! !


!classDefinition: #XXXII category: 'NaturalNumbers'!
II subclass: #XXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXII class' category: 'NaturalNumbers'!
XXXII class
	instanceVariableNames: ''!

!XXXII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXXI.
	next := XXXIII.! !


!classDefinition: #XXXIII category: 'NaturalNumbers'!
II subclass: #XXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIII class' category: 'NaturalNumbers'!
XXXIII class
	instanceVariableNames: ''!

!XXXIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXXII.
	next := XXXIV.! !


!classDefinition: #XXXIV category: 'NaturalNumbers'!
II subclass: #XXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIV class' category: 'NaturalNumbers'!
XXXIV class
	instanceVariableNames: ''!

!XXXIV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXXIII.
	next := XXXV.! !


!classDefinition: #XXXIX category: 'NaturalNumbers'!
II subclass: #XXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIX class' category: 'NaturalNumbers'!
XXXIX class
	instanceVariableNames: ''!

!XXXIX class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXXVIII.
	next := XL.! !


!classDefinition: #XXXV category: 'NaturalNumbers'!
II subclass: #XXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXV class' category: 'NaturalNumbers'!
XXXV class
	instanceVariableNames: ''!

!XXXV class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXXIV.
	next := XXXVI.! !


!classDefinition: #XXXVI category: 'NaturalNumbers'!
II subclass: #XXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVI class' category: 'NaturalNumbers'!
XXXVI class
	instanceVariableNames: ''!

!XXXVI class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXXV.
	next := XXXVII.! !


!classDefinition: #XXXVII category: 'NaturalNumbers'!
II subclass: #XXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVII class' category: 'NaturalNumbers'!
XXXVII class
	instanceVariableNames: ''!

!XXXVII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXXVI.
	next := XXXVIII.! !


!classDefinition: #XXXVIII category: 'NaturalNumbers'!
II subclass: #XXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVIII class' category: 'NaturalNumbers'!
XXXVIII class
	instanceVariableNames: ''!

!XXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'TD 8/29/2022 21:40:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := XXXVII.
	next := XXXIX.! !

II initializeAfterFileIn!
C initializeAfterFileIn!
CC initializeAfterFileIn!
CCC initializeAfterFileIn!
CCCI initializeAfterFileIn!
CCCII initializeAfterFileIn!
CCCIII initializeAfterFileIn!
CCCIV initializeAfterFileIn!
CCCIX initializeAfterFileIn!
CCCL initializeAfterFileIn!
CCCLI initializeAfterFileIn!
CCCLII initializeAfterFileIn!
CCCLIII initializeAfterFileIn!
CCCLIV initializeAfterFileIn!
CCCLIX initializeAfterFileIn!
CCCLV initializeAfterFileIn!
CCCLVI initializeAfterFileIn!
CCCLVII initializeAfterFileIn!
CCCLVIII initializeAfterFileIn!
CCCLX initializeAfterFileIn!
CCCLXI initializeAfterFileIn!
CCCLXII initializeAfterFileIn!
CCCLXIII initializeAfterFileIn!
CCCLXIV initializeAfterFileIn!
CCCLXIX initializeAfterFileIn!
CCCLXV initializeAfterFileIn!
CCCLXVI initializeAfterFileIn!
CCCLXVII initializeAfterFileIn!
CCCLXVIII initializeAfterFileIn!
CCCLXX initializeAfterFileIn!
CCCLXXI initializeAfterFileIn!
CCCLXXII initializeAfterFileIn!
CCCLXXIII initializeAfterFileIn!
CCCLXXIV initializeAfterFileIn!
CCCLXXIX initializeAfterFileIn!
CCCLXXV initializeAfterFileIn!
CCCLXXVI initializeAfterFileIn!
CCCLXXVII initializeAfterFileIn!
CCCLXXVIII initializeAfterFileIn!
CCCLXXX initializeAfterFileIn!
CCCLXXXI initializeAfterFileIn!
CCCLXXXII initializeAfterFileIn!
CCCLXXXIII initializeAfterFileIn!
CCCLXXXIV initializeAfterFileIn!
CCCLXXXIX initializeAfterFileIn!
CCCLXXXV initializeAfterFileIn!
CCCLXXXVI initializeAfterFileIn!
CCCLXXXVII initializeAfterFileIn!
CCCLXXXVIII initializeAfterFileIn!
CCCV initializeAfterFileIn!
CCCVI initializeAfterFileIn!
CCCVII initializeAfterFileIn!
CCCVIII initializeAfterFileIn!
CCCX initializeAfterFileIn!
CCCXC initializeAfterFileIn!
CCCXCI initializeAfterFileIn!
CCCXCII initializeAfterFileIn!
CCCXCIII initializeAfterFileIn!
CCCXCIV initializeAfterFileIn!
CCCXCIX initializeAfterFileIn!
CCCXCV initializeAfterFileIn!
CCCXCVI initializeAfterFileIn!
CCCXCVII initializeAfterFileIn!
CCCXCVIII initializeAfterFileIn!
CCCXI initializeAfterFileIn!
CCCXII initializeAfterFileIn!
CCCXIII initializeAfterFileIn!
CCCXIV initializeAfterFileIn!
CCCXIX initializeAfterFileIn!
CCCXL initializeAfterFileIn!
CCCXLI initializeAfterFileIn!
CCCXLII initializeAfterFileIn!
CCCXLIII initializeAfterFileIn!
CCCXLIV initializeAfterFileIn!
CCCXLIX initializeAfterFileIn!
CCCXLV initializeAfterFileIn!
CCCXLVI initializeAfterFileIn!
CCCXLVII initializeAfterFileIn!
CCCXLVIII initializeAfterFileIn!
CCCXV initializeAfterFileIn!
CCCXVI initializeAfterFileIn!
CCCXVII initializeAfterFileIn!
CCCXVIII initializeAfterFileIn!
CCCXX initializeAfterFileIn!
CCCXXI initializeAfterFileIn!
CCCXXII initializeAfterFileIn!
CCCXXIII initializeAfterFileIn!
CCCXXIV initializeAfterFileIn!
CCCXXIX initializeAfterFileIn!
CCCXXV initializeAfterFileIn!
CCCXXVI initializeAfterFileIn!
CCCXXVII initializeAfterFileIn!
CCCXXVIII initializeAfterFileIn!
CCCXXX initializeAfterFileIn!
CCCXXXI initializeAfterFileIn!
CCCXXXII initializeAfterFileIn!
CCCXXXIII initializeAfterFileIn!
CCCXXXIV initializeAfterFileIn!
CCCXXXIX initializeAfterFileIn!
CCCXXXV initializeAfterFileIn!
CCCXXXVI initializeAfterFileIn!
CCCXXXVII initializeAfterFileIn!
CCCXXXVIII initializeAfterFileIn!
CCI initializeAfterFileIn!
CCII initializeAfterFileIn!
CCIII initializeAfterFileIn!
CCIV initializeAfterFileIn!
CCIX initializeAfterFileIn!
CCL initializeAfterFileIn!
CCLI initializeAfterFileIn!
CCLII initializeAfterFileIn!
CCLIII initializeAfterFileIn!
CCLIV initializeAfterFileIn!
CCLIX initializeAfterFileIn!
CCLV initializeAfterFileIn!
CCLVI initializeAfterFileIn!
CCLVII initializeAfterFileIn!
CCLVIII initializeAfterFileIn!
CCLX initializeAfterFileIn!
CCLXI initializeAfterFileIn!
CCLXII initializeAfterFileIn!
CCLXIII initializeAfterFileIn!
CCLXIV initializeAfterFileIn!
CCLXIX initializeAfterFileIn!
CCLXV initializeAfterFileIn!
CCLXVI initializeAfterFileIn!
CCLXVII initializeAfterFileIn!
CCLXVIII initializeAfterFileIn!
CCLXX initializeAfterFileIn!
CCLXXI initializeAfterFileIn!
CCLXXII initializeAfterFileIn!
CCLXXIII initializeAfterFileIn!
CCLXXIV initializeAfterFileIn!
CCLXXIX initializeAfterFileIn!
CCLXXV initializeAfterFileIn!
CCLXXVI initializeAfterFileIn!
CCLXXVII initializeAfterFileIn!
CCLXXVIII initializeAfterFileIn!
CCLXXX initializeAfterFileIn!
CCLXXXI initializeAfterFileIn!
CCLXXXII initializeAfterFileIn!
CCLXXXIII initializeAfterFileIn!
CCLXXXIV initializeAfterFileIn!
CCLXXXIX initializeAfterFileIn!
CCLXXXV initializeAfterFileIn!
CCLXXXVI initializeAfterFileIn!
CCLXXXVII initializeAfterFileIn!
CCLXXXVIII initializeAfterFileIn!
CCV initializeAfterFileIn!
CCVI initializeAfterFileIn!
CCVII initializeAfterFileIn!
CCVIII initializeAfterFileIn!
CCX initializeAfterFileIn!
CCXC initializeAfterFileIn!
CCXCI initializeAfterFileIn!
CCXCII initializeAfterFileIn!
CCXCIII initializeAfterFileIn!
CCXCIV initializeAfterFileIn!
CCXCIX initializeAfterFileIn!
CCXCV initializeAfterFileIn!
CCXCVI initializeAfterFileIn!
CCXCVII initializeAfterFileIn!
CCXCVIII initializeAfterFileIn!
CCXI initializeAfterFileIn!
CCXII initializeAfterFileIn!
CCXIII initializeAfterFileIn!
CCXIV initializeAfterFileIn!
CCXIX initializeAfterFileIn!
CCXL initializeAfterFileIn!
CCXLI initializeAfterFileIn!
CCXLII initializeAfterFileIn!
CCXLIII initializeAfterFileIn!
CCXLIV initializeAfterFileIn!
CCXLIX initializeAfterFileIn!
CCXLV initializeAfterFileIn!
CCXLVI initializeAfterFileIn!
CCXLVII initializeAfterFileIn!
CCXLVIII initializeAfterFileIn!
CCXV initializeAfterFileIn!
CCXVI initializeAfterFileIn!
CCXVII initializeAfterFileIn!
CCXVIII initializeAfterFileIn!
CCXX initializeAfterFileIn!
CCXXI initializeAfterFileIn!
CCXXII initializeAfterFileIn!
CCXXIII initializeAfterFileIn!
CCXXIV initializeAfterFileIn!
CCXXIX initializeAfterFileIn!
CCXXV initializeAfterFileIn!
CCXXVI initializeAfterFileIn!
CCXXVII initializeAfterFileIn!
CCXXVIII initializeAfterFileIn!
CCXXX initializeAfterFileIn!
CCXXXI initializeAfterFileIn!
CCXXXII initializeAfterFileIn!
CCXXXIII initializeAfterFileIn!
CCXXXIV initializeAfterFileIn!
CCXXXIX initializeAfterFileIn!
CCXXXV initializeAfterFileIn!
CCXXXVI initializeAfterFileIn!
CCXXXVII initializeAfterFileIn!
CCXXXVIII initializeAfterFileIn!
CD initializeAfterFileIn!
CDI initializeAfterFileIn!
CDII initializeAfterFileIn!
CDIII initializeAfterFileIn!
CDIV initializeAfterFileIn!
CDIX initializeAfterFileIn!
CDL initializeAfterFileIn!
CDLI initializeAfterFileIn!
CDLII initializeAfterFileIn!
CDLIII initializeAfterFileIn!
CDLIV initializeAfterFileIn!
CDLIX initializeAfterFileIn!
CDLV initializeAfterFileIn!
CDLVI initializeAfterFileIn!
CDLVII initializeAfterFileIn!
CDLVIII initializeAfterFileIn!
CDLX initializeAfterFileIn!
CDLXI initializeAfterFileIn!
CDLXII initializeAfterFileIn!
CDLXIII initializeAfterFileIn!
CDLXIV initializeAfterFileIn!
CDLXIX initializeAfterFileIn!
CDLXV initializeAfterFileIn!
CDLXVI initializeAfterFileIn!
CDLXVII initializeAfterFileIn!
CDLXVIII initializeAfterFileIn!
CDLXX initializeAfterFileIn!
CDLXXI initializeAfterFileIn!
CDLXXII initializeAfterFileIn!
CDLXXIII initializeAfterFileIn!
CDLXXIV initializeAfterFileIn!
CDLXXIX initializeAfterFileIn!
CDLXXV initializeAfterFileIn!
CDLXXVI initializeAfterFileIn!
CDLXXVII initializeAfterFileIn!
CDLXXVIII initializeAfterFileIn!
CDLXXX initializeAfterFileIn!
CDLXXXI initializeAfterFileIn!
CDLXXXII initializeAfterFileIn!
CDLXXXIII initializeAfterFileIn!
CDLXXXIV initializeAfterFileIn!
CDLXXXIX initializeAfterFileIn!
CDLXXXV initializeAfterFileIn!
CDLXXXVI initializeAfterFileIn!
CDLXXXVII initializeAfterFileIn!
CDLXXXVIII initializeAfterFileIn!
CDV initializeAfterFileIn!
CDVI initializeAfterFileIn!
CDVII initializeAfterFileIn!
CDVIII initializeAfterFileIn!
CDX initializeAfterFileIn!
CDXC initializeAfterFileIn!
CDXCI initializeAfterFileIn!
CDXCII initializeAfterFileIn!
CDXCIII initializeAfterFileIn!
CDXCIV initializeAfterFileIn!
CDXCIX initializeAfterFileIn!
CDXCV initializeAfterFileIn!
CDXCVI initializeAfterFileIn!
CDXCVII initializeAfterFileIn!
CDXCVIII initializeAfterFileIn!
CDXI initializeAfterFileIn!
CDXII initializeAfterFileIn!
CDXIII initializeAfterFileIn!
CDXIV initializeAfterFileIn!
CDXIX initializeAfterFileIn!
CDXL initializeAfterFileIn!
CDXLI initializeAfterFileIn!
CDXLII initializeAfterFileIn!
CDXLIII initializeAfterFileIn!
CDXLIV initializeAfterFileIn!
CDXLIX initializeAfterFileIn!
CDXLV initializeAfterFileIn!
CDXLVI initializeAfterFileIn!
CDXLVII initializeAfterFileIn!
CDXLVIII initializeAfterFileIn!
CDXV initializeAfterFileIn!
CDXVI initializeAfterFileIn!
CDXVII initializeAfterFileIn!
CDXVIII initializeAfterFileIn!
CDXX initializeAfterFileIn!
CDXXI initializeAfterFileIn!
CDXXII initializeAfterFileIn!
CDXXIII initializeAfterFileIn!
CDXXIV initializeAfterFileIn!
CDXXIX initializeAfterFileIn!
CDXXV initializeAfterFileIn!
CDXXVI initializeAfterFileIn!
CDXXVII initializeAfterFileIn!
CDXXVIII initializeAfterFileIn!
CDXXX initializeAfterFileIn!
CDXXXI initializeAfterFileIn!
CDXXXII initializeAfterFileIn!
CDXXXIII initializeAfterFileIn!
CDXXXIV initializeAfterFileIn!
CDXXXIX initializeAfterFileIn!
CDXXXV initializeAfterFileIn!
CDXXXVI initializeAfterFileIn!
CDXXXVII initializeAfterFileIn!
CDXXXVIII initializeAfterFileIn!
CI initializeAfterFileIn!
CII initializeAfterFileIn!
CIII initializeAfterFileIn!
CIV initializeAfterFileIn!
CIX initializeAfterFileIn!
CL initializeAfterFileIn!
CLI initializeAfterFileIn!
CLII initializeAfterFileIn!
CLIII initializeAfterFileIn!
CLIV initializeAfterFileIn!
CLIX initializeAfterFileIn!
CLV initializeAfterFileIn!
CLVI initializeAfterFileIn!
CLVII initializeAfterFileIn!
CLVIII initializeAfterFileIn!
CLX initializeAfterFileIn!
CLXI initializeAfterFileIn!
CLXII initializeAfterFileIn!
CLXIII initializeAfterFileIn!
CLXIV initializeAfterFileIn!
CLXIX initializeAfterFileIn!
CLXV initializeAfterFileIn!
CLXVI initializeAfterFileIn!
CLXVII initializeAfterFileIn!
CLXVIII initializeAfterFileIn!
CLXX initializeAfterFileIn!
CLXXI initializeAfterFileIn!
CLXXII initializeAfterFileIn!
CLXXIII initializeAfterFileIn!
CLXXIV initializeAfterFileIn!
CLXXIX initializeAfterFileIn!
CLXXV initializeAfterFileIn!
CLXXVI initializeAfterFileIn!
CLXXVII initializeAfterFileIn!
CLXXVIII initializeAfterFileIn!
CLXXX initializeAfterFileIn!
CLXXXI initializeAfterFileIn!
CLXXXII initializeAfterFileIn!
CLXXXIII initializeAfterFileIn!
CLXXXIV initializeAfterFileIn!
CLXXXIX initializeAfterFileIn!
CLXXXV initializeAfterFileIn!
CLXXXVI initializeAfterFileIn!
CLXXXVII initializeAfterFileIn!
CLXXXVIII initializeAfterFileIn!
CV initializeAfterFileIn!
CVI initializeAfterFileIn!
CVII initializeAfterFileIn!
CVIII initializeAfterFileIn!
CX initializeAfterFileIn!
CXC initializeAfterFileIn!
CXCI initializeAfterFileIn!
CXCII initializeAfterFileIn!
CXCIII initializeAfterFileIn!
CXCIV initializeAfterFileIn!
CXCIX initializeAfterFileIn!
CXCV initializeAfterFileIn!
CXCVI initializeAfterFileIn!
CXCVII initializeAfterFileIn!
CXCVIII initializeAfterFileIn!
CXI initializeAfterFileIn!
CXII initializeAfterFileIn!
CXIII initializeAfterFileIn!
CXIV initializeAfterFileIn!
CXIX initializeAfterFileIn!
CXL initializeAfterFileIn!
CXLI initializeAfterFileIn!
CXLII initializeAfterFileIn!
CXLIII initializeAfterFileIn!
CXLIV initializeAfterFileIn!
CXLIX initializeAfterFileIn!
CXLV initializeAfterFileIn!
CXLVI initializeAfterFileIn!
CXLVII initializeAfterFileIn!
CXLVIII initializeAfterFileIn!
CXV initializeAfterFileIn!
CXVI initializeAfterFileIn!
CXVII initializeAfterFileIn!
CXVIII initializeAfterFileIn!
CXX initializeAfterFileIn!
CXXI initializeAfterFileIn!
CXXII initializeAfterFileIn!
CXXIII initializeAfterFileIn!
CXXIV initializeAfterFileIn!
CXXIX initializeAfterFileIn!
CXXV initializeAfterFileIn!
CXXVI initializeAfterFileIn!
CXXVII initializeAfterFileIn!
CXXVIII initializeAfterFileIn!
CXXX initializeAfterFileIn!
CXXXI initializeAfterFileIn!
CXXXII initializeAfterFileIn!
CXXXIII initializeAfterFileIn!
CXXXIV initializeAfterFileIn!
CXXXIX initializeAfterFileIn!
CXXXV initializeAfterFileIn!
CXXXVI initializeAfterFileIn!
CXXXVII initializeAfterFileIn!
CXXXVIII initializeAfterFileIn!
D initializeAfterFileIn!
DC initializeAfterFileIn!
DCC initializeAfterFileIn!
DCCC initializeAfterFileIn!
DCCCI initializeAfterFileIn!
DCCCII initializeAfterFileIn!
DCCCIII initializeAfterFileIn!
DCCCIV initializeAfterFileIn!
DCCCIX initializeAfterFileIn!
DCCCL initializeAfterFileIn!
DCCCLI initializeAfterFileIn!
DCCCLII initializeAfterFileIn!
DCCCV initializeAfterFileIn!
DCCCVI initializeAfterFileIn!
DCCCVII initializeAfterFileIn!
DCCCVIII initializeAfterFileIn!
DCCCX initializeAfterFileIn!
DCCCXI initializeAfterFileIn!
DCCCXII initializeAfterFileIn!
DCCCXIII initializeAfterFileIn!
DCCCXIV initializeAfterFileIn!
DCCCXIX initializeAfterFileIn!
DCCCXL initializeAfterFileIn!
DCCCXLI initializeAfterFileIn!
DCCCXLII initializeAfterFileIn!
DCCCXLIII initializeAfterFileIn!
DCCCXLIV initializeAfterFileIn!
DCCCXLIX initializeAfterFileIn!
DCCCXLV initializeAfterFileIn!
DCCCXLVI initializeAfterFileIn!
DCCCXLVII initializeAfterFileIn!
DCCCXLVIII initializeAfterFileIn!
DCCCXV initializeAfterFileIn!
DCCCXVI initializeAfterFileIn!
DCCCXVII initializeAfterFileIn!
DCCCXVIII initializeAfterFileIn!
DCCCXX initializeAfterFileIn!
DCCCXXI initializeAfterFileIn!
DCCCXXII initializeAfterFileIn!
DCCCXXIII initializeAfterFileIn!
DCCCXXIV initializeAfterFileIn!
DCCCXXIX initializeAfterFileIn!
DCCCXXV initializeAfterFileIn!
DCCCXXVI initializeAfterFileIn!
DCCCXXVII initializeAfterFileIn!
DCCCXXVIII initializeAfterFileIn!
DCCCXXX initializeAfterFileIn!
DCCCXXXI initializeAfterFileIn!
DCCCXXXII initializeAfterFileIn!
DCCCXXXIII initializeAfterFileIn!
DCCCXXXIV initializeAfterFileIn!
DCCCXXXIX initializeAfterFileIn!
DCCCXXXV initializeAfterFileIn!
DCCCXXXVI initializeAfterFileIn!
DCCCXXXVII initializeAfterFileIn!
DCCCXXXVIII initializeAfterFileIn!
DCCI initializeAfterFileIn!
DCCII initializeAfterFileIn!
DCCIII initializeAfterFileIn!
DCCIV initializeAfterFileIn!
DCCIX initializeAfterFileIn!
DCCL initializeAfterFileIn!
DCCLI initializeAfterFileIn!
DCCLII initializeAfterFileIn!
DCCLIII initializeAfterFileIn!
DCCLIV initializeAfterFileIn!
DCCLIX initializeAfterFileIn!
DCCLV initializeAfterFileIn!
DCCLVI initializeAfterFileIn!
DCCLVII initializeAfterFileIn!
DCCLVIII initializeAfterFileIn!
DCCLX initializeAfterFileIn!
DCCLXI initializeAfterFileIn!
DCCLXII initializeAfterFileIn!
DCCLXIII initializeAfterFileIn!
DCCLXIV initializeAfterFileIn!
DCCLXIX initializeAfterFileIn!
DCCLXV initializeAfterFileIn!
DCCLXVI initializeAfterFileIn!
DCCLXVII initializeAfterFileIn!
DCCLXVIII initializeAfterFileIn!
DCCLXX initializeAfterFileIn!
DCCLXXI initializeAfterFileIn!
DCCLXXII initializeAfterFileIn!
DCCLXXIII initializeAfterFileIn!
DCCLXXIV initializeAfterFileIn!
DCCLXXIX initializeAfterFileIn!
DCCLXXV initializeAfterFileIn!
DCCLXXVI initializeAfterFileIn!
DCCLXXVII initializeAfterFileIn!
DCCLXXVIII initializeAfterFileIn!
DCCLXXX initializeAfterFileIn!
DCCLXXXI initializeAfterFileIn!
DCCLXXXII initializeAfterFileIn!
DCCLXXXIII initializeAfterFileIn!
DCCLXXXIV initializeAfterFileIn!
DCCLXXXIX initializeAfterFileIn!
DCCLXXXV initializeAfterFileIn!
DCCLXXXVI initializeAfterFileIn!
DCCLXXXVII initializeAfterFileIn!
DCCLXXXVIII initializeAfterFileIn!
DCCV initializeAfterFileIn!
DCCVI initializeAfterFileIn!
DCCVII initializeAfterFileIn!
DCCVIII initializeAfterFileIn!
DCCX initializeAfterFileIn!
DCCXC initializeAfterFileIn!
DCCXCI initializeAfterFileIn!
DCCXCII initializeAfterFileIn!
DCCXCIII initializeAfterFileIn!
DCCXCIV initializeAfterFileIn!
DCCXCIX initializeAfterFileIn!
DCCXCV initializeAfterFileIn!
DCCXCVI initializeAfterFileIn!
DCCXCVII initializeAfterFileIn!
DCCXCVIII initializeAfterFileIn!
DCCXI initializeAfterFileIn!
DCCXII initializeAfterFileIn!
DCCXIII initializeAfterFileIn!
DCCXIV initializeAfterFileIn!
DCCXIX initializeAfterFileIn!
DCCXL initializeAfterFileIn!
DCCXLI initializeAfterFileIn!
DCCXLII initializeAfterFileIn!
DCCXLIII initializeAfterFileIn!
DCCXLIV initializeAfterFileIn!
DCCXLIX initializeAfterFileIn!
DCCXLV initializeAfterFileIn!
DCCXLVI initializeAfterFileIn!
DCCXLVII initializeAfterFileIn!
DCCXLVIII initializeAfterFileIn!
DCCXV initializeAfterFileIn!
DCCXVI initializeAfterFileIn!
DCCXVII initializeAfterFileIn!
DCCXVIII initializeAfterFileIn!
DCCXX initializeAfterFileIn!
DCCXXI initializeAfterFileIn!
DCCXXII initializeAfterFileIn!
DCCXXIII initializeAfterFileIn!
DCCXXIV initializeAfterFileIn!
DCCXXIX initializeAfterFileIn!
DCCXXV initializeAfterFileIn!
DCCXXVI initializeAfterFileIn!
DCCXXVII initializeAfterFileIn!
DCCXXVIII initializeAfterFileIn!
DCCXXX initializeAfterFileIn!
DCCXXXI initializeAfterFileIn!
DCCXXXII initializeAfterFileIn!
DCCXXXIII initializeAfterFileIn!
DCCXXXIV initializeAfterFileIn!
DCCXXXIX initializeAfterFileIn!
DCCXXXV initializeAfterFileIn!
DCCXXXVI initializeAfterFileIn!
DCCXXXVII initializeAfterFileIn!
DCCXXXVIII initializeAfterFileIn!
DCI initializeAfterFileIn!
DCII initializeAfterFileIn!
DCIII initializeAfterFileIn!
DCIV initializeAfterFileIn!
DCIX initializeAfterFileIn!
DCL initializeAfterFileIn!
DCLI initializeAfterFileIn!
DCLII initializeAfterFileIn!
DCLIII initializeAfterFileIn!
DCLIV initializeAfterFileIn!
DCLIX initializeAfterFileIn!
DCLV initializeAfterFileIn!
DCLVI initializeAfterFileIn!
DCLVII initializeAfterFileIn!
DCLVIII initializeAfterFileIn!
DCLX initializeAfterFileIn!
DCLXI initializeAfterFileIn!
DCLXII initializeAfterFileIn!
DCLXIII initializeAfterFileIn!
DCLXIV initializeAfterFileIn!
DCLXIX initializeAfterFileIn!
DCLXV initializeAfterFileIn!
DCLXVI initializeAfterFileIn!
DCLXVII initializeAfterFileIn!
DCLXVIII initializeAfterFileIn!
DCLXX initializeAfterFileIn!
DCLXXI initializeAfterFileIn!
DCLXXII initializeAfterFileIn!
DCLXXIII initializeAfterFileIn!
DCLXXIV initializeAfterFileIn!
DCLXXIX initializeAfterFileIn!
DCLXXV initializeAfterFileIn!
DCLXXVI initializeAfterFileIn!
DCLXXVII initializeAfterFileIn!
DCLXXVIII initializeAfterFileIn!
DCLXXX initializeAfterFileIn!
DCLXXXI initializeAfterFileIn!
DCLXXXII initializeAfterFileIn!
DCLXXXIII initializeAfterFileIn!
DCLXXXIV initializeAfterFileIn!
DCLXXXIX initializeAfterFileIn!
DCLXXXV initializeAfterFileIn!
DCLXXXVI initializeAfterFileIn!
DCLXXXVII initializeAfterFileIn!
DCLXXXVIII initializeAfterFileIn!
DCV initializeAfterFileIn!
DCVI initializeAfterFileIn!
DCVII initializeAfterFileIn!
DCVIII initializeAfterFileIn!
DCX initializeAfterFileIn!
DCXC initializeAfterFileIn!
DCXCI initializeAfterFileIn!
DCXCII initializeAfterFileIn!
DCXCIII initializeAfterFileIn!
DCXCIV initializeAfterFileIn!
DCXCIX initializeAfterFileIn!
DCXCV initializeAfterFileIn!
DCXCVI initializeAfterFileIn!
DCXCVII initializeAfterFileIn!
DCXCVIII initializeAfterFileIn!
DCXI initializeAfterFileIn!
DCXII initializeAfterFileIn!
DCXIII initializeAfterFileIn!
DCXIV initializeAfterFileIn!
DCXIX initializeAfterFileIn!
DCXL initializeAfterFileIn!
DCXLI initializeAfterFileIn!
DCXLII initializeAfterFileIn!
DCXLIII initializeAfterFileIn!
DCXLIV initializeAfterFileIn!
DCXLIX initializeAfterFileIn!
DCXLV initializeAfterFileIn!
DCXLVI initializeAfterFileIn!
DCXLVII initializeAfterFileIn!
DCXLVIII initializeAfterFileIn!
DCXV initializeAfterFileIn!
DCXVI initializeAfterFileIn!
DCXVII initializeAfterFileIn!
DCXVIII initializeAfterFileIn!
DCXX initializeAfterFileIn!
DCXXI initializeAfterFileIn!
DCXXII initializeAfterFileIn!
DCXXIII initializeAfterFileIn!
DCXXIV initializeAfterFileIn!
DCXXIX initializeAfterFileIn!
DCXXV initializeAfterFileIn!
DCXXVI initializeAfterFileIn!
DCXXVII initializeAfterFileIn!
DCXXVIII initializeAfterFileIn!
DCXXX initializeAfterFileIn!
DCXXXI initializeAfterFileIn!
DCXXXII initializeAfterFileIn!
DCXXXIII initializeAfterFileIn!
DCXXXIV initializeAfterFileIn!
DCXXXIX initializeAfterFileIn!
DCXXXV initializeAfterFileIn!
DCXXXVI initializeAfterFileIn!
DCXXXVII initializeAfterFileIn!
DCXXXVIII initializeAfterFileIn!
DI initializeAfterFileIn!
DII initializeAfterFileIn!
DIII initializeAfterFileIn!
DIV initializeAfterFileIn!
DIX initializeAfterFileIn!
DL initializeAfterFileIn!
DLI initializeAfterFileIn!
DLII initializeAfterFileIn!
DLIII initializeAfterFileIn!
DLIV initializeAfterFileIn!
DLIX initializeAfterFileIn!
DLV initializeAfterFileIn!
DLVI initializeAfterFileIn!
DLVII initializeAfterFileIn!
DLVIII initializeAfterFileIn!
DLX initializeAfterFileIn!
DLXI initializeAfterFileIn!
DLXII initializeAfterFileIn!
DLXIII initializeAfterFileIn!
DLXIV initializeAfterFileIn!
DLXIX initializeAfterFileIn!
DLXV initializeAfterFileIn!
DLXVI initializeAfterFileIn!
DLXVII initializeAfterFileIn!
DLXVIII initializeAfterFileIn!
DLXX initializeAfterFileIn!
DLXXI initializeAfterFileIn!
DLXXII initializeAfterFileIn!
DLXXIII initializeAfterFileIn!
DLXXIV initializeAfterFileIn!
DLXXIX initializeAfterFileIn!
DLXXV initializeAfterFileIn!
DLXXVI initializeAfterFileIn!
DLXXVII initializeAfterFileIn!
DLXXVIII initializeAfterFileIn!
DLXXX initializeAfterFileIn!
DLXXXI initializeAfterFileIn!
DLXXXII initializeAfterFileIn!
DLXXXIII initializeAfterFileIn!
DLXXXIV initializeAfterFileIn!
DLXXXIX initializeAfterFileIn!
DLXXXV initializeAfterFileIn!
DLXXXVI initializeAfterFileIn!
DLXXXVII initializeAfterFileIn!
DLXXXVIII initializeAfterFileIn!
DV initializeAfterFileIn!
DVI initializeAfterFileIn!
DVII initializeAfterFileIn!
DVIII initializeAfterFileIn!
DX initializeAfterFileIn!
DXC initializeAfterFileIn!
DXCI initializeAfterFileIn!
DXCII initializeAfterFileIn!
DXCIII initializeAfterFileIn!
DXCIV initializeAfterFileIn!
DXCIX initializeAfterFileIn!
DXCV initializeAfterFileIn!
DXCVI initializeAfterFileIn!
DXCVII initializeAfterFileIn!
DXCVIII initializeAfterFileIn!
DXI initializeAfterFileIn!
DXII initializeAfterFileIn!
DXIII initializeAfterFileIn!
DXIV initializeAfterFileIn!
DXIX initializeAfterFileIn!
DXL initializeAfterFileIn!
DXLI initializeAfterFileIn!
DXLII initializeAfterFileIn!
DXLIII initializeAfterFileIn!
DXLIV initializeAfterFileIn!
DXLIX initializeAfterFileIn!
DXLV initializeAfterFileIn!
DXLVI initializeAfterFileIn!
DXLVII initializeAfterFileIn!
DXLVIII initializeAfterFileIn!
DXV initializeAfterFileIn!
DXVI initializeAfterFileIn!
DXVII initializeAfterFileIn!
DXVIII initializeAfterFileIn!
DXX initializeAfterFileIn!
DXXI initializeAfterFileIn!
DXXII initializeAfterFileIn!
DXXIII initializeAfterFileIn!
DXXIV initializeAfterFileIn!
DXXIX initializeAfterFileIn!
DXXV initializeAfterFileIn!
DXXVI initializeAfterFileIn!
DXXVII initializeAfterFileIn!
DXXVIII initializeAfterFileIn!
DXXX initializeAfterFileIn!
DXXXI initializeAfterFileIn!
DXXXII initializeAfterFileIn!
DXXXIII initializeAfterFileIn!
DXXXIV initializeAfterFileIn!
DXXXIX initializeAfterFileIn!
DXXXV initializeAfterFileIn!
DXXXVI initializeAfterFileIn!
DXXXVII initializeAfterFileIn!
DXXXVIII initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!
IX initializeAfterFileIn!
L initializeAfterFileIn!
LI initializeAfterFileIn!
LII initializeAfterFileIn!
LIII initializeAfterFileIn!
LIV initializeAfterFileIn!
LIX initializeAfterFileIn!
LV initializeAfterFileIn!
LVI initializeAfterFileIn!
LVII initializeAfterFileIn!
LVIII initializeAfterFileIn!
LX initializeAfterFileIn!
LXI initializeAfterFileIn!
LXII initializeAfterFileIn!
LXIII initializeAfterFileIn!
LXIV initializeAfterFileIn!
LXIX initializeAfterFileIn!
LXV initializeAfterFileIn!
LXVI initializeAfterFileIn!
LXVII initializeAfterFileIn!
LXVIII initializeAfterFileIn!
LXX initializeAfterFileIn!
LXXI initializeAfterFileIn!
LXXII initializeAfterFileIn!
LXXIII initializeAfterFileIn!
LXXIV initializeAfterFileIn!
LXXIX initializeAfterFileIn!
LXXV initializeAfterFileIn!
LXXVI initializeAfterFileIn!
LXXVII initializeAfterFileIn!
LXXVIII initializeAfterFileIn!
LXXX initializeAfterFileIn!
LXXXI initializeAfterFileIn!
LXXXII initializeAfterFileIn!
LXXXIII initializeAfterFileIn!
LXXXIV initializeAfterFileIn!
LXXXIX initializeAfterFileIn!
LXXXV initializeAfterFileIn!
LXXXVI initializeAfterFileIn!
LXXXVII initializeAfterFileIn!
LXXXVIII initializeAfterFileIn!
V initializeAfterFileIn!
VI initializeAfterFileIn!
VII initializeAfterFileIn!
VIII initializeAfterFileIn!
X initializeAfterFileIn!
XC initializeAfterFileIn!
XCI initializeAfterFileIn!
XCII initializeAfterFileIn!
XCIII initializeAfterFileIn!
XCIV initializeAfterFileIn!
XCIX initializeAfterFileIn!
XCV initializeAfterFileIn!
XCVI initializeAfterFileIn!
XCVII initializeAfterFileIn!
XCVIII initializeAfterFileIn!
XI initializeAfterFileIn!
XII initializeAfterFileIn!
XIII initializeAfterFileIn!
XIV initializeAfterFileIn!
XIX initializeAfterFileIn!
XL initializeAfterFileIn!
XLI initializeAfterFileIn!
XLII initializeAfterFileIn!
XLIII initializeAfterFileIn!
XLIV initializeAfterFileIn!
XLIX initializeAfterFileIn!
XLV initializeAfterFileIn!
XLVI initializeAfterFileIn!
XLVII initializeAfterFileIn!
XLVIII initializeAfterFileIn!
XV initializeAfterFileIn!
XVI initializeAfterFileIn!
XVII initializeAfterFileIn!
XVIII initializeAfterFileIn!
XX initializeAfterFileIn!
XXI initializeAfterFileIn!
XXII initializeAfterFileIn!
XXIII initializeAfterFileIn!
XXIV initializeAfterFileIn!
XXIX initializeAfterFileIn!
XXV initializeAfterFileIn!
XXVI initializeAfterFileIn!
XXVII initializeAfterFileIn!
XXVIII initializeAfterFileIn!
XXX initializeAfterFileIn!
XXXI initializeAfterFileIn!
XXXII initializeAfterFileIn!
XXXIII initializeAfterFileIn!
XXXIV initializeAfterFileIn!
XXXIX initializeAfterFileIn!
XXXV initializeAfterFileIn!
XXXVI initializeAfterFileIn!
XXXVII initializeAfterFileIn!
XXXVIII initializeAfterFileIn!