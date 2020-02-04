.data

.global main

# .equ <nome> <valor hex>
# Este bloco armazena os valores, na sua forma hexadecimal

.equ G, 0x47
.equ A, 0x41
.equ M, 0x4D
.equ E, 0x45

.equ O, 0x4F
.equ V, 0x56
.equ R, 0x52

.equ P, 0x50
.equ S, 0x53

.equ T,	0x54


.equ clear, 0x01 # comando para limpar o display
.equ space, 0x20

.text


# Instrução customizada é atravez de ==> custom <id da instrução> <result> <dataA> <dataB>

# A instrução customizada é chamada com os parâmetros dos registradores r0 e r3
# Com isso, r0 indica ao lcd que está sendo enviado um comando e r3 equivale ao comando a ser executado

main:

	addi r14, r0, 1 

	movia r5, 0x1830 # endereço de memórios dos botões
	
	movia r3, 0x30
	custom 0, r2, r0, r3
	custom 0, r2, r0, r3

	movia r3, 0x39
	custom 0, r2, r0, r3

	movia r3, 0x14
	custom 0, r2, r0, r3

	movia r3, 0x56
	custom 0, r2, r0, r3

	movia r3, 0x6D
	custom 0, r2, r0, r3

	movia r3, 0x70
	custom 0, r2, r0, r3

	movia r3, 0x0C
	custom 0, r2, r0, r3

	movia r3, 0x06
	custom 0, r2, r0, r3

	movia r3, 0x01
	custom 0, r2, r0, r3

	br funcao
	
	
funcao:

	movia r4, 1
	nextpc r8 

	addi r10, r0, 0
	movia r7, 400000
	
	addi r7, r0, 2
	
	beq r3, r7, frase_GameOver: 
	
	ldbuio r3, 0(r5) 

	addi r7, r0, 2
	
	callr r8

	br end
	
	
# r14 indica que está sendo enviado um dado e r3 é o dado a ser escrito no display
	
frase_GameOver:

	movia r3, clear
	custom 0, r2, r0, r3
	
	movia r3, G
	custom 0, r2, r14, r3
	
	movia r3, A
	custom 0, r2, r14, r3

	movia r3, M
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, V
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, R
	custom 0, r2, r14, r3
	
	nextpc r8
	
	ldbuio r3, 0(r5)
	
	beq r3, r14, led2
	
	callr r8
	
end:
	br end
	.end	
	
