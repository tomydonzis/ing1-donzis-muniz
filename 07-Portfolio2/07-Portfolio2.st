!classDefinition: #PortfolioTest category: 'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #ReportTest category: 'Portfolio-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReportTest methodsFor: 'tests' stamp: 'S 10/20/2022 21:43:57'!
test01accountSummaryOnAnAccountWithNoTransactionsOnlyReturnsBalanceEquals0
	|account report|
	account := ReceptiveAccount new.
	report := AccountSummary for: account.
	
	self assert: (OrderedCollection with: 'Balance = 0') equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'S 10/20/2022 21:44:43'!
test02accountSummaryOnAnAccountWithTransactionsReturnsTransactionsAsStrings
	|account account2 report |
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report := AccountSummary for: account.
	
	Deposit register: 30 on: account.
	Withdraw register: 15 on: account.
	Transfer register: 5 from: account to: account2.
	Transfer register: 20 from: account2 to: account.
	
	self assert: (OrderedCollection with: 'Depósito por 30' 
							   with: 'Extracción por 15' 
							   with: 'Salida por transferencia de 5' 
							   with: 'Entrada por transferencia de 20' 
							   with: 'Balance = 30') 
	equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'S 10/20/2022 21:44:55'!
test03accountSummaryOnAnAccountWithDifferentTransactionsReturnsTransactionsAsStrings
	|account account2 report |
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report := AccountSummary for: account.
	
	Deposit register: 100 on: account.
	Withdraw register: 20 on: account.
	Transfer register: 80 from: account to: account2.
	Transfer register: 700 from: account2 to: account.
	
	self assert: (OrderedCollection with: 'Depósito por 100' 
							   with: 'Extracción por 20' 
							   with: 'Salida por transferencia de 80' 
							   with: 'Entrada por transferencia de 700' 
							   with: 'Balance = 700') 
	equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'S 10/20/2022 21:45:12'!
test04accountSummaryOnEmptyPortfolioReturnsBalanceZero
	|portfolio report |
	portfolio := Portfolio new.
	report := AccountSummary for: portfolio.
	
	self assert: (OrderedCollection with: 'Balance = 0') equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'S 10/20/2022 21:45:30'!
test05accountSummaryOnPortfolioWithReceptiveAccountHasReceptiveAccountTransactions
	|portfolio account account2 report |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report := AccountSummary for: portfolio.
	
	Deposit register: 30 on: account.
	Withdraw register: 15 on: account.
	Transfer register: 5 from: account to: account2.
	Transfer register: 20 from: account2 to: account.
	
	portfolio add: account.
	
	self assert: (OrderedCollection with: 'Depósito por 30' 
							   with: 'Extracción por 15' 
							   with: 'Salida por transferencia de 5' 
							   with: 'Entrada por transferencia de 20' 
							   with: 'Balance = 30') 
	equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'TD 10/24/2022 01:52:09'!
test06accountSummaryOnPortfolioWithMultipleReceptiveAccountsHasReceptiveAccountsTransactions
	|portfolio portfolio1 account account2 report |
	portfolio := Portfolio new.
	portfolio1 := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report := AccountSummary for: portfolio.
	
	Deposit register: 30 on: account.
	Transfer register: 5 from: account to: account2.
	Transfer register: 20 from: account2 to: account.
	
	portfolio add: account.
	portfolio1 add: account2.
	portfolio add: portfolio1.
		
	self assert: (OrderedCollection with: 'Depósito por 30' 
							   with: 'Salida por transferencia de 5' 
							   with: 'Entrada por transferencia de 20'
							   with: 'Entrada por transferencia de 5'
							   with: 'Salida por transferencia de 20' 
							   with: 'Balance = 30') 
	equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'S 10/20/2022 21:53:44'!
test07transferNetOnAccountWithNoTransfersReturnsZero
	|account report |
	account := ReceptiveAccount new.
	report := TransferNet for: account.
	
	self assert: 0 equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'S 10/20/2022 21:54:14'!
test08transferNetOnAccountWithOneTransferHasCorrectValue
	|account account2 report |
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report := TransferNet for: account.
	Transfer register: 40 from: account to: account2. 
	
	self assert: -40 equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'S 10/20/2022 21:54:30'!
test09transferNetOnAccountWithMultipleTransfersHasCorrectValue
	|account account2 report |
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report := TransferNet for: account.
	Transfer register: 40 from: account to: account2.
	Transfer register: 70 from: account2 to: account.
	Transfer register: 42 from: account to: account2.
	Transfer register: 20 from: account2 to: account. 
	
	self assert: 8 equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'S 10/20/2022 21:54:44'!
