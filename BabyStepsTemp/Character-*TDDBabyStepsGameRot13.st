'From Cuis 6.0 [latest update: #5481] on 29 September 2022 at 9:01:16 pm'!


!Character methodsFor: '*TDDBabyStepsGameRot13' stamp: 'TD 9/29/2022 19:18:00'!
asRot13
	((self isInRangeFrom: $a and: $m) or: 
	[self isInRangeFrom: $A and: $M]) ifTrue: [^Character asciiValue: (self asciiValue + 13)].
	
	((self isInRangeFrom: $n and: $z) or: 
	[self isInRangeFrom: $N and: $Z]) ifTrue: [^Character asciiValue: (self asciiValue - 13)].! !

!Character methodsFor: '*TDDBabyStepsGameRot13' stamp: 'TD 9/29/2022 19:19:07'!
isInRangeFrom: aLowerBound and: anUpperBound
	^self asciiValue between: (aLowerBound asciiValue) and: (anUpperBound asciiValue)
	! !
