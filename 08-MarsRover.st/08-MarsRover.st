!classDefinition: #MarsRoverLoggerTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLoggerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:40'!
test01loggerWithMarsRoverOnInitialPositionIsEmptyInPositionMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverPositionLogger for: marsRover.
	marsRover process:''.
	self assert: (logger observeRover) isEmpty.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:40'!
test02loggerWithMarsRoverMovingForwardOnceHasCorrectSingleLogInPositionMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverPositionLogger for: marsRover.
	marsRover process: 'f'.
	self assert: (OrderedCollection with: 1@2) equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test03loggerWithMarsRoverMovingForwardTwiceHasCorrectLogsInPositionMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverPositionLogger for: marsRover.
	marsRover process: 'ff'.
	self assert: (OrderedCollection with: 1@2 with: 1@3) equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test04loggerWithMarsRoverMovingBackwardsOnceHasCorrectLogsInPositionMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverPositionLogger for: marsRover.
	marsRover process: 'b'.
	self assert: (OrderedCollection with: 1@0) equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:40'!
test05loggerWithMarsRoverMovingBackwardsTwiceHasCorrectLogsInPositionMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverPositionLogger for: marsRover.
	marsRover process: 'bb'.
	self assert: (OrderedCollection with: 1@0 with:1@-1) equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test06loggerWithMarsRoverRotatingClockwiseOnceHasCorrectLogsInOrientationMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverOrientationLogger for: marsRover.
	marsRover process: 'r'.
	self assert: (OrderedCollection with:'East') equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test07loggerWithMarsRoverRotatingAnticlockwiseOnceHasCorrectLogsInOrientationMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverOrientationLogger for: marsRover.
	marsRover process: 'l'.
	self assert: (OrderedCollection with:'West') equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test08loggerWithMarsRoverRotatingAnticlockwiseTwiceHasCorrectLogsInOrientationMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverOrientationLogger for: marsRover.
	marsRover process: 'll'.
	self assert: (OrderedCollection with:'West' with:'South') equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test09loggerWithMarsRoverMovingForwardHasEmptyLogInOrientationMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverOrientationLogger for: marsRover.
	marsRover process: 'f'.
	self assert: (OrderedCollection new) equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:40'!
test10loggerWithMarsRoverMovingBackwardsAndRotatesRightHasCorrectLogInOrientationMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverOrientationLogger for: marsRover.
	marsRover process: 'br'.
	self assert: (OrderedCollection with: 'East') equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test11loggerWithMarsRoverRotatingRightHasEmptyLogsInPositionMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverPositionLogger for: marsRover.
	marsRover process: 'r'.
	self assert: (OrderedCollection new) equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test12loggerWithMarsRoverRotatingLeftAndMovingForwardHasCorrectLogsInPosoriMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverPosoriLogger for: marsRover.
	marsRover process: 'lf'.
	self assert: (OrderedCollection with:'West' with:0@1) equals: (logger observeRover).! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test13loggerWithMarsRoverRotatingRightAndMovingBackwardsHasCorrectLogsInPosoriMode
	|marsRover logger |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverPosoriLogger for: marsRover.
	marsRover process: 'rb'.
	self assert: (OrderedCollection with:'East' with:0@1) equals: (logger observeRover).! !


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


!classDefinition: #MarsRoverTrackingWindowTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTrackingWindowTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:40'!
test01trackingWindowTrackingMarsRoverOnInitialPositionDisplaysNothingOnPosoriMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowPosori for: marsRover.
	
	self assert: 'Position: . Heading: .' equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test02trackingWindowTrackingMarsRoverMovingForwardOnceDisplaysRightPositionAndEmptyOrientationOnPosoriMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowPosori for: marsRover.
	marsRover process: 'f'.
	
	self assert: ('Position: ', (1@2) asString, '. Heading: .') equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test03trackingWindowTrackingMarsRoverMovingForwardAndBackwardDisplaysCorrectPositionOnPosoriMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowPosori for: marsRover.
	marsRover process: 'fb'.
	
	self assert: ('Position: ', (1@1) asString, '. Heading: .') equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test04trackingWindowTrackingMarsRoverRotatingLeftDisplaysCorrectHeadingOnPosoriMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowPosori for: marsRover.
	marsRover process: 'l'.
	
	self assert: 'Position: . Heading: West.' equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test05trackingWindowTrackingMarsRoverRotatingRightDisplaysCorrectOrientationOnPosoriMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowPosori for: marsRover.
	marsRover process: 'r'.
	
	self assert: 'Position: . Heading: East.' equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:40'!
