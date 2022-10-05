!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 20:37:37'!
test01InputVacio
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: ''.
	self assert: (marsRover position) equals: 0@0.
	self assert: (marsRover orientation) equals: 'N'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 20:41:52'!
test02InputMoverAdelante
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'f'.
	self assert: (marsRover position) equals: 0@1.
	self assert: (marsRover orientation) equals: 'N'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 20:45:57'!
test03InputMoverAtras
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'b'.
	self assert: (marsRover position) equals: 0@-1.
	self assert: (marsRover orientation) equals: 'N'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 20:47:27'!
test04InputRotar90Izq
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'l'.
	self assert: (marsRover position) equals: 0@0.
	self assert: (marsRover orientation) equals: 'O'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 20:48:39'!
test05InputRotar90Der
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'r'.
	self assert: (marsRover position) equals: 0@0.
	self assert: (marsRover orientation) equals: 'E'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 20:53:00'!
test06InputMoverAdelanteDosVeces
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'ff'.
	self assert: (marsRover position) equals: 0@2.
	self assert: (marsRover orientation) equals: 'N'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:02:11'!
test07InputMoverAtrasDosVeces
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'bb'.
	self assert: (marsRover position) equals: 0@-2.
	self assert: (marsRover orientation) equals: 'N'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:03:19'!
test08InputRotar90IzqDosVeces
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'll'.
	self assert: (marsRover position) equals: 0@0.
	self assert: (marsRover orientation) equals: 'S'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:05:00'!
test09InputRotar90DerDosVeces
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'rr'.
	self assert: (marsRover position) equals: 0@0.
	self assert: (marsRover orientation) equals: 'S'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:41:13'!
test10InputRotar90DerYMoverAdelante
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'rf'.
	self assert: (marsRover position) equals: 1@0.
	self assert: (marsRover orientation) equals: 'E'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:43:27'!
test11InputRotar90IzqYMoverAdelante
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'lf'.
	self assert: (marsRover position) equals: -1@0.
	self assert: (marsRover orientation) equals: 'O'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:45:50'!
test12InputRotar90DerYMoverAtras
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'rb'.
	self assert: (marsRover position) equals: -1@0.
	self assert: (marsRover orientation) equals: 'E'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:47:08'!
test13InputRotar90IzqYMoverAtras
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'lb'.
	self assert: (marsRover position) equals: 1@0.
	self assert: (marsRover orientation) equals: 'O'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:41:35'!
test14InputInvalidoDejaDeProcesar
	|marsRover|
	marsRover := MarsRover at: 0@0 pointing: 'N'.
	
	marsRover sendCommandSequence: 'fpf'.
	self assert: (marsRover position) equals: 0@1.
	self assert: (marsRover orientation) equals: 'N'.
	! !


!classDefinition: #PuntoCardinalTest category: 'MarsRover'!
TestCase subclass: #PuntoCardinalTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:58:26'!
test00CorrectDirection
	|puntoCardinal startingDirection|
	startingDirection := 'N'.
	puntoCardinal := PuntoCardinal with: startingDirection for: MarsRover new.
	
	self assert: startingDirection equals: (puntoCardinal direction).! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:58:46'!
test01NorthRotateRightBecomesEast
	|puntoCardinal|
	puntoCardinal := PuntoCardinal with: 'N' for: MarsRover new.
	
	self assert: 'E' equals: (puntoCardinal rightNext).! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:58:49'!
test02NorthRotateLeftBecomesWest
	|puntoCardinal|
	puntoCardinal := PuntoCardinal with: 'N' for: MarsRover new.
	
	self assert: 'O' equals: (puntoCardinal leftNext).! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:58:55'!
test03SouthRotateRightBecomesWest
	|puntoCardinal|
	puntoCardinal := PuntoCardinal with: 'S' for: MarsRover new.
	
	self assert: 'O' equals: (puntoCardinal rightNext).! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:59:01'!
test04SouthRotateLeftBecomesEast
	|puntoCardinal|
	puntoCardinal := PuntoCardinal with: 'S' for: MarsRover new.
	
	self assert: 'E' equals: (puntoCardinal leftNext).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'TD 10/5/2022 00:22:31'!
initializeAt: aPoint pointing: aDirection 
	position := aPoint.
	orientation := PuntoCardinal with: aDirection for: self.! !


!MarsRover methodsFor: 'instructions' stamp: 'TD 10/5/2022 00:46:01'!
sendCommandSequence: aString
	aString do: [:aCommand | 
				
	(aCommand = $f) 
	ifTrue: [orientation moveForwardTowards.]
	ifFalse: [
		(aCommand = $b) 
		ifTrue: [orientation moveBackwardTowards.]
		ifFalse: [
			(aCommand = $l) 
			ifTrue: [orientation := PuntoCardinal with: (orientation leftNext) for: self.]
			ifFalse: [
				(aCommand = $r) 
				ifTrue: [orientation := PuntoCardinal with: (orientation rightNext) for: self.]
				ifFalse: [^self]
			]
		]
	]
]
	! !


