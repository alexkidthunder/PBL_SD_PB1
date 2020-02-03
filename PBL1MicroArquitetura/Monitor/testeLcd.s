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


# custom <id da instrução> <result> <dataA> <dataB>

# Nesta label a instrução customizada é chamada com os parâmetros dos registradores r0 e r3
# Nesse caso r0 indica ao lcd que está sendo enviado um comando e r3 equivale ao comando a ser executado

main:

	addi r14, r0, 1 

	movia r5, 0x2030 
	
	movia r3, clear 

	custom 0, r0, r0, r1

	custom 1, r0, r0, r1

	br funcao
	
	
funcao:

	movia r4, 1
	nextpc r8 

	addi r10, r0, 0
	movia r7, 400000
	
	ldbuio r3, 0(r5) 

	addi r7, r0, 2
	
	callr r8

	br end
	
end:
	br end
	.end	
	
