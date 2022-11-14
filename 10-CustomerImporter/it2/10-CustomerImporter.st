!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'session'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'tests' stamp: 'TD 11/14/2022 19:47:52'!
assertNoAddressesWereImportedForCustomer

	^ self assert: 0 equals: (self customerWithIdentificationType: 'D' number: '1') numberOfAddresses! !

!ImportTest methodsFor: 'tests' stamp: 'TD 11/14/2022 19:47:29'!
assertNoCustomerWasImportedAndErrorWas: anError

	self assert: (CustomerImporter invalidDataErrorDescription) equals: anError messageText.
			self assertNumberOfCustomersImportedIs: 0! !

!ImportTest methodsFor: 'tests' stamp: 'TD 11/14/2022 19:50:49'!
test01ValidDataIsImportedCorrectly

	CustomerImporter valueFrom: self validImportData into: session..

	 self assertNumberOfCustomersImportedIs: 2.
	self assertPepeSanchezWasImportedCorrecty.
	self assertJuanPerezWasImportedCorrectly ! !

!ImportTest methodsFor: 'tests' stamp: 'TD 11/14/2022 19:52:35'!
test02DataWithInvalidEntityNameIsNotImported

	self should: [CustomerImporter valueFrom: self invalidImportData into: session] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: 
	[:anError | self assertNoCustomerWasImportedAndErrorWas: anError].! !

!ImportTest methodsFor: 'tests' stamp: 'TD 11/14/2022 19:52:51'!
test03DataWithInvalidCustomerFormatIsNotImported

	self should: [CustomerImporter valueFrom: self invalidCustomerFormatData into: session] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: 
	[:anError | self assertNoCustomerWasImportedAndErrorWas: anError].! !

!ImportTest methodsFor: 'tests' stamp: 'TD 11/14/2022 19:53:16'!
test04DataWithInvalidAddressFormatIsNotImported

	self should: [CustomerImporter valueFrom: self invalidAddressFormatData into: session] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: 
	[:anError | 
		self assert: (CustomerImporter invalidDataErrorDescription) equals: anError messageText.
		self assertNoAddressesWereImportedForCustomer].! !

!ImportTest methodsFor: 'tests' stamp: 'TD 11/14/2022 19:53:37'!
test05DataWithAddressNotAssociatedWithCustomerIsNotImported

	self should: [CustomerImporter valueFrom: self addressWithoutCustomerData into: session] 
	raise: Error - MessageNotUnderstood
	withExceptionDo: 
	[:anError | 
	self assert: (CustomerImporter addressWithoutCustomerErrorDescription) equals: anError messageText.].! !

!ImportTest methodsFor: 'tests' stamp: 'TD 11/14/2022 19:53:54'!
test06DataWithCustomerEntryWithInvalidAmountOfValuesIsNotImported

	self should: [CustomerImporter valueFrom: self customersWithInvalidAmountOfValuesData into: session] 
	raise: Error - MessageNotUnderstood
	withExceptionDo: 
	[:anError | 
	self assert: (CustomerImporter fiveValuesRequiredForCustomerErrorDescription) equals: anError messageText.
	self assertNumberOfCustomersImportedIs: 0].! !

!ImportTest methodsFor: 'tests' stamp: 'TD 11/14/2022 19:54:17'!
test07DataWithAddressEntryWithInvalidAmountOfValuesIsNotImported

	self should: [CustomerImporter valueFrom: self addressWithInvalidAmountOfValuesData into: session] 
	raise: Error - MessageNotUnderstood
	withExceptionDo: 
	[:anError | 
	self assert: (CustomerImporter sixValuesRequiredForAddressErrorDescription) equals: anError messageText.
	self assertNoAddressesWereImportedForCustomer].! !

!ImportTest methodsFor: 'tests' stamp: 'TD 11/14/2022 19:54:27'!
test08DataWithBlankLineIsNotImported

	self should: [CustomerImporter valueFrom: self blankLineData into: session] 
	raise: Error - MessageNotUnderstood
	withExceptionDo: 
	[:anError | 
	self assert: (CustomerImporter blankLineErrorDescription) equals: anError messageText].! !


!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:22:05'!
assertAddressOf: importedCustomer at: aStreetName hasNumber: aNumber town: aTown zipCode: aZipCode province: aProvince

	| importedAddress |

	importedAddress := importedCustomer addressAt: aStreetName ifNone: [ self fail ].
	self assert: aStreetName equals: importedAddress streetName.
	self assert: aNumber equals: importedAddress streetNumber.
	self assert: aTown equals: importedAddress town.
	self assert: aZipCode equals: importedAddress zipCode.
	self assert: aProvince equals: importedAddress province.

	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:27:57'!