test06trackingWindowTrackingMarsRoverDoingActualStuffDisplaysCorrectPositionAndHeadingOnPosoriMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowPosori for: marsRover.
	marsRover process: 'frflbrrfflfblfrbbbl'.
	
	self assert: 'Position: -1@0. Heading: North.' equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test07trackingWindowTrackingMarsRoverOnInitialPositionDisplaysNothingOnPositionMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowPosition for: marsRover.
	
	self assert: 'Position: .' equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test08trackingWindowTrackingMarsRoverMovingForwardOnceDisplaysRightPositionOnPositionMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowPosition for: marsRover.
	marsRover process: 'f'.
	
	self assert: ('Position: ', (1@2) asString, '.') equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test09trackingWindowTrackingMarsRoverMovingForwardOnceAndRotatingDisplaysRightPositionOnPositionMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowPosition for: marsRover.
	marsRover process: 'frrrrrrrrrrrrrrrrrrr'.
	
	self assert: ('Position: ', (1@2) asString, '.') equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:40'!
test10trackingWindowTrackingMarsRoverOnInitialPositionDisplaysNothingOnOrientationMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowOrientation for: marsRover.
	
	self assert: 'Heading: .' equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:41'!
test11trackingWindowTrackingMarsRoverRotatingLeftDisplaysCorrectHeadingOnOrientationMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowOrientation for: marsRover.
	marsRover process: 'l'.
	
	self assert: 'Heading: West.' equals: trackingWindow observeRover.! !

!MarsRoverTrackingWindowTest methodsFor: 'tests' stamp: 'TD 10/27/2022 14:53:40'!
test12trackingWindowTrackingMarsRoverRotatingOnceAndMovingDisplaysRightOrientationOnOrientationMode
	| marsRover trackingWindow |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	trackingWindow := TrackingWindowOrientation for: marsRover.
	marsRover process: 'rffffffffffffffffffffffffff'.
	
	self assert: ('Heading: East.') equals: trackingWindow observeRover.! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head positionLoggers headLoggers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'TD 10/27/2022 13:41:41'!
initializeAt: aPosition heading: aHeadingType
	position := aPosition.
	head := aHeadingType for: self.
	
	positionLoggers := OrderedCollection new.
	headLoggers := OrderedCollection new.! !


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

!MarsRover methodsFor: 'heading' stamp: 'TD 10/27/2022 15:11:32'!
rotateLeft
	
	head rotateLeft.
	self updateHeadLoggers.! !

!MarsRover methodsFor: 'heading' stamp: 'TD 10/27/2022 15:11:32'!
rotateRight
	
	head rotateRight.
	self updateHeadLoggers.! !

!MarsRover methodsFor: 'heading' stamp: 'TD 10/27/2022 15:11:32'!
updateHeadLoggers

	^headLoggers do: [:aHeadLoggerBlock | aHeadLoggerBlock value: head].! !


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


!MarsRover methodsFor: 'moving' stamp: 'TD 10/27/2022 15:12:16'!
moveBackward
	
	head moveBackward.
	self updatePositionLoggers.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:01'!
