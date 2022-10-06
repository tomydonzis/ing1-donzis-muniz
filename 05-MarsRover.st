!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRoverTest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:06:29'!
assertMarsRoverWasCommanded: aCommandSequence andEndedUpInPosition: aPosition andFacing: aDirection  

	marsRoverTest sendCommandSequence: aCommandSequence.
	self assert: (marsRoverTest position) equals: aPosition.
	self assert: (marsRoverTest orientation) equals: aDirection.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:00:04'!
setUp
	marsRoverTest := MarsRover at: 0@0 pointing: North.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:06:49'!
test01InputVacio
	
	self assertMarsRoverWasCommanded: '' andEndedUpInPosition: 0@0 andFacing: 'N'
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:07:16'!
test02InputMoverAdelante

	self assertMarsRoverWasCommanded: 'f' andEndedUpInPosition: 0@1 andFacing: 'N' 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:07:42'!
test03InputMoverAtras

	self assertMarsRoverWasCommanded: 'b' andEndedUpInPosition: 0@-1 andFacing: 'N' ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:08:04'!
test04InputRotar90Izq

	self assertMarsRoverWasCommanded: 'l' andEndedUpInPosition: 0@0 andFacing: 'O' ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:08:21'!
test05InputRotar90Der

	self assertMarsRoverWasCommanded: 'r' andEndedUpInPosition: 0@0 andFacing: 'E' ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:08:33'!
test06InputMoverAdelanteDosVeces
	self assertMarsRoverWasCommanded: 'ff' andEndedUpInPosition: 0@2 andFacing: 'N' ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:08:48'!
test07InputMoverAtrasDosVeces
	self assertMarsRoverWasCommanded: 'bb' andEndedUpInPosition: 0@-2 andFacing: 'N' ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:08:58'!
test08InputRotar90IzqDosVeces
	self assertMarsRoverWasCommanded: 'll' andEndedUpInPosition: 0@0 andFacing: 'S' 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:09:13'!
test09InputRotar90DerDosVeces
	self assertMarsRoverWasCommanded: 'rr' andEndedUpInPosition: 0@0 andFacing: 'S' 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:09:27'!
test10InputRotar90DerYMoverAdelante
	self assertMarsRoverWasCommanded: 'rf' andEndedUpInPosition: 1@0 andFacing: 'E' 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:09:53'!
test11InputRotar90IzqYMoverAdelante
	self assertMarsRoverWasCommanded: 'lf' andEndedUpInPosition: -1@0 andFacing: 'O' 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:10:19'!
test12InputRotar90DerYMoverAtras
	self assertMarsRoverWasCommanded: 'rb' andEndedUpInPosition: -1@0 andFacing: 'E' 
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:10:33'!
test13InputRotar90IzqYMoverAtras
	self assertMarsRoverWasCommanded: 'lb' andEndedUpInPosition: 1@0 andFacing: 'O' ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 14:11:02'!
test14InputInvalidoDejaDeProcesar
	self assertMarsRoverWasCommanded: 'fpf' andEndedUpInPosition: 0@1 andFacing: 'N'. ! !


!classDefinition: #PuntoCardinalTest category: 'MarsRover'!
TestCase subclass: #PuntoCardinalTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:50:30'!
test00DireccionCorrecta
	|puntoCardinal startingDirection|
	startingDirection := 'N'.
	puntoCardinal := North for: MarsRover new.
	
	self assert: startingDirection equals: (puntoCardinal direction).! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:50:54'!
test01NorteRotadoADerechaEsEste
	|puntoCardinal|
	puntoCardinal := North for: MarsRover new.
	
	self assert: 'E' equals: (puntoCardinal rightNext) direction.! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:51:31'!
test02NorteRotadoAIzquierdaEsOeste
	|puntoCardinal|
	puntoCardinal := North for: MarsRover new.
	
	self assert: 'O' equals: (puntoCardinal leftNext) direction.! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:51:36'!
test03SurRotadoADerechaEsOeste
	|puntoCardinal|
	puntoCardinal := South for: MarsRover new.
	
	self assert: 'O' equals: (puntoCardinal rightNext) direction.! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:52:49'!
test04SurRotadoAIzquierdaEsEste
	|puntoCardinal|
	puntoCardinal := South for: MarsRover new.
	
	self assert: 'E' equals: (puntoCardinal leftNext) direction.! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:53:43'!