test10transferNetOnAccountWithMultipleTransfersAndOtherTransactionsHasCorrectValue
	|account account2 report |
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report := TransferNet for: account.
	Transfer register: 40 from: account to: account2.
	Transfer register: 70 from: account2 to: account.
	Transfer register: 42 from: account to: account2.
	Transfer register: 20 from: account2 to: account. 
	Withdraw register: 50 on: account. 
	Deposit register: 100 on: account. 
	
	self assert: 8 equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'TD 10/24/2022 00:07:42'!
test11emptyPortfolioReturnsZeroTransferNetOnReport
	|portfolio report |
	portfolio := Portfolio new.
	report := TransferNet for: portfolio.
		
	self assert: 0 equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'TD 10/24/2022 00:10:05'!
test12portfolioWithOneAccountWithTransfersHasSameTransferNetAsAccount
	|portfolio account account2 report |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer register: 20 from: account to: account2.
	Transfer register: 10 from: account2 to: account.
	report := TransferNet for: portfolio.
	portfolio add: account.
	
	self assert: -10 equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'TD 10/24/2022 00:16:15'!
test13portfolioWithMultipleAccountsAndPortfoliosWithTransfersHasSameTransferNetAsSubAccounts
	|portfolio portfolio2 account account2 account3 report |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	Transfer register: 20 from: account3 to: account2.
	Transfer register: 10 from: account2 to: account3.
	Transfer register: 30 from: account3 to: account.
	Transfer register: 15 from: account2 to: account3.
	
	report := TransferNet for: portfolio.
	portfolio add: account.
	portfolio2 add: account2.
	portfolio add: portfolio2.
	
	self assert: 25 equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'TD 10/24/2022 00:24:28'!
test14portfolioDisplayForEmptyPortfolioReturnsPortfolioName
	|portfolio report |
	portfolio := Portfolio named: 'My Portfolio'.
	report := PortfolioDisplay for: portfolio.
	
	self assert: (OrderedCollection with: 'My Portfolio') equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'TD 10/24/2022 00:32:12'!
test15portfolioDisplayForPortfolioWithOneAccountReturnsNames
	|portfolio report account |
	portfolio := Portfolio named: 'My Portfolio'.
	account := ReceptiveAccount named: 'My Receptive Account'.
	report := PortfolioDisplay for: portfolio.
	portfolio add: account.
	
	self assert: (OrderedCollection with: 'My Portfolio' with: ' My Receptive Account') equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'TD 10/24/2022 00:44:27'!
test16portfolioDisplayForPortfolioWithMultipleAccountsAndPortfoliosReturnsSubAccountsNames
	|portfolio portfolio1 report account account2 |
	portfolio := Portfolio named: 'My Portfolio'.
	portfolio1 := Portfolio named: 'Another Portfolio'.
	account := ReceptiveAccount named: 'My Receptive Account'.
	account2 := ReceptiveAccount named: 'Another Receptive Account'.
	report := PortfolioDisplay for: portfolio.
	portfolio add: account.
	portfolio1 add: account2.
	portfolio add: portfolio1.
	
	self assert: (OrderedCollection with: 'My Portfolio' 
							   with: ' My Receptive Account'
							   with: ' Another Portfolio'
							   with: '  Another Receptive Account') equals: report run.! !

!ReportTest methodsFor: 'tests' stamp: 'TD 10/24/2022 01:46:47'!
test17portfolioDisplayOnReceptiveAccountThrowsError
	|account report|
	account := ReceptiveAccount named: 'My Receptive Account'.
	self should: [	report := PortfolioDisplay for: account.] raise: Error withMessageText: PortfolioDisplay receptiveAccountCannotReportError ! !


!classDefinition: #TransferTest category: 'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'TD 10/20/2022 13:52:35'!
test01accountsBalancesAreCorrectAfterTransfer
	
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer register: 30 from: account1 to: account2.
	
	self assert: 30 equals: account2 balance.
	self assert: -30 equals: account1 balance.! !

!TransferTest methodsFor: 'tests' stamp: 'TD 10/20/2022 14:15:18'!
test02accountsHaveRegisteredTheirEndsOfTheTransfer
	
	| account1 account2 transfer |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transfer := Transfer register: 30 from: account1 to: account2.
	
	self assert: (account1 hasRegistered: transfer withdrawalEnd).
	self assert: (account2 hasRegistered: transfer depositEnd)! !