assertCustomerWithIdentificationType: anIdType number: anIdNumber hasFirstName: aFirstName lastName: aLastName

	| importedCustomer |

	importedCustomer := self customerWithIdentificationType: anIdType number: anIdNumber.

	self assert: aFirstName equals: importedCustomer firstName.
	self assert: aLastName equals: importedCustomer lastName.
	self assert: anIdType equals: importedCustomer identificationType.
	self assert: anIdNumber equals: importedCustomer identificationNumber.

	^importedCustomer

	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:28:45'!
assertJuanPerezWasImportedCorrectly

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'C' number: '23-25666777-9' hasFirstName: 'Juan' lastName: 'Perez'.
	self assertAddressOf: importedCustomer at: 'Alem' hasNumber: 1122 town: 'CABA' zipCode: 1001 province: 'CABA'
	! !

!ImportTest methodsFor: 'assertions' stamp: 'TD 11/14/2022 18:21:57'!
assertNumberOfCustomersImportedIs: numberOfCustomers

	^ self assert: numberOfCustomers equals: (session selectAllOfType: Customer) size! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:28:05'!
assertPepeSanchezWasImportedCorrecty

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'D' number: '22333444' hasFirstName: 'Pepe' lastName: 'Sanchez'.
	self assertAddressOf: importedCustomer at: 'San Martin' hasNumber: 3322 town: 'Olivos' zipCode: 1636 province: 'BsAs'.
	self assertAddressOf: importedCustomer at: 'Maipu' hasNumber: 888 town: 'Florida' zipCode: 1122 province: 'Buenos Aires'.


	! !


!ImportTest methodsFor: 'setUp/tearDown' stamp: 'HAW 5/22/2022 00:27:50'!
setUp

	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction.
! !

!ImportTest methodsFor: 'setUp/tearDown' stamp: 'HAW 5/22/2022 00:28:23'!
tearDown

	session commit.
	session close.
	! !


!ImportTest methodsFor: 'customer' stamp: 'HAW 5/22/2022 18:14:22'!
customerWithIdentificationType: anIdType number: anIdNumber

	^ (session
		select: [ :aCustomer | aCustomer identificationType = anIdType and: [ aCustomer identificationNumber = anIdNumber ]]
		ofType: Customer) anyOne! !


!ImportTest methodsFor: 'test data' stamp: 'TD 11/14/2022 19:12:26'!
addressWithInvalidAmountOfValuesData
	^ReadStream on: 
'C,Pepe,Sanchez,D,1
A,Libertador,1,CABA,13123'! !

!ImportTest methodsFor: 'test data' stamp: 'TD 11/14/2022 18:50:41'!
addressWithoutCustomerData
	^ReadStream on: 'A,Libertador,414,CABA,1243,CABA'.! !

!ImportTest methodsFor: 'test data' stamp: 'TD 11/14/2022 19:32:19'!
blankLineData
	^ReadStream on:
'
'.! !

!ImportTest methodsFor: 'test data' stamp: 'TD 11/14/2022 19:10:10'!
customersWithInvalidAmountOfValuesData
	^ReadStream on: 'C,Carlos,Juarez,C'.! !

!ImportTest methodsFor: 'test data' stamp: 'TD 11/14/2022 19:03:33'!
invalidAddressFormatData
	^ReadStream on:
'C,Pepe,Sanchez,D,1
AD,Libertador,414,CABA,1425442,CABA'! !

!ImportTest methodsFor: 'test data' stamp: 'TD 11/14/2022 19:02:25'!
invalidCustomerFormatData
	^ReadStream on: 'CC,Pepe,Sanchez,D,12341243'.! !

!ImportTest methodsFor: 'test data' stamp: 'TD 11/14/2022 18:16:51'!
invalidImportData
	^ReadStream on: 'X'.! !

!ImportTest methodsFor: 'test data' stamp: 'HAW 5/22/2022 18:08:08'!
validImportData

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


!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 17:55:46'!
isAt: aStreetName

	^streetName = aStreetName ! !

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

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 17:55:17'!
addressAt: aStreetName ifNone: aNoneBlock

	^addresses detect: [ :address | address isAt: aStreetName ] ifNone: aNoneBlock ! !

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addresses

	^ addresses! !


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

!Customer methodsFor: 'name' stamp: 'TD 11/14/2022 18:35:02'!
numberOfAddresses
	^addresses size.! !


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


!classDefinition: #CustomerImporter category: 'CustomerImporter'!
Object subclass: #CustomerImporter
	instanceVariableNames: 'session readStream line newCustomer record'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerImporter methodsFor: 'initialization' stamp: 'HAW 5/22/2022 18:06:47'!
initializeFrom: aReadStream into: aSession
	session := aSession.
	readStream := aReadStream.! !