test05EsteRotadoADerechaEsSur
	|puntoCardinal|
	puntoCardinal := East for: MarsRover new.
	
	self assert: 'S' equals: (puntoCardinal rightNext) direction.! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:53:03'!
test06EsteRotadoAIzquierdaEsNorte
	|puntoCardinal|
	puntoCardinal := East for: MarsRover new.
	
	self assert: 'N' equals: (puntoCardinal leftNext) direction.! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:54:21'!
test07OesteRotadoADerechaEsNorte
	|puntoCardinal|
	puntoCardinal := West for: MarsRover new.
	
	self assert: 'S' equals: (puntoCardinal leftNext) direction.! !

!PuntoCardinalTest methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:54:28'!
test08OesteRotadoAIzquierdaEsSur
	|puntoCardinal|
	puntoCardinal := West for: MarsRover new.
	
	self assert: 'N' equals: (puntoCardinal rightNext) direction.! !


!classDefinition: #Command category: 'MarsRover'!
Object subclass: #Command
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Command methodsFor: 'commanding - private' stamp: 'TD 10/6/2022 13:24:34'!
executeOn: aMarsRover
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'MarsRover'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'instance creation' stamp: 'TD 10/6/2022 13:10:22'!
for: aCommand

	^self subclasses detect: [:aCommandSubclass | aCommandSubclass canHandle: aCommand]
	ifFound: [:aCommandSubclass | ^aCommandSubclass new]
	ifNone: [^Invalid new]! !


!Command class methodsFor: 'identification' stamp: 'TD 10/6/2022 13:24:55'!
canHandle: aCommand
	self subclassResponsibility.! !


!classDefinition: #Backward category: 'MarsRover'!
Command subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Backward methodsFor: 'commanding - private' stamp: 'TD 10/6/2022 13:13:41'!
executeOn: aMarsRover 
	aMarsRover moveBackwards.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'MarsRover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'identification' stamp: 'TD 10/6/2022 13:13:13'!
canHandle: aCommand 
	^(aCommand = $b)! !


!classDefinition: #Forward category: 'MarsRover'!
Command subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Forward methodsFor: 'commanding - private' stamp: 'TD 10/6/2022 13:12:11'!
executeOn: aMarsRover 
	aMarsRover moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'identification' stamp: 'TD 10/6/2022 13:11:21'!
canHandle: aCommand
	^(aCommand = $f)! !


!classDefinition: #Invalid category: 'MarsRover'!
Command subclass: #Invalid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Invalid methodsFor: 'commanding - private' stamp: 'TD 10/6/2022 13:24:12'!
executeOn: aMarsRover 
	^self error: 'Invalid command!!!!!!'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Invalid class' category: 'MarsRover'!
Invalid class
	instanceVariableNames: ''!

!Invalid class methodsFor: 'identification' stamp: 'TD 10/6/2022 13:17:49'!
canHandle: aCommand
	^false.! !


!classDefinition: #Left category: 'MarsRover'!
Command subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Left methodsFor: 'commanding - private' stamp: 'TD 10/6/2022 13:15:02'!
executeOn: aMarsRover 
	aMarsRover turnLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'MarsRover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'identification' stamp: 'TD 10/6/2022 13:14:38'!
canHandle: aCommand
	^(aCommand = $l)! !


!classDefinition: #Right category: 'MarsRover'!
Command subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Right methodsFor: 'commanding - private' stamp: 'TD 10/6/2022 13:16:45'!
executeOn: aMarsRover 
	aMarsRover turnRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'MarsRover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'identification' stamp: 'TD 10/6/2022 13:16:27'!
canHandle: aCommand
	^(aCommand = $r)! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'TD 10/6/2022 13:35:26'!
initializeAt: aPoint pointing: aDirection 
	position := aPoint.
	orientation := aDirection for: self.! !


!MarsRover methodsFor: 'instructions' stamp: 'TD 10/6/2022 13:28:52'!
performCommand: aCommand

	^ (Command for: aCommand) executeOn: self! !

!MarsRover methodsFor: 'instructions' stamp: 'TD 10/6/2022 13:29:10'!
sendCommandSequence: aCommandSequence
	aCommandSequence do: [:aCommand | [self performCommand: aCommand] ifError: [^self]].
	! !


