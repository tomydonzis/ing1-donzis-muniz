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
	instanceVariableNames: 'cashier cart catalogT creditCardT'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'TD 11/3/2022 14:45:11'!
test01cashierCannotCheckoutEmptyCart
	
	self initializeCatalogCashierCartAndCreditCardExpiredOn: '122022'.
	
	self should: [self cashierChecksOutCartForToday] 
		raise: Exception 
		withMessageText: Cashier cannotCheckoutEmptyCartErrorDescription.! !

!CashierTest methodsFor: 'tests' stamp: 'TD 11/3/2022 14:45:11'!
test02cashierChecksOutCartWithOneElementWithCorrectPrice
	self initializeCatalogCashierCartAndCreditCardExpiredOn: '122022'.
	
	cart add: 'validBook'.
	
	self assert: 5 equals: (self cashierChecksOutCartForToday).! !

!CashierTest methodsFor: 'tests' stamp: 'TD 11/3/2022 14:45:11'!
test03cashierChecksOutCartWithMultipleDifferentElementsWithCorrectPrice
	self initializeCatalogCashierCartAndCreditCardExpiredOn: '122022'.
	cart add: 'validBook'.
	cart add: 2 of: 'validBook2'.
	self assert: 25 equals: (self cashierChecksOutCartForToday).! !

!CashierTest methodsFor: 'tests' stamp: 'TD 11/3/2022 14:45:11'!
test04cashierCannotCheckoutACartPaidWithExpiredCreditCard
	self initializeCatalogCashierCartAndCreditCardExpiredOn: '092022'.
	cart add: 'validBook'.
	
	self should: [self cashierChecksOutCartForToday] 
		raise: Exception 
		withMessageText: Cashier cannotCheckoutCartPaidWithExpiredCardErrorDescription.! !

!CashierTest methodsFor: 'tests' stamp: 'TD 11/3/2022 14:45:11'!
test05cashiersSalesBookIncludesCurrentPurchaseWhenCheckoutCouldBeDone
	self initializeCatalogCashierCartAndCreditCardExpiredOn: '122022'.
	
	cart add: 'validBook'.
	
	self cashierChecksOutCartForToday.
	
	self assert: cashier salesBook includes: cart.! !

!CashierTest methodsFor: 'tests' stamp: 'TD 11/3/2022 14:45:11'!
test06cashiersSalesBookDoesNotIncludeCurrentPurchaseWhenCheckoutCouldNotBeDone
	self initializeCatalogCashierCartAndCreditCardExpiredOn: '092022'.
	
	cart add: 'validBook'.
	
	self should: [self cashierChecksOutCartForToday]
	raise: Exception 
	withExceptionDo: [:anError | self deny: (cashier salesBook includes: cart)].! !


!CashierTest methodsFor: 'support' stamp: 'TD 11/3/2022 14:42:47'!
basicCatalog
	catalogT := Dictionary new.
	catalogT add: #validBook->5.
	catalogT add: #validBook2->10.! !

!CashierTest methodsFor: 'support' stamp: 'TD 11/3/2022 14:45:11'!
cashierChecksOutCartForToday

	^ cashier checkout: cart payWith: creditCardT on: Date today! !

!CashierTest methodsFor: 'support' stamp: 'TD 11/3/2022 14:42:57'!
initializeCatalogCashierCartAndCreditCardExpiredOn: aDateFormat
	
	self basicCatalog.
	
	cashier := Cashier withPriceList: catalogT.
	cart := Cart acceptingItemsOf: catalogT.
	
	creditCardT := CreditCard withExpirationFormatted: aDateFormat.! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


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

!Cart class methodsFor: 'instance creation' stamp: 'TD 10/27/2022 20:59:43'!
withCatalogue: anOrderedCollection 
	^self new initializeWithCatalogue: anOrderedCollection ! !


!Cart class methodsFor: 'error handling' stamp: 'TD 10/27/2022 21:04:43'!
cannotAddNonPositiveAmountOfUnitsOfAProductErrorDescription
	^'cannot add a non positive amount of units of a product!!!!!!'! !

!Cart class methodsFor: 'error handling' stamp: 'TD 10/27/2022 20:56:03'!
cannotAddUnregisteredBookErrorDescription
	^'cannot add unregistered book!!!!!!!!'! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout' stamp: 'TD 11/3/2022 14:24:59'!
checkout: aCart payWith: aCreditCard on: aDate  
	|price|
	self assert: (aCart isEmpty not) description: self class cannotCheckoutEmptyCartErrorDescription.
	
	price := (priceList keys) inject: 0 into: 
	[:totalCost :aPricedProduct | totalCost + (self calculateFor: aCart valueOfProduct: aPricedProduct)].
	
	self debit: price from: aCreditCard on: aDate.
	salesBook add: aCart.
	
	^price.! !


!Cashier methodsFor: 'pricing' stamp: 'TD 10/31/2022 18:47:45'!
calculateFor: aCart valueOfProduct: aPricedProduct
	^(aCart occurrencesOf: aPricedProduct) * (self checkPriceOf: aPricedProduct)! !

!Cashier methodsFor: 'pricing' stamp: 'TD 10/31/2022 18:42:16'!
checkPriceOf: aBook 
	^priceList at: aBook.! !


!Cashier methodsFor: 'initialization' stamp: 'TD 11/3/2022 14:21:23'!
initializeWithPriceList: aPriceList 

	priceList := aPriceList.
	salesBook := OrderedCollection new.! !


!Cashier methodsFor: 'debitation' stamp: 'TD 11/3/2022 14:22:24'!
assertOn: aCreditCard aCheckoutCanBeMadeWith: aDate

	^ self assert: (aCreditCard isExpiredOn: aDate) not
	description: self class cannotCheckoutCartPaidWithExpiredCardErrorDescription! !

!Cashier methodsFor: 'debitation' stamp: 'TD 11/3/2022 14:22:24'!
debit: price from: aCreditCard on: aDate  
	self assertOn: aCreditCard aCheckoutCanBeMadeWith: aDate.! !


!Cashier methodsFor: 'accessing' stamp: 'TD 11/3/2022 14:21:39'!
salesBook
	^salesBook copy.! !

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

!CreditCard methodsFor: 'accessing' stamp: 'TD 11/3/2022 14:10:30'!
isExpiredOn: aDate
	^expirationDate < (GregorianMonthOfYear yearNumber: aDate yearNumber monthNumber: aDate monthIndex).! !


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
