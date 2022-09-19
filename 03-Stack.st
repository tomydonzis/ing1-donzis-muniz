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

!OOStackTest methodsFor: 'test' stamp: 'TD 9/18/2022 11:36:09'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'TD 9/18/2022 11:36:14'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'TD 9/19/2022 00:37:27'!
assertNoSentencesWereFoundWithPrefixBy: sentenceFinder 

	^ self assert: (sentenceFinder findPrefix) size equals: 0! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'TD 9/19/2022 00:23:02'!
createStackFromACollectionOfSentences: anOrderedCollection
	|stack|
	
	stack := OOStack new.
	anOrderedCollection do: [:sentence | stack push: sentence].
	
	^stack.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'TD 9/19/2022 00:37:27'!
test00StackEmptyReturnsEmptyCollection
	|sentenceFinder|
	
	sentenceFinder := SentenceFinderByPrefix withStack: OOStack new andPrefix: 'Pepe'.
	self assertNoSentencesWereFoundWithPrefixBy: sentenceFinder.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'TD 9/19/2022 00:37:27'!
test01StackWithNoMatchesReturnsEmptyCollection
	|sentenceFinder stack|
	
	"Si bien algunas frases se repiten, preferimos que sea transparente el contenido del stack desde un comienzo, por lo que este sería el único 'código repetido' que dejamos a drede"
	stack := self createStackFromACollectionOfSentences: 
				(OrderedCollection 
					with: 'Pepe estuvo aquí' 
					with: 'No se nos ocurre qué poner').
	
	sentenceFinder := SentenceFinderByPrefix withStack: stack andPrefix: 'Wilki'.
	self assertNoSentencesWereFoundWithPrefixBy: sentenceFinder.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'TD 9/19/2022 00:35:58'!
test02StackWithMatchesReturnsMatchedCollection
	|sentenceFinder stack finderResult |
	
	stack := self createStackFromACollectionOfSentences: 
				(OrderedCollection 
					with: 'Pepe estuvo aquí'
					with: 'Wilki es un capo... ahora seguro nos aprueban'
					with: 'No se nos ocurre qué poner').
	
	sentenceFinder := SentenceFinderByPrefix withStack: stack andPrefix: 'Wilki'.
	finderResult := sentenceFinder findPrefix.
	self assert: finderResult size equals: 1.
	self assert: finderResult first equals: 'Wilki es un capo... ahora seguro nos aprueban'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'TD 9/19/2022 00:37:27'!
test03StackWithCaseInsensitiveMatchesReturnsEmptyCollection
	|sentenceFinder stack |
	
	stack := self createStackFromACollectionOfSentences: 
				(OrderedCollection 
					with: 'Pepe estuvo aquí'
					with: 'Wilki es un capo... ahora seguro nos aprueban'
					with: 'No se nos ocurre qué poner').
	
	sentenceFinder := SentenceFinderByPrefix withStack: stack andPrefix: 'wilki'.
	self assertNoSentencesWereFoundWithPrefixBy: sentenceFinder.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'TD 9/19/2022 00:37:27'!
test04StackWithMidSentenceMatchesReturnsEmptyCollection
	|sentenceFinder stack |
	
	stack := self createStackFromACollectionOfSentences: 
				(OrderedCollection 
					with: 'Pepe estuvo aquí'
					with: 'Wilki es un capo... ahora seguro nos aprueban'
					with: 'Bueno está bien, los demás docentes también son capos'
					with: 'No se nos ocurre qué poner').
	
	sentenceFinder := SentenceFinderByPrefix withStack: stack andPrefix: 'docentes'.
	self assertNoSentencesWereFoundWithPrefixBy: sentenceFinder.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'TD 9/19/2022 00:29:01'!
test05EmptyStringFinderThrowsError
	|stack |
	
	stack := self createStackFromACollectionOfSentences: 
				(OrderedCollection 
					with: 'Pepe estuvo aquí'
					with: 'Wilki es un capo... ahora seguro nos aprueban'
					with: 'Bueno está bien, los demás docentes también son capos'
					with: 'No se nos ocurre qué poner').
	
	self 
		should: [	SentenceFinderByPrefix withStack: stack andPrefix: ''.] 
		raise: Error 
		withMessageText: SentenceFinderByPrefix invalidPrefixError.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'TD 9/19/2022 00:29:34'!
test06SpaceCharSentenceFinderThrowsError
	|stack|
	
	stack := self createStackFromACollectionOfSentences: 
				(OrderedCollection 
					with: 'Pepe estuvo aquí'
					with: 'Wilki es un capo... ahora seguro nos aprueban'
					with: 'Bueno está bien, los demás docentes también son capos'
					with: 'No se nos ocurre qué poner').
	
	self 
		should: [SentenceFinderByPrefix withStack: stack andPrefix: 'Bueno está'.] 
		raise: Error
		withMessageText: SentenceFinderByPrefix invalidPrefixError.! !


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

!Base methodsFor: 'accessing' stamp: 'TD 9/18/2022 19:31:21'!
value
	^self error: self class stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Base class' category: 'Stack-Exercise'!
Base class
	instanceVariableNames: ''!

!Base class methodsFor: 'error description' stamp: 'TD 9/18/2022 19:30:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #ValuedElement category: 'Stack-Exercise'!
Element subclass: #ValuedElement
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValuedElement methodsFor: 'initialization' stamp: 'TD 9/16/2022 01:09:30'!
initializeWithValue: aString andPrev: aPreviousElement 
	value := aString.
	previous := aPreviousElement.! !