!TransferTest methodsFor: 'tests' stamp: 'TD 10/20/2022 14:24:52'!
test03valueIsEqualForAllEndsOfTheTransfer
	| account1 account2 transfer |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transfer := Transfer register: 30 from: account1 to: account2.
	
	self assert: transfer withdrawalEnd value equals: transfer depositEnd value.
	
	"Los cambios son estructurales"! !


!classDefinition: #Account category: 'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!Account methodsFor: 'reporting' stamp: 'TD 10/23/2022 23:41:36'!
generateDataForReport: aReport 
	self subclassResponsibility.! !


!Account methodsFor: 'initialization' stamp: 'TD 10/24/2022 00:41:35'!
initializeNamed: aName
	accountName := aName.
	self initialize.! !


!Account methodsFor: 'accessing' stamp: 'TD 10/24/2022 01:48:30'!
accountName
	^accountName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'Portfolio-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'TD 10/24/2022 00:41:03'!
named: aName 
	^self new initializeNamed: aName ! !


!classDefinition: #Portfolio category: 'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'reporting' stamp: 'TD 10/23/2022 23:44:54'!
generateDataForReport: aReport 
	^aReport reportForPortfolio: accounts.! !

!Portfolio methodsFor: 'reporting' stamp: 'TD 10/24/2022 01:21:12'!
reportTo: aReport 
	^aReport reportedByAPortfolio: self.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error message' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'reporting' stamp: 'TD 10/23/2022 23:30:00'!
generateDataForReport: aReport
	^aReport reportForReceptiveAccount: transactions.! !

!ReceptiveAccount methodsFor: 'reporting' stamp: 'TD 10/24/2022 01:14:22'!
reportTo: aReport
	^aReport reportedByReceptiveAccount: self.
	! !




!classDefinition: #AccountTransaction category: 'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reporting' stamp: 'TD 10/23/2022 23:35:45'!
reportTo: anAccountSummary 
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'S 10/20/2022 17:46:19'!
for: aTransactionalValue

	^ self new initializeFor: aTransactionalValue ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'S 10/20/2022 17:45:59'!
register: aTransactionalValue on: aReceptiveAccount
	|transferEnd|
	transferEnd := self for: aTransactionalValue.
	aReceptiveAccount register: transferEnd.
	
	^transferEnd.! !


!classDefinition: #Deposit category: 'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'S 10/20/2022 17:43:25'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'S 10/20/2022 17:43:14'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reporting' stamp: 'TD 10/23/2022 23:34:37'!
reportTo: aReport 
	^aReport reportedByDeposit: self.! !


!classDefinition: #TransferEnd category: 'Portfolio-Solucion'!
AccountTransaction subclass: #TransferEnd
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferEnd methodsFor: 'initialization' stamp: 'TD 10/20/2022 14:32:26'!
initializeFor: aTransfer
	transfer := aTransfer.! !


!TransferEnd methodsFor: 'value' stamp: 'TD 10/20/2022 14:31:46'!
value
	^transfer value.! !


!TransferEnd methodsFor: 'balance' stamp: 'S 10/20/2022 17:06:36'!
affectBalance: aCurrentBalance
	self subclassResponsibility.! !


!TransferEnd methodsFor: 'reporting' stamp: 'TD 10/23/2022 23:37:45'!
reportTo: anAccountSummary 
	self subclassResponsibility.! !


!classDefinition: #TransferDeposit category: 'Portfolio-Solucion'!
TransferEnd subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferDeposit methodsFor: 'balance' stamp: 'TD 10/20/2022 14:32:05'!
affectBalance: aCurrentBalance 
	^aCurrentBalance + self value.! !


!TransferDeposit methodsFor: 'reporting' stamp: 'TD 10/23/2022 23:38:33'!
reportTo: anAccountSummary 
	^anAccountSummary reportedByTransferDeposit: self.! !


!classDefinition: #TransferWithdrawal category: 'Portfolio-Solucion'!
TransferEnd subclass: #TransferWithdrawal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferWithdrawal methodsFor: 'balance' stamp: 'TD 10/20/2022 14:32:00'!
affectBalance: aCurrentBalance 
	^aCurrentBalance - self value.! !


!TransferWithdrawal methodsFor: 'reporting' stamp: 'TD 10/23/2022 23:39:57'!
reportTo: anAccountSummary
	^anAccountSummary reportedByTransferWithdrawal: self.! !


!classDefinition: #Withdraw category: 'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'S 10/20/2022 17:43:25'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'S 10/20/2022 17:43:14'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'reporting' stamp: 'TD 10/23/2022 23:34:42'!
reportTo: anAccountSummary 
	^anAccountSummary reportedByWithdraw: self.! !


