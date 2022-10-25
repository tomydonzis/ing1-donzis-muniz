!classDefinition: #MarsRoverLoggerTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLoggerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:52:06'!
test01loggerWithMarsRoverOnInitialPositionIsEmptyInPositionMode
	|marsRover logger |
	logger := MarsRoverPositionLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process:''.
	self assert: (logger logs) isEmpty.! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:52:13'!
test02loggerWithMarsRoverMovingForwardOnceHasCorrectSingleLogInPositionMode
	|marsRover logger |
	logger := MarsRoverPositionLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'f'.
	self assert: (OrderedCollection with: 1@2) equals: (logger logs).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:52:17'!
test03loggerWithMarsRoverMovingForwardTwiceHasCorrectLogsInPositionMode
	|marsRover logger |
	logger := MarsRoverPositionLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'ff'.
	self assert: (OrderedCollection with: 1@2 with: 1@3) equals: (logger logs).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:51:42'!
test04loggerWithMarsRoverMovingBackwardsOnceHasCorrectLogsInPositionMode
	|marsRover logger |
	logger := MarsRoverPositionLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'b'.
	self assert: (OrderedCollection with: 1@0) equals: (logger logs).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:51:39'!
test05loggerWithMarsRoverMovingBackwardsTwiceHasCorrectLogsInPositionMode
	|marsRover logger |
	logger := MarsRoverPositionLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'bb'.
	self assert: (OrderedCollection with: 1@0 with:1@-1) equals: (logger logs).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:51:31'!
test06loggerWithMarsRoverRotatingClockwiseOnceHasCorrectLogsInOrientationMode
	|marsRover logger |
	logger:= MarsRoverOrientationLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'r'.
	self assert: (OrderedCollection with:'East') equals: (logger logs).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:51:27'!
test07loggerWithMarsRoverRotatingAnticlockwiseOnceHasCorrectLogsInOrientationMode
	|marsRover logger |
	logger:= MarsRoverOrientationLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'l'.
	self assert: (OrderedCollection with:'West') equals: (logger logs).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:51:24'!
test08loggerWithMarsRoverRotatingAnticlockwiseTwiceHasCorrectLogsInOrientationMode
	|marsRover logger |
	logger:= MarsRoverOrientationLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'll'.
	self assert: (OrderedCollection with:'West' with:'South') equals: (logger logs).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:51:21'!
test09loggerWithMarsRoverMovingForwardHasEmptyLogInOrientationMode
	|marsRover logger |
	logger := MarsRoverOrientationLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'f'.
	self assert: (OrderedCollection new) equals: (logger logs).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:51:17'!
test10loggerWithMarsRoverMovingBackwardsAndRotatesRightHasCorrectLogInOrientationMode
	|marsRover logger |
	logger := MarsRoverOrientationLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'br'.
	self assert: (OrderedCollection with: 'East') equals: (logger logs).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 21:51:02'!
test11loggerWithMarsRoverRotatingRightHasEmptyLogsInPositionMode
	|marsRover logger |
	logger := MarsRoverPositionLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'r'.
	self assert: (OrderedCollection new) equals: (logger logs).! !

!MarsRoverLoggerTest methodsFor: 'as yet unclassified' stamp: 'FM 10/24/2022 22:00:57'!
test12loggerWithMarsRoverRotatingLeftAndMovingForwardHasCorrectLogsInPosoriMode
	|marsRover logger |
	logger := MarsRoverPosoriLogger new.
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth withLogger: logger.
	marsRover process: 'lf'.
	self assert: (OrderedCollection with:'West' with:0@1) equals: (logger logs).! !


!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head logger loggers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:10:49'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self ! !

!MarsRover methodsFor: 'initialization' stamp: 'FM 10/24/2022 20:22:32'!
initializeAt: aPosition heading: aHeadingType withLogger: aLogger 
	position := aPosition.
	head := aHeadingType for: self.
	logger := aLogger.! !


!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:02'!
headEast
	
	head := MarsRoverHeadingEast for: self! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:12'!
headNorth
	
	head := MarsRoverHeadingNorth for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:17'!
headSouth
	
	head := MarsRoverHeadingSouth for: self! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:24'!
headWest
	
	head := MarsRoverHeadingWest for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'FM 10/24/2022 21:57:15'!
