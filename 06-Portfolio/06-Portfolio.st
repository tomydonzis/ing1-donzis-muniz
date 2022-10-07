!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 21:36:31'!
test01emptyPortfolioHasZeroBalance
	|portfolio|
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 21:59:11'!
test02portfolioWith1AccountHasAccountBalance
	|portfolio account transaction|
	
	account := ReceptiveAccount new.
	transaction := Deposit register: 50 on: account.
	portfolio := Portfolio new.
	portfolio add: account.
	
	self assert: 50 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 21:59:11'!
test03portfolioWithManyAccountsHasAccountSumBalance
	|portfolio account transaction account1 account2 transaction1 transaction2 |
	
	account := ReceptiveAccount new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transaction := Deposit register: 50 on: account.
	transaction1 := Deposit register: 100 on: account1.
	transaction2 := Withdraw register: 75 on: account2.
	portfolio := Portfolio new.
	portfolio add: account.
	portfolio add: account1.
	portfolio add: account2.
	
	self assert: 75 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 21:59:29'!
test04portfolioWithManyAccountsAndPortfoliosHasAccountAndPortfolioSumBalance
	|portfolio account transaction account1 account2 transaction1 transaction2 portfolio1 |
	
	account := ReceptiveAccount new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transaction := Deposit register: 50 on: account.
	transaction1 := Deposit register: 100 on: account1.
	transaction2 := Withdraw register: 75 on: account2.
	portfolio := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio add: account.
	portfolio add: account1.
	portfolio1 add: account2.
	portfolio add: portfolio1.
	
	self assert: 75 equals: portfolio balance.! !


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


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accountsAndPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'information' stamp: 'TD 10/6/2022 21:57:25'!
balance
	^accountsAndPortfolios inject: 0 into: 
	[:balanceSum :aMember | aMember updateParentPortfolioBalance: balanceSum]! !


!Portfolio methodsFor: 'accounts - private' stamp: 'TD 10/6/2022 21:59:11'!
add: aMember 
	accountsAndPortfolios add: aMember.! !


!Portfolio methodsFor: 'initialization' stamp: 'TD 10/6/2022 21:44:22'!
initialize
	accountsAndPortfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'parent portfolio balance modifier' stamp: 'TD 10/6/2022 21:58:29'!
updateParentPortfolioBalance: aBalance
	^aBalance + (self balance).! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


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

!ReceptiveAccount methodsFor: 'balance' stamp: 'TD 10/6/2022 21:57:25'!
updateParentPortfolioBalance: aBalance
	^aBalance + (self balance).! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'TD 10/6/2022 21:17:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction ! !