!classDefinition: #Report category: 'Portfolio-Solucion'!
Object subclass: #Report
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Report methodsFor: 'initialization' stamp: 'S 10/20/2022 21:46:37'!
initializeFor: anAccount
	account := anAccount.! !


!Report methodsFor: 'functionality' stamp: 'S 10/20/2022 21:46:57'!
run
	self subclassResponsibility.! !


!Report methodsFor: 'account type assignment - private' stamp: 'TD 10/23/2022 23:42:45'!
reportForPortfolio: aPortfolio 
	self subclassResponsibility.! !

!Report methodsFor: 'account type assignment - private' stamp: 'TD 10/23/2022 23:13:39'!
reportForReceptiveAccount: anAccount
	self subclassResponsibility.! !

!Report methodsFor: 'account type assignment - private' stamp: 'TD 10/24/2022 01:16:53'!
reportedByAPortfolio: aPortfolio 
	self subclassResponsibility.! !

!Report methodsFor: 'account type assignment - private' stamp: 'TD 10/24/2022 01:14:43'!
reportedByReceptiveAccount: aReceptiveAccount 
	self subclassResponsibility.! !


!Report methodsFor: 'transaction type assignment - private' stamp: 'TD 10/23/2022 23:31:15'!
reportedByDeposit: aDeposit 
	self subclassResponsibility.! !

!Report methodsFor: 'transaction type assignment - private' stamp: 'TD 10/23/2022 23:38:53'!
reportedByTransferDeposit: aTransferDeposit 
	self subclassResponsibility.! !

!Report methodsFor: 'transaction type assignment - private' stamp: 'TD 10/23/2022 23:36:40'!
reportedByTransferWithdrawal: aTransferWithdrawal 
	self subclassResponsibility.! !

!Report methodsFor: 'transaction type assignment - private' stamp: 'TD 10/23/2022 23:35:01'!
reportedByWithdraw: aWithdraw 
	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'Portfolio-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummary methodsFor: 'functionality' stamp: 'TD 10/23/2022 23:27:46'!
run
	|reportTransactions|
	reportTransactions := account generateDataForReport: self.	
	reportTransactions add: ('Balance = ', account balance asString).
	^reportTransactions.! !


!AccountSummary methodsFor: 'account type assignment - private' stamp: 'TD 10/23/2022 23:56:01'!
reportForPortfolio: aCollectionOfAccounts
	| subAccountsReports reportTransactions |
	reportTransactions := OrderedCollection new.
	subAccountsReports := aCollectionOfAccounts collect: [:anAccount | anAccount generateDataForReport: self].
	subAccountsReports do: [:aTransactionCollection | reportTransactions addAll: aTransactionCollection].
	^reportTransactions.! !

!AccountSummary methodsFor: 'account type assignment - private' stamp: 'TD 10/23/2022 23:29:10'!
reportForReceptiveAccount: aCollectionOfTransactions
	^aCollectionOfTransactions collect: [:aTransaction | aTransaction reportTo: self].! !


!AccountSummary methodsFor: 'transaction type assignment - private' stamp: 'TD 10/23/2022 23:33:15'!
reportedByDeposit: aDeposit 
	^'Depósito por ', aDeposit value asString.! !

!AccountSummary methodsFor: 'transaction type assignment - private' stamp: 'TD 10/23/2022 23:39:30'!
reportedByTransferDeposit: aTransferDeposit 
	^'Entrada por transferencia de ', aTransferDeposit value asString.! !

!AccountSummary methodsFor: 'transaction type assignment - private' stamp: 'TD 10/23/2022 23:41:00'!
reportedByTransferWithdrawal: aTransferWithdrawal 
	^'Salida por transferencia de ', aTransferWithdrawal value asString.! !

!AccountSummary methodsFor: 'transaction type assignment - private' stamp: 'TD 10/23/2022 23:35:24'!
reportedByWithdraw: aWithdraw 
	^'Extracción por ', aWithdraw value asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'Portfolio-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'TD 10/24/2022 01:42:07'!
for: anAccount 
	^self new initializeFor: anAccount ! !


!classDefinition: #PortfolioDisplay category: 'Portfolio-Solucion'!
Report subclass: #PortfolioDisplay
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioDisplay methodsFor: 'functionality' stamp: 'TD 10/24/2022 01:16:08'!
run
	|displayReport|
	displayReport := account generateDataForReport: self.
	displayReport addFirst: (account accountName).
	^displayReport.! !


!PortfolioDisplay methodsFor: 'account type assignment - private' stamp: 'TD 10/24/2022 01:34:08'!
reportForPortfolio: aCollectionOfAccounts
	|subAccountDisplay displayReport |
	displayReport := OrderedCollection new.
	subAccountDisplay := aCollectionOfAccounts collect: [:anAccount | anAccount reportTo: self].
	subAccountDisplay do: [:aDisplay | displayReport addAll: aDisplay].
	^displayReport.! !

