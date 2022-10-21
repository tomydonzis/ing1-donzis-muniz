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

!ReportTest methodsFor: 'as yet unclassified' stamp: 'S 10/20/2022 21:43:57'!
test01accountSummaryOnAnAccountWithNoTransactionsOnlyReturnsBalanceEquals0
	|account report|
	account := ReceptiveAccount new.
	report := AccountSummary for: account.
	
	self assert: (OrderedCollection with: 'Balance = 0') equals: report run.! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'S 10/20/2022 21:44:43'!
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

!ReportTest methodsFor: 'as yet unclassified' stamp: 'S 10/20/2022 21:44:55'!
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

!ReportTest methodsFor: 'as yet unclassified' stamp: 'S 10/20/2022 21:45:12'!
test04accountSummaryOnEmptyPortfolioReturnsBalanceZero
	|portfolio report |
	portfolio := Portfolio new.
	report := AccountSummary for: portfolio.
	
	self assert: (OrderedCollection with: 'Balance = 0') equals: report run.! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'S 10/20/2022 21:45:30'!
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

!ReportTest methodsFor: 'as yet unclassified' stamp: 'S 10/20/2022 21:45:43'!
test06accountSummaryOnPortfolioWithMultipleReceptiveAccountsHasReceptiveAccountsTransactions
	|portfolio account account2 report |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report := AccountSummary for: portfolio.
	
	Deposit register: 30 on: account.
	Transfer register: 5 from: account to: account2.
	Transfer register: 20 from: account2 to: account.
	
	portfolio add: account.
	portfolio add: account2.
	
	self assert: (OrderedCollection with: 'Depósito por 30' 
							   with: 'Salida por transferencia de 5' 
							   with: 'Entrada por transferencia de 20'
							   with: 'Entrada por transferencia de 5'
							   with: 'Salida por transferencia de 20' 
							   with: 'Balance = 30') 
	equals: report run.! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'S 10/20/2022 21:53:44'!
test07transferNetOnAccountWithNoTransfersReturnsZero
	|account report |
	account := ReceptiveAccount new.
	report := TransferNet for: account.
	
	self assert: 0 equals: report run.! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'S 10/20/2022 21:54:14'!
test08transferNetOnAccountWithOneTransferHasCorrectValue
	|account account2 report |
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report := TransferNet for: account.
	Transfer register: 40 from: account to: account2. 
	
	self assert: -40 equals: report run.! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'S 10/20/2022 21:54:30'!
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

!ReportTest methodsFor: 'as yet unclassified' stamp: 'S 10/20/2022 21:54:44'!
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


!classDefinition: #TransferTest category: 'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'TD 10/20/2022 13:52:35'!
test01accountsBalancesAreCorrectAfterTransfer
	
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer register: 30 from: account1 to: account2.
	
	self assert: 30 equals: account2 balance.
	self assert: -30 equals: account1 balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'TD 10/20/2022 14:15:18'!
test02accountsHaveRegisteredTheirEndsOfTheTransfer
	
	| account1 account2 transfer |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transfer := Transfer register: 30 from: account1 to: account2.
	
	self assert: (account1 hasRegistered: transfer withdrawalEnd).
	self assert: (account2 hasRegistered: transfer depositEnd)! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'TD 10/20/2022 14:24:52'!
test03valueIsEqualForAllEndsOfTheTransfer
	| account1 account2 transfer |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transfer := Transfer register: 30 from: account1 to: account2.
	
	self assert: transfer withdrawalEnd value equals: transfer depositEnd value.
	
	"Los cambios son estructurales"! !


!classDefinition: #Account category: 'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
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


!Account methodsFor: 'reporting' stamp: 'S 10/20/2022 21:49:38'!
provideBalanceToReport: aReport
	aReport add: ('Balance = ', self balance asString).! !

!Account methodsFor: 'reporting' stamp: 'S 10/20/2022 21:18:10'!
transactionsOnReportFormatInto: reportTransactions
	self subclassResponsibility.! !


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


!Portfolio methodsFor: 'reporting' stamp: 'S 10/20/2022 21:23:14'!
transactionsOnReportFormatInto: aReport
	accounts do: [:anAccount | anAccount transactionsOnReportFormatInto: aReport].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
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


