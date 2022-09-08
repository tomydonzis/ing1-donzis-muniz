!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'helpers' stamp: 'FM 9/8/2022 00:26:33'!
addAndSuspendFrom: customerBook customerNamed: customerName

	customerBook addCustomerNamed: customerName.
	customerBook suspendCustomerNamed: customerName.


	
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'TD 9/5/2022 21:58:22'!
assertNumberOfCustomersFrom: aCustomerBook whichAreActive: activeCustomers whichAreSuspended: suspendedCustomers
	
	self assert: activeCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: (activeCustomers  + suspendedCustomers) equals: aCustomerBook numberOfCustomers.
	

	
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'FM 9/8/2022 00:20:36'!
assertNumberOfCustomersFrom: customerBook whichAreTotal: amountOfCustomers andIncludesCustomerNamed: customerName
	
	[ self assert: customerBook numberOfCustomers = amountOfCustomers.
		self assert: (customerBook includesCustomerNamed: customerName) ]
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'TD 9/5/2022 21:56:13'!
calculateRuntime: closureToRun

	| millisecondsBeforeRunning |
	
	millisecondsBeforeRunning := self getMillisecondsNow. 
	closureToRun.
		
	^self getMillisecondsNow  - millisecondsBeforeRunning.
	
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'TD 9/5/2022 21:31:44'!
getMillisecondsNow

	^Time millisecondClockValue * millisecond.
	
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'FM 9/8/2022 01:05:22'!
try: closureToTry onError: errorType do: closureIfError
	
	[closureToTry value. self fail]
			on: errorType
			do: [ :anError | closureIfError value: anError]
	
! !


!CustomerBookTest methodsFor: 'testing' stamp: 'FM 9/7/2022 23:54:34'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	"Se podría tener otro método para realizar el assert, pero queda casi igual y creemos que es lógico tener assert en el código del test"
	self assert: (self calculateRuntime: [customerBook addCustomerNamed: 'John Lennon'.]) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FM 9/8/2022 00:29:17'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook customerName |
	
	customerBook := CustomerBook new.
	customerName := 'Paul McCartney'.
	
	customerBook addCustomerNamed: customerName.
	
	self assert: (self calculateRuntime: [customerBook removeCustomerNamed: customerName.]) < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FM 9/8/2022 01:06:08'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
		customerBook := CustomerBook new.
		
		self try: [customerBook addCustomerNamed: ''.] 
			onError: Error 
			do: [ :anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
				self assert: customerBook isEmpty]
		
			
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FM 9/8/2022 01:07:45'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook customerName |
			
	customerBook := CustomerBook new.
	customerName := 'John Lennon'.
	customerBook addCustomerNamed: customerName.
	
	self try: [ customerBook removeCustomerNamed: 'Paul McCartney'.]  
		onError: NotFound 
		do: [ :anError | 
			self assertNumberOfCustomersFrom: customerBook whichAreTotal: 1  andIncludesCustomerNamed: customerName. ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FM 9/8/2022 00:28:30'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook customerName|
	
	customerBook := CustomerBook new.
	customerName := 'Paul McCartney'.
	
	self addAndSuspendFrom: customerBook customerNamed: customerName .
	
	self assertNumberOfCustomersFrom: customerBook whichAreActive: 0 whichAreSuspended: 1.
	self assert: (customerBook includesCustomerNamed: customerName).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FM 9/8/2022 00:27:23'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook customerName|
	
	customerBook := CustomerBook new.
	customerName := 'Paul McCartney'.
	
	self addAndSuspendFrom: customerBook customerNamed: customerName.
	customerBook removeCustomerNamed: customerName.
	
	self assertNumberOfCustomersFrom: customerBook whichAreActive: 0 whichAreSuspended: 0.
	self deny: (customerBook includesCustomerNamed: customerName).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FM 9/8/2022 01:07:39'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook customerName |
			
	customerBook := CustomerBook new.
	customerName := 'John Lennon'.
	customerBook addCustomerNamed: customerName.
	
	self try: [ customerBook suspendCustomerNamed: 'George Harrison'.] 
		onError: CantSuspend 
		do: [ :anError | 
			self assertNumberOfCustomersFrom: customerBook whichAreTotal: 1 andIncludesCustomerNamed: customerName. ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FM 9/8/2022 01:07:33'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook customerName |
			
	customerBook := CustomerBook new.
	customerName := 'John Lennon'.
	
	self addAndSuspendFrom: customerBook customerNamed: customerName.
	
	self try: [ customerBook suspendCustomerNamed: customerName.] 
		onError: CantSuspend  
		do: [ :anError | 
			self assertNumberOfCustomersFrom: customerBook whichAreTotal: 1 andIncludesCustomerNamed: customerName.].
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'FM 9/8/2022 00:48:20'!
initialize

	active := OrderedCollection new.
	suspended := OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'FM 9/8/2022 00:47:52'!
addCustomerNamed: aName

	aName isEmpty and: [self signalCustomerNameCannotBeEmpty].
	(self includesCustomerNamed: aName) and: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FM 9/8/2022 00:41:05'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FM 9/8/2022 00:37:02'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^NotFound signal.] ].
	^aName
! !

!CustomerBook methodsFor: 'customer management' stamp: 'FM 9/8/2022 00:43:00'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'FM 9/8/2022 00:44:37'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	suspended add: aName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:12'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:16'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