!MarsRover methodsFor: 'status' stamp: 'FM 10/3/2022 21:39:30'!
orientation
	^orientation direction.! !

!MarsRover methodsFor: 'status' stamp: 'FM 10/3/2022 20:45:21'!
position
	^position.! !


!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/6/2022 13:14:05'!
moveBackwards
	orientation moveBackwardTowards.! !

!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/6/2022 13:12:35'!
moveForward
	orientation moveForwardTowards.! !

!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/5/2022 00:33:37'!
movePointingEast
	position := position + (1@0).! !

!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/5/2022 00:36:20'!
movePointingNorth
	position := position + (0@1).! !

!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/5/2022 00:33:44'!
movePointingSouth
	position := position + (0@-1).! !

!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/6/2022 13:56:05'!
movePointingWest
	position := position + (-1@0).! !

!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/6/2022 13:38:02'!
turnLeft
	orientation := orientation leftNext.! !

!MarsRover methodsFor: 'instructions - private' stamp: 'TD 10/6/2022 13:38:10'!
turnRight
	orientation := orientation rightNext.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'TD 10/6/2022 13:35:15'!
at: aPoint pointing: aDirection 
	^self new initializeAt: aPoint pointing: aDirection.! !


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

!PuntoCardinal class methodsFor: 'instance creation' stamp: 'TD 10/6/2022 14:11:59'!
for: aRover
	self subclassResponsibility.! !


!classDefinition: #East category: 'MarsRover'!
PuntoCardinal subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:50:39'!
direction
	^'E'.! !

!East methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:31:33'!
leftNext
	^North for: rover.! !

!East methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:51:57'!
moveBackwardTowards
	rover movePointingWest.! !

!East methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:52:17'!
moveForwardTowards
	rover movePointingEast.! !

!East methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:31:41'!
rightNext
	^South for: rover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'identification - private' stamp: 'TD 10/5/2022 01:06:53'!
canHandle: aDirection
	^(aDirection = 'E')! !


!East class methodsFor: 'instance creation' stamp: 'TD 10/6/2022 13:33:02'!
for: aMarsRover 
	^self new initializeFor: aMarsRover ! !


!classDefinition: #North category: 'MarsRover'!
PuntoCardinal subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:53:22'!
direction
	^'N'.! !

!North methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:31:53'!
leftNext
	^West for: rover.! !

!North methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:54:07'!
moveBackwardTowards
	rover movePointingSouth.! !

!North methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:53:56'!
moveForwardTowards
	rover movePointingNorth.! !

!North methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:32:00'!
rightNext
	^East for: rover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'identification - private' stamp: 'TD 10/5/2022 01:03:15'!
canHandle: aDirection 
	^(aDirection = 'N').! !


!North class methodsFor: 'instance creation' stamp: 'TD 10/6/2022 13:37:03'!
for: aMarsRover 

	^self new initializeFor: aMarsRover ! !


!classDefinition: #South category: 'MarsRover'!
PuntoCardinal subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:54:17'!
direction
	^'S'.! !

!South methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:32:09'!
leftNext
	^East for: rover.! !

!South methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:54:55'!
moveBackwardTowards
	rover movePointingNorth.! !

!South methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:55:06'!
moveForwardTowards
	rover movePointingSouth.! !

!South methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:32:16'!
rightNext
	^West for: rover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRover'!
South class
	instanceVariableNames: ''!


!South class methodsFor: 'instance creation' stamp: 'TD 10/6/2022 13:44:18'!
for: aMarsRover 
	^self new initializeFor: aMarsRover ! !


!classDefinition: #West category: 'MarsRover'!
PuntoCardinal subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:55:38'!
direction
	^'O'.! !

!West methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:32:24'!
leftNext
	^South for: rover.! !

!West methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:55:59'!
moveBackwardTowards
	rover movePointingEast.! !

!West methodsFor: 'as yet unclassified' stamp: 'TD 10/5/2022 00:56:09'!
moveForwardTowards
	rover movePointingWest.! !

!West methodsFor: 'as yet unclassified' stamp: 'TD 10/6/2022 13:32:32'!
rightNext
	^North for: rover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRover'!
West class
	instanceVariableNames: ''!


!West class methodsFor: 'instance creation' stamp: 'TD 10/6/2022 13:33:33'!
for: aMarsRover 
	^self new initializeFor: aMarsRover ! !
