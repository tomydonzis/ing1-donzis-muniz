!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #RESTInterfaceTest category: 'TusLibros'!
TestCase subclass: #RESTInterfaceTest
	instanceVariableNames: 'interface storeTestObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!RESTInterfaceTest methodsFor: 'as yet unclassified' stamp: 'TD 11/7/2022 02:00:05'!
setUp
	storeTestObjectsFactory := StoreTestObjectsFactory new.! !

!RESTInterfaceTest methodsFor: 'as yet unclassified' stamp: 'TD 11/7/2022 02:01:40'!
test01ListCartIsEmptyAfterValidCartCreation
	| cartContents cartId password clientId |
	interface := RESTInterface withAuthenticationSevice: true andCatalog: (storeTestObjectsFactory defaultCatalog) andMerchantProcessor: MerchantProcessor new.
	clientId := 'pepito'.
	password := '123'.
	
	cartId := interface createCartFor: clientId and: password.
	cartContents := interface listCart: cartId.
	
	self assert: (cartContents isEmpty).! !

!RESTInterfaceTest methodsFor: 'as yet unclassified' stamp: 'TD 11/7/2022 02:01:40'!
test02CreateCartThrowsErrorWhenGivenInvalidCredentials
	| password clientId |
	interface := RESTInterface withAuthenticationSevice: false andCatalog: (storeTestObjectsFactory defaultCatalog) andMerchantProcessor: MerchantProcessor new.
	clientId := 'pepito'.
	password := '123'.
	
	self should: [interface createCartFor: clientId and: password.] 
		raise: Exception 
		withMessageText: RESTInterface invalidCredentialsErrorDescription.! !

!RESTInterfaceTest methodsFor: 'as yet unclassified' stamp: 'TD 11/7/2022 02:01:40'!
test03AddToCartAValidBookAndQuantityMatchesListCartEntry
	| password clientId cartId expected |
	interface := RESTInterface withAuthenticationSevice: true andCatalog: (storeTestObjectsFactory defaultCatalog) andMerchantProcessor: MerchantProcessor new.
	clientId := 'pepito'.
	password := '123'.
	
	cartId := interface createCartFor: clientId and: password.
	interface addToCartWithId: cartId thisAmount: 1 ofBook: 'validBook'.
	
	expected := Dictionary new.
	expected at: 'validBook' put: 1.
	
	self assert: expected equals: (interface listCart: cartId).! !

!RESTInterfaceTest methodsFor: 'as yet unclassified' stamp: 'TD 11/7/2022 02:01:40'!
test04AddToCartWithAnInvalidCartIdThrowsError
	interface := RESTInterface withAuthenticationSevice: true andCatalog: (storeTestObjectsFactory defaultCatalog) andMerchantProcessor: MerchantProcessor new.
	
	self should: [interface addToCartWithId: 0 thisAmount: 1 ofBook: 'validBook']
		raise: Exception
		withMessageText: RESTInterface invalidCartIdErrorDescription.! !

!RESTInterfaceTest methodsFor: 'as yet unclassified' stamp: 'TD 11/7/2022 02:01:40'!
test05ListCartWithAnInvalidCartIdThrowsError
	interface := RESTInterface withAuthenticationSevice: true andCatalog: (storeTestObjectsFactory defaultCatalog) andMerchantProcessor: MerchantProcessor new.
	
	self should: [interface listCart: 0]
		raise: Exception
		withMessageText: RESTInterface invalidCartIdErrorDescription.! !

!RESTInterfaceTest methodsFor: 'as yet unclassified' stamp: 'TD 11/7/2022 02:01:40'!
test06CheckoutInvalidCartIdThrowsError
	interface := RESTInterface withAuthenticationSevice: true andCatalog: (storeTestObjectsFactory defaultCatalog) andMerchantProcessor: MerchantProcessor new.
	
	self should: 
	[interface checkoutCartWithId: 0 paidWithCreditCardWithNumber: 1 expirationDate: 122022 andOwnerName: 'pepe']
		raise: Exception
		withMessageText: RESTInterface invalidCartIdErrorDescription.! !

!RESTInterfaceTest methodsFor: 'as yet unclassified' stamp: 'TD 11/7/2022 03:01:18'!
test07CheckoutValidCartIdAppearsOnPurchasesList
	| password clientId cartId |
	interface := RESTInterface withAuthenticationSevice: true andCatalog: (storeTestObjectsFactory defaultCatalog) andMerchantProcessor: (MerchantProcessor new).
	clientId := 'pepito'.
	password := '123'.
	
	cartId := interface createCartFor: clientId and: password.
	interface addToCartWithId: cartId thisAmount: 1 ofBook: 'validBook'.
	interface checkoutCartWithId: cartId paidWithCreditCardWithNumber: 12345678 expirationDate: '122022' andOwnerName: 'Pepe'.
	
	self assert: (interface listPurchases: clientId and: password) includes: cartId.! !

!RESTInterfaceTest methodsFor: 'as yet unclassified' stamp: 'TD 11/7/2022 03:02:05'!
test08CheckoutValidCartIdWithMPErrorDoesntImpactOnPurchases
	| password clientId cartId |
	interface := RESTInterface withAuthenticationSevice: true andCatalog: (storeTestObjectsFactory defaultCatalog) andMerchantProcessor: (MerchantProcessor new).
	clientId := 'pepito'.
	password := '123'.
	
	cartId := interface createCartFor: clientId and: password.
	interface addToCartWithId: cartId thisAmount: 1 ofBook: 'validBook'.
	self should: 
	[interface checkoutCartWithId: cartId paidWithCreditCardWithNumber: 12345678 expirationDate: '131' andOwnerName: 'sadfadsgiadhgjakfdsfdafheioqruqewioruekjaklsdfjasnasdfn']
	raise: Exception 
	withExceptionDo: 
	[:anError | self assert: anError messageText equals: RESTInterface invalidCreditCardErrorDescription.
			self deny: ((interface listPurchases: clientId and: password) includes: cartId)].! !


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


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'TD 11/7/2022 01:22:44'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


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
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #MerchantProcessor category: 'TusLibros'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!classDefinition: #RESTInterface category: 'TusLibros'!
Object subclass: #RESTInterface
	instanceVariableNames: 'shouldAuthenticate carts catalog purchases'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!RESTInterface methodsFor: 'endpoints' stamp: 'TD 11/7/2022 02:36:29'!