!PortfolioDisplay methodsFor: 'account type assignment - private' stamp: 'TD 10/24/2022 01:22:13'!
reportedByAPortfolio: aPortfolio 
	|displayReport|
	displayReport := aPortfolio generateDataForReport: self.
	displayReport := displayReport collect: [:aDisplay | ' ', aDisplay].
	displayReport addFirst: (' ', aPortfolio accountName).
	^displayReport.! !

!PortfolioDisplay methodsFor: 'account type assignment - private' stamp: 'TD 10/24/2022 01:35:19'!
reportedByReceptiveAccount: aReceptiveAccount 
	^OrderedCollection with: (' ', aReceptiveAccount accountName).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioDisplay class' category: 'Portfolio-Solucion'!
PortfolioDisplay class
	instanceVariableNames: ''!

!PortfolioDisplay class methodsFor: 'error message' stamp: 'TD 10/24/2022 01:39:10'!
receptiveAccountCannotReportError
	^'receptive account cannot report portfolio display!!!!!!'! !


!PortfolioDisplay class methodsFor: 'instance creation' stamp: 'TD 10/24/2022 01:46:07'!
for: anAccount 
	(anAccount isKindOf: ReceptiveAccount) ifTrue: [^self error: self receptiveAccountCannotReportError].
	^self new initializeFor: anAccount.
	
	"Este if esta porque el enunciado dice que no se deben modificar clases excepto aquellas de la parte 2, no ocurre lo mismo con los metodos reportedBy ya que estos podrian ser utiles para otros reportes."! !


!classDefinition: #TransferNet category: 'Portfolio-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNet methodsFor: 'functionality' stamp: 'TD 10/23/2022 23:57:40'!
run
	^account generateDataForReport: self.! !


!TransferNet methodsFor: 'account type assignment - private' stamp: 'TD 10/24/2022 00:19:17'!
reportForPortfolio: aCollectionOfAccounts 
	^aCollectionOfAccounts inject: 0 into: [:aTransferNet :anAccount | aTransferNet + (anAccount generateDataForReport: self)].! !

!TransferNet methodsFor: 'account type assignment - private' stamp: 'TD 10/24/2022 00:00:50'!
reportForReceptiveAccount: aCollectionOfTransactions 
	^aCollectionOfTransactions inject: 0 into: [:aTransferNet :aTransaction | aTransferNet  + (aTransaction reportTo: self)].! !


!TransferNet methodsFor: 'transaction type assignment - private' stamp: 'TD 10/24/2022 00:02:37'!
reportedByDeposit: aDeposit 
	^0.! !

!TransferNet methodsFor: 'transaction type assignment - private' stamp: 'TD 10/24/2022 00:01:57'!
reportedByTransferDeposit: aTransferDeposit 
	^aTransferDeposit value.! !

!TransferNet methodsFor: 'transaction type assignment - private' stamp: 'TD 10/24/2022 00:01:31'!
reportedByTransferWithdrawal: aTransferWithdrawal 
	^aTransferWithdrawal value negated.! !

!TransferNet methodsFor: 'transaction type assignment - private' stamp: 'TD 10/24/2022 00:02:24'!
reportedByWithdraw: aWithdraw 
	^0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'Portfolio-Solucion'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'TD 10/24/2022 01:42:07'!
for: anAccount 
	^self new initializeFor: anAccount ! !


!classDefinition: #Transfer category: 'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawalEnd depositEnd'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transfer methodsFor: 'initialization' stamp: 'S 10/20/2022 17:41:51'!
initializeRegister: aValue from: aSenderAccount to: aReceiverAccount 
	value := aValue.
	depositEnd := TransferDeposit register: self on: aReceiverAccount.
	withdrawalEnd := TransferWithdrawal register: self on: aSenderAccount.! !


!Transfer methodsFor: 'accessing' stamp: 'TD 10/20/2022 14:32:59'!
value
	^value.! !


!Transfer methodsFor: 'ends - testing' stamp: 'TD 10/20/2022 14:17:37'!
depositEnd
	^depositEnd! !

!Transfer methodsFor: 'ends - testing' stamp: 'TD 10/20/2022 14:16:07'!
withdrawalEnd
	^withdrawalEnd.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'TD 10/20/2022 13:53:26'!
register: aValue from: aSenderAccount to: aReceiverAccount 
	^self new initializeRegister: aValue from: aSenderAccount to: aReceiverAccount ! !
