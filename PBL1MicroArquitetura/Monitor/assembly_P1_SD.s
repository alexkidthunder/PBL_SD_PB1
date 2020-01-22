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
.equ E, 0x45
.equ R, 0x52

.equ P, 0x50
.equ R, 0x52
.equ E, 0x45
.equ S, 0x53
.equ S, 0x53

.equ S, 0x53
.equ T,	0x54
.equ A, 0x41
.equ R,	0x52
.equ T,	0x54


.equ clear, 0x01 # comando para limpar o display
.equ space, 0x20

.text


# custom <id da instrução> <result> <dataA> <dataB>

# Nesta label a instrução customizada é chamada com os parâmetros dos registradores r0 e r3
# Nesse caso r0 indica ao lcd que está sendo enviado um comando e r3 equivale ao comando a ser executado

main:

	addi r14, r0, 1 

	movia r5, 0x2030 # endereço de memórios dos botões
	
	movia r3, clear # Limpa o display
	custom 0, r2, r0, r3
	
	movia r3, 0x0C
	custom 0, r2, r14, r3

	movia r3, 0x0C
	custom 0, r2, r14, r3
	
	movia r3, 0x00
	custom 0, r2, r14, r3
	
	custom 0, r2, r14, r4

	br funcao

	
	
funcao:
	movia r4, 1
	
	
	
	nextpc r8 # pega o endereço da próxima instrução

	addi r10, r0, 0
	movia r7, 400000
	
	ldbuio r3, 0(r5) # carrega a situação dos botões

	addi r7, r0, 2
	beq r3, r7, texto 	
	callr r8

	ret
	
	
texto:

	movia r3, clear
	custom 0, r2, r0, r3
	
	movia r3, P
	custom 0, r2, r14, r3
	
	movia r3, R
	custom 0, r2, r14, r3

	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, S
	custom 0, r2, r14, r3

	movia r3, S
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, S
	custom 0, r2, r14, r3
	
	movia r3, T
	custom 0, r2, r14, r3
	
	movia r3, A
	custom 0, r2, r14, r3
	
	movia r3, R
	custom 0, r2, r14, r3
	
	movia r3, T
	custom 0, r2, r14, r3
	
	nextpc r8 #  guarda o endereço da instrução de leitura dos botões
	
	ldbuio r3, 0(r5) # verifica os botões
	
	beq r3, r14, funcao 
	
	callr r8 