!MarsRover methodsFor: 'status' stamp: 'FM 10/3/2022 21:39:30'!
orientation
	^orientation direction.! !

!MarsRover methodsFor: 'status' stamp: 'FM 10/3/2022 20:45:21'!
position
	^position.! !


!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/5/2022 00:33:37'!
movePointingEast
	position := position + (1@0).! !

!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/5/2022 00:36:20'!
movePointingNorth
	position := position + (0@1).! !

!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/5/2022 00:33:44'!
movePointingSouth
	position := position + (0@-1).! !

!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/5/2022 00:33:50'!
movePointingWest
	position := position + (-1@0).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'FM 10/3/2022 20:38:46'!
at: aPoint pointing: aString 
	^self new initializeAt: aPoint pointing: aString.! !


!classDefinition: #PuntoCardinal category: 'MarsRover'!
Object subclass: #PuntoCardinal
	instanceVariableNames: 'rover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntoCardinal methodsFor: 'initialization' stamp: 'TD 10/5/2022 01:04:25'!
initializeFor: aMarsRover 
	rover := aMarsRover.! !


!PuntoCardinal methodsFor: 'modifiers' stamp: 'TD 10/5/2022 00:48:50'!
leftNext
	self subclassResponsibility.! !

!PuntoCardinal methodsFor: 'modifiers' stamp: 'TD 10/5/2022 00:48:57'!
rightNext
	self subclassResponsibility.! !


!PuntoCardinal methodsFor: 'accessing' stamp: 'TD 10/5/2022 00:48:38'!
direction
	self subclassResponsibility.! !


!PuntoCardinal methodsFor: 'directing - private' stamp: 'TD 10/5/2022 00:50:05'!
moveBackwardTowards
	self subclassResponsibility.! !

!PuntoCardinal methodsFor: 'directing - private' stamp: 'TD 10/5/2022 00:49:56'!
moveForwardTowards
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuntoCardinal class' category: 'MarsRover'!
PuntoCardinal class
	instanceVariableNames: ''!

!PuntoCardinal class methodsFor: 'instance creation' stamp: 'TD 10/5/2022 01:05:19'!
with: aDirection for: aMarsRover 
	self subclasses detect: [:aCardinalPoint | aCardinalPoint canHandle: aDirection]
	ifFound: [:aCardinalPoint | ^aCardinalPoint new initializeFor: aMarsRover]
	ifNone: [].! !


!classDefinition: #East category: 'MarsRover'!
PuntoCardinal subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:50:39'!
direction
	^'E'.! !

!East methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:51:31'!
leftNext
	^'N'.! !

!East methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:51:57'!
moveBackwardTowards
	rover movePointingWest.! !

!East methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:52:17'!
moveForwardTowards
	rover movePointingEast.! !

!East methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:51:27'!
rightNext
	^'S'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'identification - private' stamp: 'TD 10/5/2022 01:06:53'!
canHandle: aDirection
	^(aDirection = 'E')! !


!classDefinition: #North category: 'MarsRover'!
PuntoCardinal subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:53:22'!
direction
	^'N'.! !

!North methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:53:37'!
leftNext
	^'O'.! !

!North methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:54:07'!
moveBackwardTowards
	rover movePointingSouth.! !

!North methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:53:56'!
moveForwardTowards
	rover movePointingNorth.! !

!North methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:53:46'!
rightNext
	^'E'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'identification - private' stamp: 'TD 10/5/2022 01:03:15'!
canHandle: aDirection 
	^(aDirection = 'N').! !


!classDefinition: #South category: 'MarsRover'!
PuntoCardinal subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:54:17'!
direction
	^'S'.! !

!South methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:54:41'!
leftNext
	^'E'.! !

!South methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:54:55'!
moveBackwardTowards
	rover movePointingNorth.! !

!South methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:55:06'!
moveForwardTowards
	rover movePointingSouth.! !

!South methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:55:19'!
rightNext
	^'O'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRover'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'identification - private' stamp: 'TD 10/5/2022 01:06:14'!
canHandle: aDirection
	^(aDirection = 'S')! !


!classDefinition: #West category: 'MarsRover'!
PuntoCardinal subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:55:38'!
direction
	^'O'.! !

!West methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:56:41'!
leftNext
	^'S'.! !

!West methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:55:59'!
moveBackwardTowards
	rover movePointingEast.! !

!West methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:56:09'!
moveForwardTowards
	rover movePointingWest.! !

!West methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:56:34'!
rightNext
	^'N'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRover'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'identification - private' stamp: 'TD 10/5/2022 01:07:24'!
canHandle: aDirection
	^(aDirection = 'O')! !
