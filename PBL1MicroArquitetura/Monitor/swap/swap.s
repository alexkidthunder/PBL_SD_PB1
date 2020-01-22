.global main

#Quando a primitiva .data é chamada, os valores abaixando são salvos diretamente na memoria.
.data
values: .word 25, 13 # VETOR; vales[] = {25,13}
.text

main:
	# R2 COMO PONTEIRO, APONTANDO PARA O VETOR DECLARADO 
	movia r2, values
	# R3 = VALUES[0]
	ldw r3, 0(r2)
	# R4 = VALUES[1]
	ldw r4, 4(r2)
	# IF (R3 > R4)THEN GOTO SWAP
	bgt r3, r4, swap
	#ELSE GOTO END
	br end

swap:
	#VALUES[0] = R4
	stw r4, 0(r2)
	#VALUES[1] = R3
	stw r3, 4(r2)
	#GOTO END
	br end

end:
	br end
	.end	
