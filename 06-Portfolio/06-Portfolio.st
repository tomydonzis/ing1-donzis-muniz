!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'account1 account2 account3 portfolio1 portfolio2 portfolio3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'set up' stamp: 'TD 10/17/2022 15:43:35'!
setUp

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.! !


!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test01emptyPortfolioHasZeroBalance

	self assert: 0 equals: portfolio1 balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test02portfolioWith1AccountHasAccountBalance
	
	Deposit register: 50 on: account1 .
	portfolio1 add: account1.
	
	self assert: 50 equals: portfolio1 balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test03portfolioWithManyAccountsHasAccountSumBalance
	
	Deposit register: 50 on: account1.
	Deposit register: 100 on: account2.
	Withdraw register: 75 on: account3.
	
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio1 add: account3.
	
	self assert: 75 equals: portfolio1 balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:42:09'!
test04portfolioWithManyAccountsAndPortfoliosHasAccountAndPortfolioSumBalance
	Deposit register: 50 on: account1.
	Deposit register: 100 on: account2.
	Withdraw register: 75 on: account3.
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio2 add: account3.
	portfolio1 add: portfolio2.
	
	self assert: 75 equals: portfolio1 balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test05portfolioWithNoAccountsDoesNotHaveATransactionRegistered
	|transaction |
	transaction := Deposit register: 50 on: account1.
	
	self deny: (portfolio1 hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test06portfolioWithOneAccountHasTheSameTransactionAsTheAccount
	|transaction |
	
	transaction := Deposit register: 50 on: account1 .
	portfolio1 add: account1.
	
	self assert: (portfolio1 hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test07portfolioWithManyAccountsHasSomeAccountsTransaction
	|transaction |
	
	Deposit register: 50 on: account1.
	Deposit register: 100 on: account2.
	transaction := Withdraw register: 75 on: account3.
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio1 add: account3.
	
	self assert: (portfolio1 hasRegistered: transaction)! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:41:46'!
test08portfolioWithManyAccountsAndPortfoliosHasATransactionInsideAPortfolio
	|transaction |
	
	Deposit register: 50 on: account1.
	Deposit register: 100 on: account2.
	transaction := Withdraw register: 75 on: account3.
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio2 add: account3.
	portfolio1 add: portfolio2.
	
	self assert: true equals: (portfolio1 hasRegistered: transaction).
	
	"Nos jugo en contra aca el hecho de tener una sola coleccion para elementos de tipo abstracto AccountableAsset por eso este test paso de una, pero basicamente va a buscar a las hojas."! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test09portfolioWithNoAccountsDoesNotHaveTransactions
	
	self assert: (OrderedCollection new) equals: portfolio1 transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test10portfolioWithOneAccountHasAccountsTransactions
	
	Deposit register: 50 on: account1 .
	portfolio1 add: account1.
	
	self assert: (account1 transactions) equals: portfolio1 transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test11portfolioWithManyAccountsHasAccountsTransactionsInAll
	|transactionList |
	
	Deposit register: 50 on: account1.
	Deposit register: 100 on: account2.
	Withdraw register: 75 on: account3.
	
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio1 add: account3.
	
	transactionList := OrderedCollection new.
	transactionList addAll: account1 transactions.
	transactionList addAll: account2 transactions.
	transactionList addAll: account3 transactions.
	
	self assert: transactionList equals: portfolio1 transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:41:58'!
test12portfolioWithManyAccountsAndPortfoliosHasAccountsTransactionsInAll
	|transactionList |
	
	Deposit register: 50 on: account1.
	Deposit register: 100 on: account2.
	Withdraw register: 75 on: account3.
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio2 add: account3.
	portfolio1 add: portfolio2.
	
	Withdraw register: 75 on: account3.
	
	transactionList := OrderedCollection new.
	transactionList addAll: account1 transactions.
	transactionList addAll: account2 transactions.
	transactionList addAll: account3 transactions.
	
	self assert: transactionList equals: portfolio1 transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test13portfolioCannotAddSameAccountTwice
	
	portfolio1 add: account1.	
	
	self should: [portfolio1 add: account1.	] raise: Error withMessageText: Portfolio repeatedEntityErrorDescription.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:42:43'!
test14portfolioCannotAddAPortfolioWithAnAccountItHas
	
	portfolio1 add: account1.
	portfolio2 add: account1.
		
	self should: [portfolio1 add: portfolio2] raise: Error withMessageText: Portfolio repeatedEntityErrorDescription.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:42:39'!
test15portfolioCannotAddAccountAlreadyHadByAParentPortfolio
	
	portfolio1 add: account1.
	portfolio1 add: portfolio2.
	
	self should: [portfolio2 add: account1 ] raise: Error withMessageText: Portfolio repeatedEntityErrorDescription.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:42:36'!
test16portfolioWithMultipleParentsCannotAddAccountAlreadyHadByAParentPortfolio
	
	portfolio1 add: account1.
	portfolio3 add: portfolio2.
	portfolio1 add: portfolio2.
	
	self should: [portfolio2 add: account1] raise: Error withMessageText: Portfolio repeatedEntityErrorDescription.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:42:20'!
test17portfolioCannotAddSameEmptyPortfolioTwice
	
	portfolio1 add: portfolio2.
	
	self should: [portfolio1 add: portfolio2] raise: Error withMessageText: Portfolio repeatedEntityErrorDescription.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TD 10/17/2022 15:40:43'!
test18cannotSelfAddPortfolio

	self should: [portfolio1 add: portfolio1] raise: Error withMessageText: Portfolio repeatedEntityErrorDescription.! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TD 10/6/2022 20:35:18'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TD 10/6/2022 21:05:03'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'TD 10/6/2022 21:15:22'!
updateBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'TD 10/6/2022 21:08:01'!
value

	^ amount! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'TD 10/6/2022 21:02:28'!
initializeFor: anAmount

	amount := anAmount ! !


!Deposit methodsFor: 'value' stamp: 'TD 10/6/2022 21:15:22'!
updateBalance: aBalance
	^self value + aBalance.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'TD 10/6/2022 21:02:22'!
initializeFor: anAmount

	amount := anAmount ! !


!Withdraw methodsFor: 'value' stamp: 'TD 10/6/2022 21:15:22'!
updateBalance: aBalance
	^aBalance - (self value).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountType category: 'Portfolio-Ejercicio'!
Object subclass: #AccountType
	instanceVariableNames: 'parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountType methodsFor: 'balance' stamp: 'TD 10/13/2022 21:10:03'!
balance
	self subclassResponsibility.! !

!AccountType methodsFor: 'balance' stamp: 'FM 10/14/2022 19:18:57'!
transactions
	self subclassResponsibility.! !


!AccountType methodsFor: 'parent portfolio balance modifier' stamp: 'TD 10/13/2022 21:12:16'!
updateParentPortfolioBalance: aBalance
	^aBalance + (self balance).! !


!AccountType methodsFor: 'testing' stamp: 'TD 10/17/2022 14:04:24'!
alreadyBelongsTo: aReceptiveAccount 
	self subclassResponsibility.! !

!AccountType methodsFor: 'testing' stamp: 'TD 10/17/2022 14:04:43'!
cannotBeAddedTo: aPortfolio 
	self subclassResponsibility.! !

!AccountType methodsFor: 'testing' stamp: 'TD 10/17/2022 14:05:08'!
contains: anOriginalMember
	self subclassResponsibility.! !

!AccountType methodsFor: 'testing' stamp: 'TD 10/13/2022 21:13:18'!
hasRegistered: aTransaction
	self subclassResponsibility.! !


!AccountType methodsFor: 'verification on add' stamp: 'TD 10/17/2022 14:25:16'!
addParent: aPortfolio 
	parents add: aPortfolio.! !

!AccountType methodsFor: 'verification on add' stamp: 'TD 10/17/2022 13:41:10'!
parent: aPortfolio 
	parent := aPortfolio! !


!AccountType methodsFor: 'initialize' stamp: 'TD 10/17/2022 14:25:28'!
initialize
	parents := OrderedCollection new.! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
AccountType subclass: #Portfolio
	instanceVariableNames: 'accountsAndPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'information' stamp: 'TD 10/6/2022 21:57:25'!
balance
	^accountsAndPortfolios inject: 0 into: 
	[:balanceSum :aMember | aMember updateParentPortfolioBalance: balanceSum]! !

!Portfolio methodsFor: 'information' stamp: 'TD 10/13/2022 21:23:47'!
hasRegistered: aTransaction 
	^accountsAndPortfolios anySatisfy: [:aMember | aMember hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'information' stamp: 'TD 10/17/2022 15:02:17'!
shouldNotLetAdding: aCandidateMember
	(parents isEmpty) ifTrue: [^self alreadyIncludes: aCandidateMember].
	
	^parents inject: false into: [:disallow :aParent | disallow or: (aParent shouldNotLetAdding: aCandidateMember)].! !

!Portfolio methodsFor: 'information' stamp: 'FM 10/14/2022 19:06:08'!
transactions
	|transactionList|
	transactionList := OrderedCollection new.
	accountsAndPortfolios do: [:member | 
		transactionList addAll: (member transactions)].
		
	^transactionList.
	! !


!Portfolio methodsFor: 'accounts - private' stamp: 'TD 10/17/2022 14:34:01'!
add: aMember

	(aMember cannotBeAddedTo: self) ifTrue: [^self error: self class repeatedEntityErrorDescription].
	
	aMember addParent: self.
	accountsAndPortfolios add: aMember.! !

!Portfolio methodsFor: 'accounts - private' stamp: 'TD 10/17/2022 14:59:37'!
alreadyBelongsTo: aReceptiveAccount 
	^self alreadyIncludes: aReceptiveAccount.! !

!Portfolio methodsFor: 'accounts - private' stamp: 'TD 10/17/2022 15:39:54'!
cannotBeAddedTo: aPortfolio 
	^aPortfolio = self or: (aPortfolio alreadyIncludes: self).! !


!Portfolio methodsFor: 'initialization' stamp: 'TD 10/17/2022 13:39:48'!
initialize
	accountsAndPortfolios := OrderedCollection new.
	super initialize.! !


!Portfolio methodsFor: 'adding - private' stamp: 'TD 10/17/2022 15:37:03'!
alreadyIncludes: anOriginalMember
	
	^anOriginalMember = self or: (accountsAndPortfolios inject: false into: 
	[:isContained :aMember | isContained or: ((aMember alreadyIncludes: anOriginalMember) or: aMember = anOriginalMember)]).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error messages' stamp: 'TD 10/17/2022 14:34:27'!
repeatedEntityErrorDescription
	^'cannot add an entity multiple times!!'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
AccountType subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'TD 10/17/2022 13:39:57'!
initialize
	transactions := OrderedCollection new.
	super initialize.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'TD 10/6/2022 20:46:25'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'TD 10/6/2022 21:17:35'!
balance

	^transactions inject: 0 into: [ :balanceSum :aTransaction | aTransaction updateBalance: balanceSum].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'TD 10/17/2022 14:01:43'!
alreadyBelongsTo: aReceptiveAccount 
	^self = aReceptiveAccount.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'TD 10/17/2022 14:59:37'!
alreadyIncludes: aCandidateMember	

	^aCandidateMember alreadyBelongsTo: self.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'TD 10/17/2022 13:56:23'!
cannotBeAddedTo: aPortfolio 
	^aPortfolio shouldNotLetAdding: self.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'TD 10/6/2022 21:17:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction ! !