addToCartWithId: cartId thisAmount: aPositiveInteger ofBook: anISBN
	"Las excepciones por la cantidad y el ISBN las responde el carrito."

	self assertValidCartId: cartId.
	(self getCartWithID: cartId) add: aPositiveInteger of: anISBN.! !

!RESTInterface methodsFor: 'endpoints' stamp: 'TD 11/7/2022 03:04:23'!
assertCanCreateCardWithExpirationDateFormat: anExpirationDateFormat andOwnerName: anOwnerName

	^ self assert: (anExpirationDateFormat size = 6 and: [anOwnerName size <= 30]) description: self class invalidCreditCardErrorDescription! !

!RESTInterface methodsFor: 'endpoints' stamp: 'TD 11/7/2022 03:04:23'!
checkoutCartWithId: aCartId paidWithCreditCardWithNumber: aCreditCardNumber expirationDate: anExpirationDateFormat andOwnerName: anOwnerName
	| userId |
	self assertValidCartId: aCartId.
	self assertCanCreateCardWithExpirationDateFormat: anExpirationDateFormat andOwnerName: anOwnerName.
	
	userId := self getClientIdByCartId: aCartId.
	(purchases at: userId ifAbsent: [purchases at: userId put: Dictionary new]) at: aCartId put: 1.
	^1.! !

!RESTInterface methodsFor: 'endpoints' stamp: 'TD 11/7/2022 02:24:49'!
createCartFor: clientId and: password
	self assertAuthentication.
	(carts at: clientId ifAbsent: [carts at: clientId put: (Dictionary new)]) at: 1 put: (Cart acceptingItemsOf: catalog).
	^1.! !

!RESTInterface methodsFor: 'endpoints' stamp: 'TD 11/7/2022 02:36:03'!
listCart: cartId 
	| cart cartContents |
	
	self assertValidCartId: cartId.
	
	cart := self getCartWithID: cartId.
	cartContents := Dictionary new.
	(self booksContainedInCart: cart) inject: cartContents into: 
	[:contents :aContainedBook | contents at: aContainedBook put: (cart occurrencesOf: aContainedBook)].
	
	^cartContents.! !

!RESTInterface methodsFor: 'endpoints' stamp: 'TD 11/7/2022 02:10:44'!
listPurchases: clientId and: password 
	^purchases at: clientId.! !


!RESTInterface methodsFor: 'initialization' stamp: 'TD 11/7/2022 02:10:03'!
initializeWithAuthenticationSevice: aBoolean andCatalog: aCatalog andMerchantProcessor: aMerchantProcessor   
	shouldAuthenticate := aBoolean.
	catalog := aCatalog.
	purchases := Dictionary new.
	carts := Dictionary new.! !


!RESTInterface methodsFor: 'assertions' stamp: 'TD 11/6/2022 14:46:24'!
assertAuthentication

	^ self assert: shouldAuthenticate description: self class invalidCredentialsErrorDescription! !

!RESTInterface methodsFor: 'assertions' stamp: 'TD 11/7/2022 02:32:16'!
assertValidCartId: cartId

	^ self assert: ((carts keys) anySatisfy: [:aClientId | (carts at: aClientId) keys includes: cartId]) description: self class invalidCartIdErrorDescription! !


!RESTInterface methodsFor: 'support' stamp: 'TD 11/7/2022 01:14:09'!
booksContainedInCart: aCart

	^ (catalog keys) select: [:aBook | aCart includes: aBook]! !

!RESTInterface methodsFor: 'support' stamp: 'TD 11/7/2022 02:48:21'!
getCartWithID: cartId

	^(carts at: (self getClientIdByCartId: cartId)) at: cartId! !

!RESTInterface methodsFor: 'support' stamp: 'TD 11/7/2022 02:47:48'!
getClientIdByCartId: cartId

	^(carts keys) detect: [:aClientId | (carts at: aClientId) keys includes: cartId]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RESTInterface class' category: 'TusLibros'!
RESTInterface class
	instanceVariableNames: ''!

!RESTInterface class methodsFor: 'instance creation' stamp: 'TD 11/7/2022 02:02:06'!
withAuthenticationSevice: aBoolean andCatalog: aCatalog andMerchantProcessor: aMerchantProcessor   
	^self new initializeWithAuthenticationSevice: aBoolean andCatalog: aCatalog andMerchantProcessor: aMerchantProcessor ! !


!RESTInterface class methodsFor: 'error handling' stamp: 'TD 11/7/2022 01:17:18'!
invalidCartIdErrorDescription
	^'invalid cart id!!!!!!'.! !

!RESTInterface class methodsFor: 'error handling' stamp: 'TD 11/6/2022 14:43:16'!
invalidCredentialsErrorDescription
	^'invalid credentials!!!!!!'! !

!RESTInterface class methodsFor: 'error handling' stamp: 'TD 11/7/2022 03:02:05'!
invalidCreditCardErrorDescription
	^'invalid credit card!!!!!!'! !


!classDefinition: #Sale category: 'TusLibros'!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: 'TusLibros'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: 'TusLibros'!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !
