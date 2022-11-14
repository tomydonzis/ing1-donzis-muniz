!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'session'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'tests' stamp: 'TD 11/10/2022 18:48:56'!
test01Import
	self importCustomers: self validData.
	
	self assertTwoCustomersWereImported.
	
	self assertPepeSanchezWasPersistedCorrectly.
	
	self assertThatGivenAnUnpersistedAddressThrowsErrorOnUser.
	
	self assertJuanPerezWasPersistedCorrectly.! !


!ImportTest methodsFor: 'setup/teardown' stamp: 'TD 11/10/2022 17:45:53'!
setUp

	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction! !

!ImportTest methodsFor: 'setup/teardown' stamp: 'TD 11/10/2022 17:47:24'!
tearDown

	session commit.
	session close! !


!ImportTest methodsFor: 'assertions' stamp: 'TD 11/10/2022 19:06:41'!
assertJuanPerezWasPersistedCorrectly
	| customer |
	customer := self getCustomerJuanPerez.
	
	self assertPersistedCustomer: customer 
	hasFirstName: 'Juan' 
	lastName: 'Perez' 
	identificationType: 'C' 
	identificationNumber: '23-25666777-9' 
	andNumberOfAddresses: 1.
	
	self assertPersistedAddress: (customer fullAddressAt: 'Alem') 
	hasStreetName: 'Alem' 
	streetNumber: 1122 
	town: 'CABA'  
	zipCode: 1001  
	andProvince: 'CABA'.! !

!ImportTest methodsFor: 'assertions' stamp: 'TD 11/10/2022 19:04:28'!
assertPepeSanchezWasPersistedCorrectly
	
	| customer |
	customer := self getCustomerPepeSanchez.

	self assertPersistedCustomer: customer 
	hasFirstName: 'Pepe' 
	lastName: 'Sanchez' 
	identificationType: 'D'
	identificationNumber: '22333444' 
	andNumberOfAddresses: 2.
	
	self assertPersistedAddress: (customer fullAddressAt: 'San Martin')
	hasStreetName: 'San Martin' 
	streetNumber: 3322 
	town: 'Olivos' 
	zipCode: 1636 
	andProvince: 'BsAs'.
	
	self assertPersistedAddress: (customer fullAddressAt: 'Maipu') 
	hasStreetName: 'Maipu' 
	streetNumber: 888 
	town: 'Florida'  
	zipCode: 1122 
	andProvince: 'Buenos Aires'.! !

!ImportTest methodsFor: 'assertions' stamp: 'TD 11/10/2022 19:02:43'!
assertPersistedAddress: anAddress hasStreetName: aStreetName streetNumber: aStreetNumber town: aTown zipCode: aZipCode andProvince: aProvince     

	self assert: aStreetName equals: anAddress streetName.
	self assert: aStreetNumber equals: anAddress streetNumber.
	self assert: aTown equals: anAddress town.
	self assert: aZipCode equals: anAddress zipCode.
	self assert: aProvince equals: anAddress province! !

!ImportTest methodsFor: 'assertions' stamp: 'TD 11/10/2022 18:56:30'!
assertPersistedCustomer: aCustomer hasFirstName: aName lastName: aLastName identificationType: anIdentificationType identificationNumber: anIdentificationNumber andNumberOfAddresses: aNumberOfAddresses   

	self assert: aName equals: aCustomer firstName.
	self assert: aLastName equals: aCustomer lastName.
	self assert: anIdentificationType equals: aCustomer identificationType.
	self assert: anIdentificationNumber equals: aCustomer identificationNumber.
	
	self assert: aNumberOfAddresses equals: (aCustomer numberOfAddresses)! !

!ImportTest methodsFor: 'assertions' stamp: 'TD 11/14/2022 12:14:21'!
assertThatGivenAnUnpersistedAddressThrowsErrorOnUser
	self should: [self getCustomerJuanPerez fullAddressAt: 'Juncal' ] 
	raise: Error 
	withMessageText: Customer invalidAddressErrorDescription .
! !

!ImportTest methodsFor: 'assertions' stamp: 'TD 11/10/2022 18:42:01'!
assertTwoCustomersWereImported

	^ self assert: 2 equals: (session selectAllOfType: Customer) size! !


!ImportTest methodsFor: 'support' stamp: 'TD 11/10/2022 18:43:01'!
getCustomerJuanPerez

	^ (session select: [:aCustomer | aCustomer hasCUIT and: [aCustomer hasIdentificationNumber: '23-25666777-9']] ofType: Customer) anyOne! !

!ImportTest methodsFor: 'support' stamp: 'TD 11/10/2022 18:43:25'!
getCustomerPepeSanchez

	^ (session select: [:aCustomer | aCustomer hasDNI and: [aCustomer hasIdentificationNumber: '22333444']] ofType: Customer) anyOne! !

!ImportTest methodsFor: 'support' stamp: 'TD 11/10/2022 18:40:31'!
importCustomers: readStream
	(CustomerImporter on: session for: readStream) value! !

!ImportTest methodsFor: 'support' stamp: 'TD 11/10/2022 18:22:26'!
validData

	^ ReadStream on: 
'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs
A,Maipu,888,Florida,1122,Buenos Aires
C,Juan,Perez,C,23-25666777-9
A,Alem,1122,CABA,1001,CABA'! !


!classDefinition: #Address category: 'CustomerImporter'!
Object subclass: #Address
	instanceVariableNames: 'id streetName streetNumber town zipCode province'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Address methodsFor: 'province' stamp: 'HAW 5/22/2022 00:19:29'!
province

	^province! !

!Address methodsFor: 'province' stamp: 'HAW 5/22/2022 00:19:29'!
province: aProvince

	province := aProvince
	! !


!Address methodsFor: 'street' stamp: 'TD 11/10/2022 18:32:24'!
isAt: aStreetName 
	^streetName asUppercase = aStreetName asUppercase.! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetName

	^streetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetName: aStreetName

	streetName := aStreetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetNumber

	^streetNumber ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetNumber: aStreetNumber

	streetNumber := aStreetNumber ! !


!Address methodsFor: 'twon' stamp: 'HAW 5/22/2022 00:19:29'!
town

	^town! !

!Address methodsFor: 'twon' stamp: 'HAW 5/22/2022 00:19:29'!
town: aTown

	town := aTown! !


!Address methodsFor: 'zip code' stamp: 'HAW 5/22/2022 00:19:29'!
zipCode

	^zipCode! !

!Address methodsFor: 'zip code' stamp: 'HAW 5/22/2022 00:19:29'!
zipCode: aZipCode

	zipCode := aZipCode! !


!classDefinition: #Customer category: 'CustomerImporter'!
Object subclass: #Customer
	instanceVariableNames: 'id firstName lastName identificationType identificationNumber addresses'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addAddress: anAddress

	addresses add: anAddress ! !

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addresses

	^ addresses! !

!Customer methodsFor: 'addresses' stamp: 'TD 11/14/2022 12:13:55'!
fullAddressAt: aStreetName  
	^addresses detect: [:anAddress | anAddress isAt: aStreetName] ifNone: 
	[self error: self class invalidAddressErrorDescription ].! !

!Customer methodsFor: 'addresses' stamp: 'TD 11/10/2022 17:59:09'!
numberOfAddresses
	^addresses size.! !


!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
firstName

	^firstName ! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
firstName: aName

	firstName := aName! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
lastName

	^lastName ! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
lastName: aLastName

	lastName := aLastName
! !


!Customer methodsFor: 'identification' stamp: 'TD 11/10/2022 18:35:06'!
hasCUIT
	^identificationType = 'C'.! !

!Customer methodsFor: 'identification' stamp: 'TD 11/10/2022 18:10:13'!
hasDNI
	^identificationType = 'D'.! !

!Customer methodsFor: 'identification' stamp: 'TD 11/10/2022 18:11:04'!
hasIdentificationNumber: anIdentificationNumber 
	^identificationNumber = anIdentificationNumber.! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationNumber

	^identificationNumber ! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationNumber: anIdentificationNumber

	identificationNumber := anIdentificationNumber! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationType

	^identificationType ! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationType: anIdentificationType

	identificationType := anIdentificationType! !


!Customer methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initialize

	super initialize.
	addresses := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Customer class' category: 'CustomerImporter'!
Customer class
	instanceVariableNames: ''!

!Customer class methodsFor: 'error handling' stamp: 'TD 11/14/2022 12:13:35'!
invalidAddressErrorDescription
	^'invalid address!!!!!!'! !