moveEast
	
	position := position + (1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'TD 10/27/2022 15:12:16'!
moveForward
	
	head moveForward.
	self updatePositionLoggers.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:12'!
moveNorth
	
	position := position + (0@1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:34'!
moveSouth
	
	position := position + (0@-1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:32'!
moveWest
	
	position := position + (-1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'TD 10/27/2022 15:12:16'!
updatePositionLoggers

	^positionLoggers do: [:aPositionLoggerBlock | aPositionLoggerBlock value: position].! !


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


!MarsRover methodsFor: 'logging' stamp: 'TD 10/27/2022 13:41:10'!
getHeadLoggedBy: aHeadLoggerBlock 
	headLoggers add: aHeadLoggerBlock.! !

!MarsRover methodsFor: 'logging' stamp: 'TD 10/27/2022 13:39:00'!
getPositionLoggedBy: aPositionLoggerBlock 
	positionLoggers add: aPositionLoggerBlock.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


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


!classDefinition: #MarsRoverObserver category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverObserver
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverObserver methodsFor: 'logging' stamp: 'TD 10/27/2022 14:53:39'!
observeRover
	self subclassResponsibility.! !

!MarsRoverObserver methodsFor: 'logging' stamp: 'TD 10/27/2022 00:29:48'!
updateOrientation: anOrientation 
	self subclassResponsibility.! !

!MarsRoverObserver methodsFor: 'logging' stamp: 'TD 10/27/2022 00:29:51'!
updatePosition: aPosition 
	self subclassResponsibility.! !


!MarsRoverObserver methodsFor: 'initialization' stamp: 'TD 10/27/2022 14:02:26'!
initializeFor: aMarsRover
	marsRover := aMarsRover.! !

!MarsRoverObserver methodsFor: 'initialization' stamp: 'TD 10/27/2022 14:59:12'!
logHeadFromRover

	^ marsRover getHeadLoggedBy: [:anOrientation | self updateOrientation: (anOrientation identification)]! !

!MarsRoverObserver methodsFor: 'initialization' stamp: 'TD 10/27/2022 14:59:16'!
logPositionFromRover

	^ marsRover getPositionLoggedBy: [:aPosition | self updatePosition: aPosition]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverObserver class' category: 'MarsRover-WithHeading'!
MarsRoverObserver class
	instanceVariableNames: ''!

!MarsRoverObserver class methodsFor: 'instance creation' stamp: 'TD 10/27/2022 00:35:29'!
for: aMarsRover
	self subclassResponsibility.! !


!classDefinition: #MarsRoverLogger category: 'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverLogger
	instanceVariableNames: 'logs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLogger methodsFor: 'initialization' stamp: 'TD 10/27/2022 14:02:42'!
initializeFor: aMarsRover
	super initializeFor: aMarsRover.
	logs := OrderedCollection new.! !


!MarsRoverLogger methodsFor: 'logging' stamp: 'TD 10/27/2022 14:53:40'!
observeRover
	^logs.! !

!MarsRoverLogger methodsFor: 'logging' stamp: 'TD 10/27/2022 13:35:41'!
updateOrientation: anOrientation 
	logs add: anOrientation.! !

!MarsRoverLogger methodsFor: 'logging' stamp: 'TD 10/27/2022 13:35:36'!
updatePosition: aPosition 
	logs add: aPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverLogger class' category: 'MarsRover-WithHeading'!
MarsRoverLogger class
	instanceVariableNames: ''!

!MarsRoverLogger class methodsFor: 'instance creation' stamp: 'TD 10/27/2022 13:38:12'!
for: aMarsRover
	^self new initializeFor: aMarsRover.! !


!classDefinition: #MarsRoverOrientationLogger category: 'MarsRover-WithHeading'!
MarsRoverLogger subclass: #MarsRoverOrientationLogger
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverOrientationLogger methodsFor: 'logging' stamp: 'TD 10/27/2022 14:55:45'!
initializeFor: aMarsRover
	super initializeFor: aMarsRover.
	self logHeadFromRover.! !


!classDefinition: #MarsRoverPositionLogger category: 'MarsRover-WithHeading'!
MarsRoverLogger subclass: #MarsRoverPositionLogger
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPositionLogger methodsFor: 'logging' stamp: 'TD 10/27/2022 14:56:35'!
initializeFor: aMarsRover
	super initializeFor: aMarsRover.
	self logPositionFromRover.! !


!classDefinition: #MarsRoverPosoriLogger category: 'MarsRover-WithHeading'!
MarsRoverLogger subclass: #MarsRoverPosoriLogger
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPosoriLogger methodsFor: 'logging' stamp: 'TD 10/27/2022 14:56:56'!
initializeFor: aMarsRover
	super initializeFor: aMarsRover.
	self logPositionFromRover.
	self logHeadFromRover.! !


!classDefinition: #TrackingWindow category: 'MarsRover-WithHeading'!
MarsRoverObserver subclass: #TrackingWindow
	instanceVariableNames: 'orientation position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!TrackingWindow methodsFor: 'initialization' stamp: 'TD 10/27/2022 14:02:19'!
initializeFor: aMarsRover
	super initializeFor: aMarsRover.
	position := ''.
	orientation := ''.! !


!TrackingWindow methodsFor: 'logging' stamp: 'TD 10/27/2022 14:53:40'!
observeRover
	self subclassResponsibility.! !

!TrackingWindow methodsFor: 'logging' stamp: 'TD 10/27/2022 00:25:31'!
updateOrientation: anOrientation
	orientation := anOrientation.! !

!TrackingWindow methodsFor: 'logging' stamp: 'TD 10/27/2022 00:25:42'!
updatePosition: aPosition 
	position := aPosition asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TrackingWindow class' category: 'MarsRover-WithHeading'!
TrackingWindow class
	instanceVariableNames: ''!

!TrackingWindow class methodsFor: 'instance creation' stamp: 'TD 10/26/2022 17:07:01'!
for: aMarsRover
	^self new initializeFor: aMarsRover ! !


!classDefinition: #TrackingWindowOrientation category: 'MarsRover-WithHeading'!
TrackingWindow subclass: #TrackingWindowOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!TrackingWindowOrientation methodsFor: 'initialization' stamp: 'TD 10/27/2022 14:57:43'!
initializeFor: aMarsRover
	super initializeFor: aMarsRover.
	self logHeadFromRover.! !


!TrackingWindowOrientation methodsFor: 'logging' stamp: 'TD 10/27/2022 14:53:40'!
observeRover
	^'Heading: ', orientation, '.'! !


!classDefinition: #TrackingWindowPosition category: 'MarsRover-WithHeading'!
TrackingWindow subclass: #TrackingWindowPosition
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!TrackingWindowPosition methodsFor: 'initialization' stamp: 'TD 10/27/2022 14:58:08'!
initializeFor: aMarsRover
	super initializeFor: aMarsRover.
	self logPositionFromRover.! !


!TrackingWindowPosition methodsFor: 'logging' stamp: 'TD 10/27/2022 14:53:40'!
observeRover
	^'Position: ', position, '.'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TrackingWindowPosition class' category: 'MarsRover-WithHeading'!
TrackingWindowPosition class
	instanceVariableNames: ''!

!TrackingWindowPosition class methodsFor: 'instance creation' stamp: 'TD 10/27/2022 00:09:06'!
for: aMarsRover 
	^self new initializeFor: aMarsRover ! !


!classDefinition: #TrackingWindowPosori category: 'MarsRover-WithHeading'!
TrackingWindow subclass: #TrackingWindowPosori
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!TrackingWindowPosori methodsFor: 'logging' stamp: 'TD 10/27/2022 14:53:40'!
observeRover
	^'Position: ', position, '. Heading: ', orientation, '.'.! !


!TrackingWindowPosori methodsFor: 'initialization' stamp: 'TD 10/27/2022 14:58:38'!
initializeFor: aMarsRover
	super initializeFor: aMarsRover.
	self logPositionFromRover .
	self logHeadFromRover.! !
