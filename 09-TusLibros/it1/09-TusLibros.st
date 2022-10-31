!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'TD 10/27/2022 20:59:29'!
test01newlyCreatedCartIsEmpty
	|cart|
	cart := Cart withCatalogue: OrderedCollection new.
	
	self assert: (cart isEmpty).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'TD 10/27/2022 21:32:55'!
test02cartIsNotEmptyAfterAddingSomething
	|cart book|
	cart := Cart withCatalogue: (OrderedCollection with: '1234512345').
	book := '1234512345'. "Considero book como su codigo ISBN, el formato no esta bien"
	cart add: 1 unitsOfBook: book.
	
	self deny: (cart isEmpty).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'TD 10/27/2022 21:28:01'!
test03cartCannotAddNonRegisteredProduct
	|cart book|
	cart := Cart withCatalogue: OrderedCollection new.
	book := '1234512345'. "Considero book como su codigo ISBN, el formato no esta bien"
	
	self should: [cart add: 1 unitsOfBook: book] 
		raise: Exception
		withExceptionDo: 
			[:anError | 
			self assert: anError messageText equals: Cart cannotAddUnregisteredBookErrorDescription.
			self assert: cart isEmpty].! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'TD 10/27/2022 21:28:10'!
test04cartCannotAddNonPositiveAmountOfUnitsOfAProduct
	|cart book|
	cart := Cart withCatalogue: (OrderedCollection with:'1234512345').
	book := '1234512345'. "Considero book como su codigo ISBN, el formato no esta bien"
	
	self should: [cart add: -1 unitsOfBook: book] 
		raise: Exception
		withExceptionDo: 
			[:anError | self assert: anError messageText equals: Cart cannotAddNonPositiveAmountOfUnitsOfAProductErrorDescription.
			self assert: cart isEmpty].! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'TD 10/27/2022 21:37:09'!
test05cartContainsOneUnitOfAddedBook
	|cart book|
	cart := Cart withCatalogue: (OrderedCollection with: '1234512345').
	book := '1234512345'. "Considero book como su codigo ISBN, el formato no esta bien"
	cart add: 1 unitsOfBook: book.
	
	self assert: 1 equals: (cart unitsOf: book).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'TD 10/27/2022 21:37:13'!
test06cartContainsFiveUnitsOfBookAddedFiveTimes
	|cart book|
	cart := Cart withCatalogue: (OrderedCollection with: '1234512345').
	book := '1234512345'. "Considero book como su codigo ISBN, el formato no esta bien"
	cart add: 5 unitsOfBook: book.
	
	self assert: 5 equals: (cart unitsOf: book).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'TD 10/27/2022 23:06:55'!
test07emptyCartsCurrentBooksReturnsEmptySet
	|cart |
	cart := Cart withCatalogue: (OrderedCollection with: '1234512345').
	
	self assert: Set new equals: cart currentBooks.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'TD 10/27/2022 23:08:26'!
test08cartsCurrentBooksIncludeOnlyAddedBook
	|cart book|
	cart := Cart withCatalogue: (OrderedCollection with: '1234512345').
	book := '1234512345'. "Considero book como su codigo ISBN, el formato no esta bien"
	cart add: 1 unitsOfBook: book.
	
	self assert: (Set with: book) equals: cart currentBooks.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'TD 10/27/2022 23:11:16'!
test09cartsCurrentBooksIncludesOnlyOneApparitionOfRepeatedBooks
	|cart book book2 |
	cart := Cart withCatalogue: (OrderedCollection with: '1234512345' with: '987987987').
	book := '1234512345'. "Considero book como su codigo ISBN, el formato no esta bien"
	book2 := '987987987'.
	cart add: 3 unitsOfBook: book.
	cart add: 3 unitsOfBook: book2.
	
	self assert: (Set with: book with: book2) equals: cart currentBooks.! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'productsCarried catalogue orderedCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'topology' stamp: 'TD 10/27/2022 22:44:36'!
add: units unitsOfBook: aBook
	self assert: (units > 0) description: self class cannotAddNonPositiveAmountOfUnitsOfAProductErrorDescription.
	self assert: (catalogue includes: aBook) description: self class cannotAddUnregisteredBookErrorDescription.
	productsCarried add: aBook withOccurrences: units.! !

!Cart methodsFor: 'topology' stamp: 'TD 10/27/2022 23:11:32'!
currentBooks
	^productsCarried asSet.! !

!Cart methodsFor: 'topology' stamp: 'TD 10/27/2022 20:44:53'!
isEmpty
	^productsCarried isEmpty.! !

!Cart methodsFor: 'topology' stamp: 'TD 10/27/2022 21:37:30'!
unitsOf: aBook 
	^productsCarried occurrencesOf: aBook.! !


!Cart methodsFor: 'initialization' stamp: 'TD 10/27/2022 22:43:29'!
initializeWithCatalogue: aCatalogue
	productsCarried := Bag new.
	catalogue := aCatalogue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'TD 10/27/2022 20:59:43'!
withCatalogue: anOrderedCollection 
	^self new initializeWithCatalogue: anOrderedCollection ! !


!Cart class methodsFor: 'error handling' stamp: 'TD 10/27/2022 21:04:43'!
cannotAddNonPositiveAmountOfUnitsOfAProductErrorDescription
	^'cannot add a non positive amount of units of a product!!!!!!'! !

!Cart class methodsFor: 'error handling' stamp: 'TD 10/27/2022 20:56:03'!
cannotAddUnregisteredBookErrorDescription
	^'cannot add unregistered book!!!!!!!!'! !