!classDefinition: #CustomerImporter category: 'CustomerImporter'!
Object subclass: #CustomerImporter
	instanceVariableNames: 'session inputStream'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerImporter methodsFor: 'initialization' stamp: 'TD 11/10/2022 18:40:31'!
initializeOn: aSession for: anInputStream
	session := aSession.
	inputStream := anInputStream.! !


!CustomerImporter methodsFor: 'evaluating' stamp: 'TD 11/10/2022 18:40:31'!
value

	| newCustomer line |
	line := inputStream nextLine.
	[ line notNil ] whileTrue: [
		(line beginsWith: 'C') ifTrue: [ | customerData |
			customerData := line findTokens: $,.
			newCustomer := Customer new.
			newCustomer firstName: customerData second.
			newCustomer lastName: customerData third.
			newCustomer identificationType: customerData fourth.
			newCustomer identificationNumber: customerData fifth.
			session persist: newCustomer ].

		(line beginsWith: 'A') ifTrue: [ | addressData newAddress |
			addressData := line findTokens: $,.
			newAddress := Address new.
			newCustomer addAddress: newAddress.
			newAddress streetName: addressData second.
			newAddress streetNumber: addressData third asNumber .
			newAddress town: addressData fourth.
			newAddress zipCode: addressData fifth asNumber .
			newAddress province: addressData sixth ].

		line := inputStream nextLine. ].
inputStream close! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerImporter class' category: 'CustomerImporter'!
CustomerImporter class
	instanceVariableNames: ''!

!CustomerImporter class methodsFor: 'instance creation' stamp: 'TD 11/10/2022 18:40:31'!
on: aSession for: anInputStream
	^self new initializeOn: aSession for: anInputStream! !


!classDefinition: #DataBaseSession category: 'CustomerImporter'!
Object subclass: #DataBaseSession
	instanceVariableNames: 'configuration tables id'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!DataBaseSession methodsFor: 'transaction management' stamp: 'HAW 5/22/2022 00:19:29'!
beginTransaction

	! !

!DataBaseSession methodsFor: 'transaction management' stamp: 'HAW 5/22/2022 19:17:36'!
commit

	(tables at: Customer ifAbsent: [#()]) do: [ :aCustomer | self persistAddressesOf: aCustomer ]
	! !


!DataBaseSession methodsFor: 'closing' stamp: 'HAW 5/22/2022 00:19:29'!
close

	! !


!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
defineIdOf: anObject

	anObject instVarNamed: 'id' put: (self newIdFor: anObject).! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
delay

	(Delay forMilliseconds: 100) wait! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 19:29:06'!
objectsOfType: aType

	^ tables at: aType ifAbsent: [ #() ]! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
persistAddressesOf: anObjectWithAddresses

	anObjectWithAddresses addresses do: [ :anAddress | self persist: anAddress ]
	! !


!DataBaseSession methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initializeFor: aConfiguration

	configuration := aConfiguration.
	tables := Dictionary new.
	id := 0.! !


!DataBaseSession methodsFor: 'id' stamp: 'HAW 5/22/2022 00:19:29'!
newIdFor: anObject

	id := id + 1.
	^id! !


!DataBaseSession methodsFor: 'persistance' stamp: 'HAW 5/22/2022 00:19:29'!
persist: anObject

	| table |

	self delay.
	table := tables at: anObject class ifAbsentPut: [ Set new ].

	self defineIdOf: anObject.
	table add: anObject.

	(anObject isKindOf: Customer) ifTrue: [ self persistAddressesOf: anObject ].! !


!DataBaseSession methodsFor: 'selecting' stamp: 'HAW 5/22/2022 19:29:06'!
select: aCondition ofType: aType

	self delay.
	^(self objectsOfType: aType) select: aCondition ! !

!DataBaseSession methodsFor: 'selecting' stamp: 'HAW 5/22/2022 19:29:06'!
selectAllOfType: aType

	self delay.
	^(self objectsOfType: aType) copy ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DataBaseSession class' category: 'CustomerImporter'!
DataBaseSession class
	instanceVariableNames: ''!

!DataBaseSession class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 00:19:29'!
for: aConfiguration

	^self new initializeFor: aConfiguration! !
