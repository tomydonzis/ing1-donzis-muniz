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


!classDefinition: #PuntoCardinalTest category: 'MarsRover'!
TestCase subclass: #PuntoCardinalTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:27:00'!
test00CorrectDirection
	|puntoCardinal startingDirection|
	startingDirection := 'N'.
	puntoCardinal := PuntoCardinal with: startingDirection.
	
	self assert: startingDirection equals: (puntoCardinal direction).! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:11:46'!
test01NorthRotateRightBecomesEast
	|puntoCardinal|
	puntoCardinal := PuntoCardinal with: 'N'.
	
	self assert: 'E' equals: (puntoCardinal rightNext).! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:14:49'!
test02NorthRotateLeftBecomesWest
	|puntoCardinal|
	puntoCardinal := PuntoCardinal with: 'N'.
	
	self assert: 'O' equals: (puntoCardinal leftNext).! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:17:12'!
test03SouthRotateRightBecomesWest
	|puntoCardinal|
	puntoCardinal := PuntoCardinal with: 'S'.
	
	self assert: 'O' equals: (puntoCardinal rightNext).! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'FM 10/3/2022 21:15:58'!
test04SouthRotateLeftBecomesEast
	|puntoCardinal|
	puntoCardinal := PuntoCardinal with: 'S'.
	
	self assert: 'E' equals: (puntoCardinal leftNext).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'FM 10/3/2022 21:24:37'!
initializeAt: aPoint pointing: aDirection 
	position := aPoint.
	orientation := PuntoCardinal with: aDirection.! !


!MarsRover methodsFor: 'instructions' stamp: 'FM 10/3/2022 21:46:44'!
sendCommandSequence: aString
	aString do: [:aCommand | 
		
	(aCommand = $f) ifTrue: [
		(orientation direction = 'E') ifTrue: [
			position := position + (1@0).
			].
		(orientation direction = 'N') ifTrue: [
			position := position + (0@1).
			].
		(orientation direction = 'O') ifTrue: [
			position := position + (-1@0).
			].
		(orientation direction = 'S') ifTrue: [
			position := position + (0@-1).
			].
		].
	(aCommand = $b) ifTrue: [
		(orientation direction = 'E') ifTrue: [
			position := position + (-1@0).
			].
		(orientation direction = 'N') ifTrue: [
			position := position + (0@-1).
			].
		(orientation direction = 'O') ifTrue: [
			position := position + (1@0).
			].
		(orientation direction = 'S') ifTrue: [
			position := position + (0@1).
			].
		].
	(aCommand = $l) ifTrue: [
		orientation := PuntoCardinal with: (orientation leftNext).
		].
	(aCommand = $r) ifTrue: [
		orientation := PuntoCardinal with: (orientation rightNext).
		
		].
	]
	! !


!MarsRover methodsFor: 'status' stamp: 'FM 10/3/2022 21:39:30'!
orientation
	^orientation direction.! !

!MarsRover methodsFor: 'status' stamp: 'FM 10/3/2022 20:45:21'!
position
	^position.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'FM 10/3/2022 20:38:46'!
at: aPoint pointing: aString 
	^self new initializeAt: aPoint pointing: aString.! !


!classDefinition: #PuntoCardinal category: 'MarsRover'!
Object subclass: #PuntoCardinal
	instanceVariableNames: 'direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntoCardinal methodsFor: 'initialization' stamp: 'FM 10/3/2022 21:13:18'!
initializeWith: aDirection
	direction := aDirection.! !


!PuntoCardinal methodsFor: 'modifiers' stamp: 'FM 10/3/2022 21:28:20'!
leftNext
	(direction = 'N') ifTrue: [
		^'O'.
		].
	(direction = 'S') ifTrue: [
		^'E'.
		].
	(direction = 'E') ifTrue: [
		^'N'.
		].
	^'S'.! !

!PuntoCardinal methodsFor: 'modifiers' stamp: 'FM 10/3/2022 21:19:45'!
rightNext
	(direction = 'N') ifTrue: [
		^'E'.
		].
	(direction = 'S') ifTrue: [
		^'O'.
		].
	(direction = 'E') ifTrue: [
		^'S'.
		].
	^'N'.! !


!PuntoCardinal methodsFor: 'accessing' stamp: 'FM 10/3/2022 21:27:17'!
direction
	^direction! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuntoCardinal class' category: 'MarsRover'!
PuntoCardinal class
	instanceVariableNames: ''!

!PuntoCardinal class methodsFor: 'instance creation' stamp: 'FM 10/3/2022 21:12:53'!
with: aDirection
	^self new initializeWith: aDirection.! !
