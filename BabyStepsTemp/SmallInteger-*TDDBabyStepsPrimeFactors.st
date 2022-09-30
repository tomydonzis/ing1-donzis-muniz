'From Cuis 6.0 [latest update: #5481] on 29 September 2022 at 9:01:47 pm'!


!SmallInteger methodsFor: '*TDDBabyStepsPrimeFactors' stamp: 'TD 9/29/2022 20:01:41'!
esPrimo
	2 to: self - 1 do: [:aDivisor | (self isDivisibleBy: aDivisor) ifTrue: [^false]].
	^true.! !

!SmallInteger methodsFor: '*TDDBabyStepsPrimeFactors' stamp: 'TD 9/29/2022 19:59:11'!
factorize
	|primeFactorsBag aDivisor theDividend|
	
	primeFactorsBag := Bag new.
	aDivisor := 2.
	theDividend := self.
	[theDividend > 1] whileTrue: [	
		(aDivisor esPrimo and:[theDividend isDivisibleBy: aDivisor]) ifTrue: [
			 primeFactorsBag add: aDivisor.
			 theDividend := theDividend / aDivisor.
	] ifFalse: [
		aDivisor := aDivisor + 1].
	].

	^primeFactorsBag.! !
