!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'TD 10/31/2022 19:05:20'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'TD 10/31/2022 19:05:20'!
defaultCatalog
	|catalog|
	
	catalog := Dictionary new.
	catalog add: (self itemSellByTheStore)->5.
	^catalog.! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'TD 10/31/2022 20:04:35'!
test01cashierCannotCheckoutEmptyCart
	|cashier cart catalog creditCard|
	catalog := self basicCatalog.
	
	cashier := Cashier withPriceList: catalog.
	cart := Cart acceptingItemsOf: catalog.
	
	creditCard := CreditCard withExpirationFormatted: '122022'.
	
	self should: [cashier checkout: cart payWith: creditCard] 
		raise: Exception 
		withMessageText: Cashier cannotCheckoutEmptyCartErrorDescription.! !

!CashierTest methodsFor: 'tests' stamp: 'TD 10/31/2022 20:04:42'!
test02cashierChecksOutCartWithOneElementWithCorrectPrice
	|cashier cart catalog creditCard|
	
	catalog := self basicCatalog.
	
	cashier := Cashier withPriceList: catalog.
	cart := Cart acceptingItemsOf: catalog.
	
	creditCard := CreditCard withExpirationFormatted: '122022'.
	
	cart add: 'validBook'.
	
	self assert: 5 equals: (cashier checkout: cart payWith: creditCard).! !

!CashierTest methodsFor: 'tests' stamp: 'TD 10/31/2022 20:04:59'!
test03cashierChecksOutCartWithMultipleDifferentElementsWithCorrectPrice
	|cashier cart catalog creditCard |
	
	catalog := self basicCatalog.
	
	cashier := Cashier withPriceList: catalog.
	cart := Cart acceptingItemsOf: catalog.
	cart add: 'validBook'.
	cart add: 2 of: 'validBook2'.
	
	creditCard := CreditCard withExpirationFormatted: '122022'.
	
	self assert: 25 equals: (cashier checkout: cart payWith: creditCard).! !

!CashierTest methodsFor: 'tests' stamp: 'TD 10/31/2022 20:05:11'!
test04cashierCannotCheckoutACartPaidWithExpiredCreditCard
	|cashier cart catalog creditCard|
	
	catalog := self basicCatalog.
	
	cashier := Cashier withPriceList: catalog.
	cart := Cart acceptingItemsOf: catalog.
	
	creditCard := CreditCard withExpirationFormatted: '092022'.
	
	cart add: 'validBook'.
	
	self should: [cashier checkout: cart payWith: creditCard] 
		raise: Exception 
		withMessageText: Cashier cannotCheckoutCartPaidWithExpiredCardErrorDescription.! !


!CashierTest methodsFor: 'as yet unclassified' stamp: 'TD 10/31/2022 20:04:06'!
basicCatalog
	|catalog|
	catalog := Dictionary new.
	catalog add: #validBook->5.
	catalog add: #validBook2->10.
	^catalog.! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'TD 10/31/2022 18:59:02'!
assertIsValidItem: anItem

	(catalog keys includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout' stamp: 'TD 10/31/2022 19:21:25'!
checkout: aCart payWith: aCreditCard 
	|price|
	self assert: (aCart isEmpty not) description: self class cannotCheckoutEmptyCartErrorDescription.
	
	price := (priceList keys) inject: 0 into: 
	[:totalCost :aPricedProduct | totalCost + (self calculateFor: aCart valueOfProduct: aPricedProduct)].
	
	self debit: price from: aCreditCard.
	^price.! !


!Cashier methodsFor: 'pricing' stamp: 'TD 10/31/2022 18:47:45'!
calculateFor: aCart valueOfProduct: aPricedProduct
	^(aCart occurrencesOf: aPricedProduct) * (self checkPriceOf: aPricedProduct)! !

!Cashier methodsFor: 'pricing' stamp: 'TD 10/31/2022 18:42:16'!
checkPriceOf: aBook 
	^priceList at: aBook.! !


!Cashier methodsFor: 'initialization' stamp: 'TD 10/31/2022 18:34:46'!
initializeWithPriceList: aPriceList 

	priceList := aPriceList.! !


!Cashier methodsFor: 'debitation' stamp: 'TD 10/31/2022 19:21:36'!
debit: price from: aCreditCard 
	(aCreditCard isExpired) ifTrue: [self error: self class cannotCheckoutCartPaidWithExpiredCardErrorDescription].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error handling' stamp: 'TD 10/31/2022 19:07:47'!
cannotCheckoutCartPaidWithExpiredCardErrorDescription
	^'cannot checkout cart with expired card!!!!!!'! !

!Cashier class methodsFor: 'error handling' stamp: 'TD 10/31/2022 18:12:14'!
cannotCheckoutEmptyCartErrorDescription
	^'cart is empty'! !


!Cashier class methodsFor: 'instance creation' stamp: 'TD 10/31/2022 18:34:32'!
withPriceList: aPriceList
	^self new initializeWithPriceList: aPriceList. ! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'accessing' stamp: 'TD 10/31/2022 19:40:09'!
isExpired
	^expirationDate < GregorianMonthOfYear current.! !


!CreditCard methodsFor: 'initialization' stamp: 'TD 10/31/2022 19:39:15'!
initializeWithExpirationFormat: anExpirationDate
	expirationDate := anExpirationDate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'TD 10/31/2022 19:38:55'!
withExpirationFormatted: anExpirationString
	|expirationDate|
	expirationDate := GregorianMonthOfYear yearNumber: (anExpirationString copyFrom: 3 to: 6) asNumber monthNumber: (anExpirationString copyFrom: 1 to: 2) asNumber.
	
	^self new initializeWithExpirationFormat: expirationDate.! !