!ValuedElement methodsFor: 'accessing' stamp: 'TD 9/16/2022 01:13:11'!
previous
	^previous! !

!ValuedElement methodsFor: 'accessing' stamp: 'TD 9/16/2022 01:21:23'!
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


!OOStack methodsFor: 'push&pop' stamp: 'TD 9/18/2022 19:32:53'!
pop
	|popResult|
	popResult := top value.
	size := size - 1.
	top := top previous.
	^popResult.! !

!OOStack methodsFor: 'push&pop' stamp: 'TD 9/16/2022 01:10:00'!
push: aString 
	| newTop |
	newTop := ValuedElement withValue: aString andPrev: top.
	top := newTop.
	size := size + 1.! !


!OOStack methodsFor: 'stack operations' stamp: 'TD 9/18/2022 11:35:17'!
top
	^top value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #Sentence category: 'Stack-Exercise'!
Object subclass: #Sentence
	instanceVariableNames: 'sentenceString'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Sentence methodsFor: 'accessing' stamp: 'TD 9/19/2022 00:10:36'!
stringValue
	^sentenceString.! !


!Sentence methodsFor: 'topology' stamp: 'TD 9/19/2022 00:07:33'!
ifContainsPrefixAddTo: anOrderedCollection
	self subclassResponsibility.! !


!Sentence methodsFor: 'instance creation' stamp: 'TD 9/19/2022 00:09:50'!
initializeWith: aString
	sentenceString := aString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sentence class' category: 'Stack-Exercise'!
Sentence class
	instanceVariableNames: ''!

!Sentence class methodsFor: 'instance creation' stamp: 'TD 9/19/2022 00:05:45'!
withValue: aSentence forAMatchingPrefix: aPrefix
	"Acá sí usamos el matamosquitos"
	
	self subclasses detect: [:aSubclass | aSubclass isPrefixed = (aSentence beginsWith: aPrefix)]
	ifFound: [:aSubclass | ^aSubclass initializeSentenceFor: aSentence]
	ifNone: [^self error: self invalidSentenceError]! !


!Sentence class methodsFor: 'error messages' stamp: 'TD 9/18/2022 23:56:32'!
invalidSentenceError
	^'Sentence not valid!!!!!!'! !


!Sentence class methodsFor: 'topology' stamp: 'TD 9/19/2022 00:16:01'!
isPrefixed
	self subclassResponsibility.! !


!classDefinition: #NotPrefixedSentence category: 'Stack-Exercise'!
Sentence subclass: #NotPrefixedSentence
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotPrefixedSentence methodsFor: 'topology' stamp: 'TD 9/19/2022 00:07:40'!
ifContainsPrefixAddTo: anOrderedCollection! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotPrefixedSentence class' category: 'Stack-Exercise'!
NotPrefixedSentence class
	instanceVariableNames: ''!

!NotPrefixedSentence class methodsFor: 'topology' stamp: 'TD 9/19/2022 00:15:33'!
isPrefixed
	^false.! !


!NotPrefixedSentence class methodsFor: 'instance creation' stamp: 'TD 9/18/2022 23:58:58'!
initializeSentenceFor: aSentence
	^self new initializeWith: aSentence.! !


!classDefinition: #PrefixedSentence category: 'Stack-Exercise'!
Sentence subclass: #PrefixedSentence
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixedSentence methodsFor: 'topology' stamp: 'TD 9/19/2022 00:11:40'!
ifContainsPrefixAddTo: anOrderedCollection
	anOrderedCollection add: self stringValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixedSentence class' category: 'Stack-Exercise'!
PrefixedSentence class
	instanceVariableNames: ''!

!PrefixedSentence class methodsFor: 'topology' stamp: 'TD 9/19/2022 00:15:21'!
isPrefixed
	^true.! !


!PrefixedSentence class methodsFor: 'instance creation' stamp: 'TD 9/18/2022 23:59:46'!
initializeSentenceFor: aSentence
	^self new initializeWith: aSentence.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentenceStack prefixToFind'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'instance creation' stamp: 'TD 9/18/2022 23:47:55'!
initializeWithStack: anOOStack andPrefix: aPrefix

	sentenceStack := anOOStack.
	prefixToFind := aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'find' stamp: 'TD 9/19/2022 00:14:37'!
findPrefix
	|resultingCollection |
	resultingCollection := OrderedCollection new.
	
	[sentenceStack isEmpty not] whileTrue: [
		(Sentence withValue:  (sentenceStack pop) forAMatchingPrefix: prefixToFind) 
			ifContainsPrefixAddTo: resultingCollection.
	].

	^resultingCollection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error message' stamp: 'TD 9/18/2022 23:50:21'!
invalidPrefixError
	^'Invalid prefix!!!!!!'! !


!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'TD 9/18/2022 23:50:55'!
withStack: anOOStack andPrefix: aPrefix

	"Preferimos usar ifs encapsulados en la clase que hacer el matamosquitos para hacer la distinción de prefijo válido o inválido"
	(aPrefix isEmpty or: [aPrefix includesSubString: ' ']) and: [^self error: self invalidPrefixError].

	^self new initializeWithStack: anOOStack andPrefix: aPrefix.! !
