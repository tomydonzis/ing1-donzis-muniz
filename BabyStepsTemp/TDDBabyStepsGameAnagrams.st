!classDefinition: #TDDBabyStepsAnagramsTest category: 'TDDBabyStepsGameAnagrams'!
TestCase subclass: #TDDBabyStepsAnagramsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGameAnagrams'!

!TDDBabyStepsAnagramsTest methodsFor: 'tests' stamp: 'TD 9/29/2022 20:09:41'!
test01EmptyStringAnagramIsJustACollectionWithTheEmptyString

	self assert: (Set with: '') equals: '' anagrams
	! !

!TDDBabyStepsAnagramsTest methodsFor: 'tests' stamp: 'TD 9/29/2022 20:10:45'!
test02OneCharStringAnagramReturnsACollectionWithTheSameOneCharString

	self assert: (Set with:'a') equals: 'a' anagrams
	! !

!TDDBabyStepsAnagramsTest methodsFor: 'tests' stamp: 'TD 9/29/2022 20:12:15'!
test03TwoCharStringAnagramReturnsTheOriginalStringAndAnotherOneFlipped

	self assert: (Set with:'ab' with: 'ba') equals: 'ab' anagrams
	! !

!TDDBabyStepsAnagramsTest methodsFor: 'tests' stamp: 'TD 9/29/2022 20:26:59'!
test04ThreeCharStringAnagramReturnsAllThe6PossibleOrderCombinations

	| anagrams |
	
	anagrams := Set new.
	anagrams add: 'abc'.
	anagrams add: 'acb'.
	anagrams add: 'bac'.
	anagrams add: 'bca'.
	anagrams add: 'cab'.
	anagrams add: 'cba'.

	self assert: anagrams equals: 'abc' anagrams
	! !
