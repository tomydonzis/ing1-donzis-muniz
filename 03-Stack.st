!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'TD 9/16/2022 01:16:59'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'TD 9/16/2022 01:17:03'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'TD 9/16/2022 01:17:11'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'TD 9/16/2022 01:21:23'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack value = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'TD 9/16/2022 01:21:23'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack value.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'TD 9/16/2022 01:17:17'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'TD 9/16/2022 01:17:25'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'TD 9/16/2022 01:17:31'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #Element category: 'Stack-Exercise'!
Object subclass: #Element
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'getters' stamp: 'TD 9/16/2022 01:22:32'!
value
	^self subclassResponsibility.! !


!classDefinition: #Base category: 'Stack-Exercise'!
Element subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'as yet unclassified' stamp: 'TD 9/16/2022 01:21:22'!
value
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #ValuedElement category: 'Stack-Exercise'!
Element subclass: #ValuedElement
	instanceVariableNames: 'value previous string previousElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValuedElement methodsFor: 'initialization' stamp: 'TD 9/16/2022 01:09:30'!
initializeWithValue: aString andPrev: aPreviousElement 
	value := aString.
	previous := aPreviousElement.! !


!ValuedElement methodsFor: 'getters' stamp: 'TD 9/16/2022 01:13:11'!
previous
	^previous! !

!ValuedElement methodsFor: 'getters' stamp: 'TD 9/16/2022 01:21:23'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValuedElement class' category: 'Stack-Exercise'!
ValuedElement class
	instanceVariableNames: ''!

!ValuedElement class methodsFor: 'instance creation' stamp: 'TD 9/16/2022 01:08:54'!
withValue: aString andPrev: aPreviousElement
	^self new initializeWithValue: aString andPrev: aPreviousElement ! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'topology' stamp: 'TD 9/16/2022 01:03:56'!
isEmpty
	^size = 0.! !

!OOStack methodsFor: 'topology' stamp: 'TD 9/16/2022 01:19:52'!
size
	^size.! !


!OOStack methodsFor: 'initialization' stamp: 'TD 9/16/2022 01:05:01'!
initialize
	top := Base new.
	size := 0.! !


!OOStack methodsFor: 'push&pop' stamp: 'TD 9/16/2022 01:21:23'!
pop
	|popResult|
	size := size - 1.
	popResult := top value.
	top := top previous.
	^popResult.! !

!OOStack methodsFor: 'push&pop' stamp: 'TD 9/16/2022 01:10:00'!
push: aString 
	| newTop |
	newTop := ValuedElement withValue: aString andPrev: top.
	top := newTop.
	size := size + 1.! !


!OOStack methodsFor: 'stack operations' stamp: 'TD 9/16/2022 01:21:23'!
value
	^top value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