rotateLeft
	
	head rotateLeft.
	logger addOrientationLog: (logger identify: head).! !

!MarsRover methodsFor: 'heading' stamp: 'FM 10/24/2022 21:57:20'!
rotateRight
	
	head rotateRight.
	logger addOrientationLog: (logger identify: head).! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'FM 10/24/2022 21:56:26'!
moveBackward
	
	head moveBackward.
	logger addPositionLog: position.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:01'!
moveEast
	
	position := position + (1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'FM 10/24/2022 21:56:19'!
moveForward
	
	head moveForward.
	logger addPositionLog: position.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:12'!
moveNorth
	
	position := position + (0@1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:34'!
moveSouth
	
	position := position + (0@-1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:32'!
moveWest
	
	position := position + (-1@0)! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !

!MarsRover class methodsFor: 'instance creation' stamp: 'FM 10/24/2022 20:16:33'!
at: aPosition heading: aHeadingType withLogger: aLogger
	
	^self new initializeAt: aPosition heading: aHeadingType withLogger: aLogger.! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'FM 10/24/2022 21:22:37'!
identification

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'FM 10/24/2022 21:21:54'!
identification
	^'East'.! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'FM 10/24/2022 21:22:05'!
identification
	^'North'.! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'FM 10/24/2022 21:22:13'!
identification
	^'South'.! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'FM 10/24/2022 21:22:23'!
identification
	^'West'.! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!classDefinition: #MarsRoverLogger category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverLogger
	instanceVariableNames: 'marsRover logs mode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLogger methodsFor: 'initialization' stamp: 'FM 10/24/2022 20:20:55'!
initialize
	logs := OrderedCollection new.! !


!MarsRoverLogger methodsFor: 'logging' stamp: 'FM 10/24/2022 21:59:12'!
addOrientationLog: anOrientation
	self subclassResponsibility.! !

!MarsRoverLogger methodsFor: 'logging' stamp: 'FM 10/24/2022 21:59:03'!
addPositionLog: aPosition
	self subclassResponsibility.! !

!MarsRoverLogger methodsFor: 'logging' stamp: 'FM 10/24/2022 21:23:09'!
identify: aHeadingType
	^aHeadingType identification.! !

!MarsRoverLogger methodsFor: 'logging' stamp: 'FM 10/24/2022 21:12:41'!
logs
	^logs.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverLogger class' category: 'MarsRover-WithHeading'!
MarsRoverLogger class
	instanceVariableNames: ''!

!MarsRoverLogger class methodsFor: 'instance creation' stamp: 'FM 10/24/2022 21:25:57'!
mode: aMode
	^self new initializeWithMode: aMode.! !


!classDefinition: #MarsRoverOrientationLogger category: 'MarsRover-WithHeading'!
MarsRoverLogger subclass: #MarsRoverOrientationLogger
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverOrientationLogger methodsFor: 'logging' stamp: 'FM 10/24/2022 21:58:16'!
addOrientationLog: anOrientation 
	logs add: anOrientation.! !

!MarsRoverOrientationLogger methodsFor: 'logging' stamp: 'FM 10/24/2022 21:58:29'!
addPositionLog: aPosition! !


!classDefinition: #MarsRoverPositionLogger category: 'MarsRover-WithHeading'!
MarsRoverLogger subclass: #MarsRoverPositionLogger
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPositionLogger methodsFor: 'logging' stamp: 'FM 10/24/2022 21:58:40'!
addOrientationLog: anOrientation! !

!MarsRoverPositionLogger methodsFor: 'logging' stamp: 'FM 10/24/2022 21:57:53'!
addPositionLog: aPosition
	logs add: aPosition.! !


!classDefinition: #MarsRoverPosoriLogger category: 'MarsRover-WithHeading'!
MarsRoverLogger subclass: #MarsRoverPosoriLogger
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPosoriLogger methodsFor: 'logging' stamp: 'FM 10/24/2022 22:00:02'!
addOrientationLog: anOrientation
	logs add: anOrientation! !

!MarsRoverPosoriLogger methodsFor: 'logging' stamp: 'FM 10/24/2022 22:00:15'!
addPositionLog: aPosition
	logs add: aPosition.! !
