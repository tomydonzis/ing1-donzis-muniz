!classDefinition: #Falso category: 'EjercicioVerdaderoFalso'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioVerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: 'EjercicioVerdaderoFalso'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'protocolo' stamp: 'FM 8/22/2022 20:37:32'!
no
	^Verdadero.! !

!Falso class methodsFor: 'protocolo' stamp: 'FM 8/22/2022 20:51:45'!
y: unBooleano
	^Falso.! !


!Falso class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 21:49:57'!
siFalso: aBlockClosure 
	^aBlockClosure value.! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 21:47:33'!
siVerdadero: aBlockClosure! !


!Falso class methodsFor: 'error handling' stamp: 'FM 8/22/2022 21:46:48'!
error: aString 
	self shouldBeImplemented.! !


!classDefinition: #Verdadero category: 'EjercicioVerdaderoFalso'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioVerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: 'EjercicioVerdaderoFalso'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'protocolo' stamp: 'FM 8/22/2022 20:34:41'!
no
	^Falso.! !

!Verdadero class methodsFor: 'protocolo' stamp: 'FM 8/22/2022 21:43:50'!
siFalso: aBlockClosure ! !

!Verdadero class methodsFor: 'protocolo' stamp: 'FM 8/22/2022 21:38:10'!
siVerdadero: aBlockClosure 
	^aBlockClosure value.! !

!Verdadero class methodsFor: 'protocolo' stamp: 'FM 8/22/2022 20:46:40'!
y: unBooleano
	^unBooleano.! !


!classDefinition: #VerdaderoFalsoTest category: 'EjercicioVerdaderoFalso'!
DenotativeObject subclass: #VerdaderoFalsoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioVerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VerdaderoFalsoTest class' category: 'EjercicioVerdaderoFalso'!
VerdaderoFalsoTest class
	instanceVariableNames: ''!

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 20:30:29'!
test01VerdaderoNegadoEsFalso

	Assert that: Verdadero no isEqualTo: Falso.! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 20:37:09'!
test02FalsoNegadoEsVerdadero

	Assert that: Falso no isEqualTo: Verdadero.! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 20:44:11'!
test03VerdaderoYVerdaderoEsVerdadero
	Assert that: (Verdadero y:Verdadero) isEqualTo: Verdadero.! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 20:47:53'!
test04VerdaderoYFalsoEsFalso
	Assert that: (Verdadero y:Falso) isEqualTo: Falso.! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 20:49:07'!
test05FalsoYFalsoEsFalso
	Assert that: (Falso y:Falso) isEqualTo: Falso.! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 20:49:21'!
test06FalsoYVerdaderoEsFalso
	Assert that: (Falso y:Verdadero) isEqualTo: Falso.! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 21:37:40'!
test07VerdaderoSiVerdaderoEjecutaClosure
	|contador|
	contador:=0.
	Assert that: (Verdadero siVerdadero:[contador:=contador+1. contador]) isEqualTo: contador.! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 21:46:28'!
test08VerdaderoSiFalsoNoEjecutaClosure
	|contador|
	contador:=0.
	Assert that: (Verdadero siFalso:[contador:=contador+1. contador]) isNotEqualTo: contador.! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 21:46:19'!
test09FalsoSiVerdaderoNoEjecutaClosure
	|contador|
	contador:=0.
	Assert that: (Falso siVerdadero:[contador:=contador+1. contador]) isNotEqualTo: contador.! !

!VerdaderoFalsoTest class methodsFor: 'as yet unclassified' stamp: 'FM 8/22/2022 21:49:25'!
test10FalsoSiFalsoNoEjecutaClosure
	|contador|
	contador:=0.
	Assert that: (Falso siFalso:[contador:=contador+1. contador.]) isEqualTo: contador.! !