!CustomerImporter methodsFor: 'evaluating' stamp: 'TD 11/14/2022 18:12:33'!
value

	[self hasNextLine ] whileTrue: [  
		self createRecord.
		self importRecord.	]! !


!CustomerImporter methodsFor: 'record identification' stamp: 'TD 11/14/2022 18:11:47'!
createRecord

	^ record := line findTokens: $,! !

!CustomerImporter methodsFor: 'record identification' stamp: 'TD 11/14/2022 18:12:49'!
hasNextLine

	line := readStream nextLine. 
	^line notNil! !

!CustomerImporter methodsFor: 'record identification' stamp: 'TD 11/14/2022 18:31:04'!
isAddressRecord

	^ line beginsWith: 'A,'! !

!CustomerImporter methodsFor: 'record identification' stamp: 'TD 11/14/2022 19:36:14'!
isBlankRecord
	^line isEmpty.! !

!CustomerImporter methodsFor: 'record identification' stamp: 'TD 11/14/2022 18:25:00'!
isCustomerRecord

	^ line beginsWith: 'C,'! !


!CustomerImporter methodsFor: 'assertions' stamp: 'TD 11/14/2022 19:16:39'!
assertRightAmountOfValuesInRecordIs: anAmountOfValues ifNot: aFalseBlock 

	^ record size = anAmountOfValues ifFalse: aFalseBlock.! !


!CustomerImporter methodsFor: 'importing' stamp: 'TD 11/14/2022 19:50:02'!
assertAddressIsAssociatedToCustomer

	^ newCustomer ifNil: [self error: self class addressWithoutCustomerErrorDescription]! !

!CustomerImporter methodsFor: 'importing' stamp: 'TD 11/14/2022 19:50:02'!
importAddress
	| newAddress |
	
	self assertRightAmountOfValuesInRecordIs: 6 
		ifNot: [self error: self class sixValuesRequiredForAddressErrorDescription].
	
	self assertAddressIsAssociatedToCustomer.
			
			newAddress := Address new.
			newCustomer addAddress: newAddress.
			newAddress streetName: record second.
			newAddress streetNumber: record third asNumber .
			newAddress town: record fourth.
			newAddress zipCode: record fifth asNumber .
			newAddress province: record sixth.! !

!CustomerImporter methodsFor: 'importing' stamp: 'TD 11/14/2022 19:45:14'!
importCustomer
	
	self assertRightAmountOfValuesInRecordIs: 5 
		ifNot: [self error: self class fiveValuesRequiredForCustomerErrorDescription].

	newCustomer := Customer new.
			newCustomer firstName: record second.
			newCustomer lastName: record third.
			newCustomer identificationType: record fourth.
			newCustomer identificationNumber: record fifth.
			session persist: newCustomer! !

!CustomerImporter methodsFor: 'importing' stamp: 'TD 11/14/2022 19:45:33'!
importRecord

	(self isCustomerRecord) ifTrue: [
		^self importCustomer ].

	(self isAddressRecord) ifTrue: [
		^self importAddress].
	
	(self isBlankRecord) ifTrue: [self error: self class blankLineErrorDescription].
	
	self error: self class invalidDataErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerImporter class' category: 'CustomerImporter'!
CustomerImporter class
	instanceVariableNames: ''!

!CustomerImporter class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 18:06:47'!
from: aReadStream into: aSession
	^self new initializeFrom: aReadStream into: aSession! !


!CustomerImporter class methodsFor: 'importing' stamp: 'HAW 5/22/2022 18:11:27'!
valueFrom: aReadStream into: aSession

	^(self from: aReadStream into: aSession) value! !


!CustomerImporter class methodsFor: 'error handling' stamp: 'TD 11/14/2022 18:56:03'!
addressWithoutCustomerErrorDescription
	^'addresses should be associated to a customer!!!!!!'! !

!CustomerImporter class methodsFor: 'error handling' stamp: 'TD 11/14/2022 19:32:44'!
blankLineErrorDescription
	^'input contains blank line!!!!!!!!'! !

!CustomerImporter class methodsFor: 'error handling' stamp: 'TD 11/14/2022 19:07:58'!
fiveValuesRequiredForCustomerErrorDescription
	^'five values are required to import a customer!!!!!!'! !

!CustomerImporter class methodsFor: 'error handling' stamp: 'TD 11/14/2022 19:31:33'!
invalidDataErrorDescription
	^'invalid data preffix for customers is "C" and preffix for addresses is "A"!!!!!!!!'! !

!CustomerImporter class methodsFor: 'error handling' stamp: 'TD 11/14/2022 19:11:41'!
sixValuesRequiredForAddressErrorDescription
	^'six values are required to import an address'! !


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