!ReceptiveAccount methodsFor: 'reporting' stamp: 'S 10/20/2022 20:24:20'!
runTransferNet
	^self calculateTransferNet.! !

!ReceptiveAccount methodsFor: 'reporting' stamp: 'S 10/20/2022 21:19:34'!
transactionsOnReportFormatInto: aReport

	^ transactions do: [:aTransaction| aReport add: (aTransaction accountSummaryEntryFormat, aTransaction value asString)]! !


!ReceptiveAccount methodsFor: 'transfer net' stamp: 'S 10/20/2022 20:34:04'!
calculateTransferNet
	^transactions inject: 0 into: [:aTransferNet :aTransaction | aTransaction impactOnTransferNet: aTransferNet].! !


!classDefinition: #AccountTransaction category: 'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'transfer net calculation' stamp: 'S 10/20/2022 21:25:16'!
impactOnTransferNet: aTransferNet
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


!Deposit methodsFor: 'transfer net calculation' stamp: 'S 10/20/2022 20:36:34'!
impactOnTransferNet: aTransferNet 
	^aTransferNet.! !


!Deposit methodsFor: 'account summary' stamp: 'S 10/20/2022 20:39:24'!
accountSummaryEntryFormat
	^'Depósito por '.! !


!classDefinition: #TransferEnd category: 'Portfolio-Solucion'!
AccountTransaction subclass: #TransferEnd
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferEnd methodsFor: 'initialization' stamp: 'TD 10/20/2022 14:32:26'!
initializeFor: aTransfer
	transfer := aTransfer.! !


!TransferEnd methodsFor: 'value' stamp: 'S 10/20/2022 20:31:13'!
impactOnTransferNet: aTransferNet
	self subclassResponsibility.! !

!TransferEnd methodsFor: 'value' stamp: 'TD 10/20/2022 14:31:46'!
value
	^transfer value.! !


!TransferEnd methodsFor: 'balance' stamp: 'S 10/20/2022 17:06:36'!
affectBalance: aCurrentBalance
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


!TransferDeposit methodsFor: 'transfer net calculation' stamp: 'S 10/20/2022 20:31:24'!
impactOnTransferNet: aTransferNet
	^aTransferNet + self value.! !


!TransferDeposit methodsFor: 'account summary' stamp: 'S 10/20/2022 20:40:22'!
accountSummaryEntryFormat
	^'Entrada por transferencia de '.! !


!classDefinition: #TransferWithdrawal category: 'Portfolio-Solucion'!
TransferEnd subclass: #TransferWithdrawal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferWithdrawal methodsFor: 'balance' stamp: 'TD 10/20/2022 14:32:00'!
affectBalance: aCurrentBalance 
	^aCurrentBalance - self value.! !


!TransferWithdrawal methodsFor: 'transfer net calculation' stamp: 'S 10/20/2022 20:31:32'!
impactOnTransferNet: aTransferNet
	^aTransferNet + self value negated.! !


!TransferWithdrawal methodsFor: 'account summary' stamp: 'S 10/20/2022 20:39:54'!
accountSummaryEntryFormat
	^'Salida por transferencia de '.! !


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


!Withdraw methodsFor: 'transfer net calculation' stamp: 'S 10/20/2022 20:36:11'!
impactOnTransferNet: aTransferNet
	^aTransferNet.! !


!Withdraw methodsFor: 'account summary' stamp: 'S 10/20/2022 20:40:51'!
accountSummaryEntryFormat
	^'Extracción por '.! !


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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'Portfolio-Solucion'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'S 10/20/2022 21:46:12'!
for: anAccount 
	^self new initializeFor: anAccount ! !


!classDefinition: #AccountSummary category: 'Portfolio-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummary methodsFor: 'functionality' stamp: 'S 10/20/2022 21:50:04'!
run
	|reportTransactions|
	reportTransactions := OrderedCollection new.
	
	account transactionsOnReportFormatInto: reportTransactions.
	
	account provideBalanceToReport: reportTransactions.
	
	^reportTransactions.! !


!classDefinition: #TransferNet category: 'Portfolio-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNet methodsFor: 'functionality' stamp: 'S 10/20/2022 21:52:50'!
run
	^account calculateTransferNet.! !


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
